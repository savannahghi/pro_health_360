// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';

// Flutter imports:
import 'package:flutter/material.dart';
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
import 'package:myafyahub/infrastructure/connectivity/connectivity_interface.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
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
    required this.client,
  }) : super(key: key);

  final String appName;
  final GlobalKey<NavigatorState> appNavigatorKey;
  final List<NavigatorObserver> appNavigatorObservers;
  final Store<AppState> appStore;
  final BuildContext entryPointContext;
  final List<AppContext> thisAppContexts;
  final ConnectivityStatus connectivityStatus;
  final StreamChatClient client;

  @override
  _PreLoadAppState createState() => _PreLoadAppState();
}

class _PreLoadAppState extends State<PreLoadApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      StoreProvider.dispatch(
        context,
        CheckTokenAction(
          httpClient: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
          refreshTokenEndpoint:
              AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint,
        ),
      );
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
          builder: (BuildContext context, Widget? childWidget) {
            return UserExceptionDialog<AppState>(
              child: StreamChat(
                client: widget.client,
                child: childWidget,
              ),
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
