// Dart imports:
import 'dart:async';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
// Project imports:
import 'package:myafyahub/application/core/services/custom_client.dart';
import 'package:myafyahub/application/core/services/localization.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/onboarding/check_token_action.dart';
import 'package:myafyahub/application/redux/actions/update_connectivity_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/onboarding/initial_route_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_name_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/infrastructure/connecitivity/connectivity_interface.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class PreLoadApp extends StatefulWidget {
  const PreLoadApp({
    Key? key,
    required this.thisAppContexts,
    required this.appName,
    required this.appNavigatorKey,
    required this.appNavigatorObservers,
    required this.entryPointContext,
    required this.appStore,
    required this.connectivityStatus,
  }) : super(key: key);

  final String appName;
  final GlobalKey<NavigatorState> appNavigatorKey;
  final List<NavigatorObserver> appNavigatorObservers;
  final Store<AppState> appStore;
  final BuildContext entryPointContext;
  final List<AppContext> thisAppContexts;
  final ConnectivityStatus connectivityStatus;

  @override
  _PreLoadAppState createState() => _PreLoadAppState();
}

class _PreLoadAppState extends State<PreLoadApp> {
  BehaviorSubject<String> appInitialRoute = BehaviorSubject<String>();

  StreamSubscription<bool>? _connectivitySub;
  final String apiKey = FlutterConfig.get('STREAM_API_KEY') as String;

  /// Instance of [StreamChatClient] we created earlier. This contains information about
  /// our application and connection state.
  late StreamChatClient client;

  /// The channel we'd like to observe and participate.
  late Channel channel;

  @override
  void initState() {
    super.initState();
    _connectivitySub = widget.connectivityStatus
        .checkConnection()
        .asStream()
        .mergeWith(
          <Stream<bool>>[widget.connectivityStatus.onConnectivityChanged],
        )
        .distinct()
        .listen((bool hasConnection) {
          connectivityChanged(hasConnection: hasConnection);
        });

    client = stream.StreamChatClient(
      apiKey,
      logLevel: stream.Level.ALL,
    );

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      final String clientID =
          StoreProvider.state<AppState>(context)?.clientState?.id ?? '';
      final String chatRoomToken = StoreProvider.state<AppState>(context)
              ?.clientState
              ?.user
              ?.chatRoomToken ??
          '';
      StoreProvider.dispatch(
        context,
        CheckTokenAction(
          httpClient: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
          refreshTokenEndpoint:
              AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint,
        ),
      );

      /// Set the current user. In a production scenario, this should be done using
      /// a backend to generate a user token using our server SDK.
      /// Please see the following for more information:
      /// https://getstream.io/chat/docs/flutter-dart/tokens_and_authentication/?language=dart
      try {
        await client.connectUser(
          stream.User(id: clientID),
          chatRoomToken,
        );
      } on stream.StreamWebSocketError catch (e) {
        Sentry.captureException(
          e,
          hint: e.message,
        );
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    StoreProvider.dispatch(
      context,
      CheckTokenAction(
        httpClient: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
        refreshTokenEndpoint:
            AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint,
      ),
    );
  }

  @override
  void dispose() {
    _connectivitySub?.cancel();
    client.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitialRouteViewModel>(
      converter: (Store<AppState> store) =>
          InitialRouteViewModel.fromStore(store.state),
      builder: (BuildContext context, InitialRouteViewModel vm) {
        final String initialRoute =
            getInitialRoute(vm.currentIndex ?? 0, vm.initialRoute);
        if (initialRoute == UNKNOWN) {
          return MaterialApp(
            theme: AppTheme.getAppTheme(),
            home: const Scaffold(
              body: Center(child: SILPlatformLoader()),
            ),
            localizationsDelegates: localizationDelegates,
            supportedLocales: locales,
          );
        }

        return MaterialApp(
          theme: AppTheme.getAppTheme(),
          debugShowCheckedModeBanner: widget.appName == testAppName,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: initialRoute,
          navigatorKey: widget.appNavigatorKey,
          navigatorObservers: widget.appNavigatorObservers,
          localizationsDelegates: localizationDelegates,
          supportedLocales: locales,
          builder: (BuildContext context, Widget? widget) {
            return StreamChat(
              client: client,
              child: widget,
            );
          },
        );
      },
    );
  }

  void connectivityChanged({required bool hasConnection}) {
    StoreProvider.dispatch<AppState>(
      context,
      UpdateConnectivityAction(hasConnection: hasConnection),
    );

    if (!hasConnection) {
      showToast(connectionLostText);
    }
  }
}
