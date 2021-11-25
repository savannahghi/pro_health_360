// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/refresh_token_manager.dart';
import 'package:myafyahub/application/redux/actions/check_connectivity_action.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/infrastructure/connecitivity/connectivity_interface.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/core/services/localization.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_name_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';

class PreLoadApp extends StatefulWidget with WidgetsBindingObserver {
  const PreLoadApp({
    Key? key,
    required this.thisAppContexts,
    required this.appName,
    required this.appNavigatorKey,
    required this.appNavigatorObservers,
    required this.entryPointContext,
    required this.appState,
    required this.appStore,
    required this.connectivityStatus,
  }) : super(key: key);

  final String appName;
  final GlobalKey<NavigatorState> appNavigatorKey;
  final List<NavigatorObserver> appNavigatorObservers;
  final AppState appState;
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future<dynamic>.delayed(Duration.zero, () async {
      appInitialRoute.add(
        await getInitialRoute(
          widget.entryPointContext,
          widget.appState,
          widget.thisAppContexts,
        ),
      );
    });
  }

  @override
  void dispose() {
    _connectivitySub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      key: globalStoreKey,
      store: widget.appStore,
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) {
          return store.state;
        },
        builder: (BuildContext context, AppState appState) {
          return StreamBuilder<String>(
            stream: appInitialRoute.stream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              // listen for token expiry here
              RefreshTokenManger().listen.listen((dynamic value) {
                refreshTokenAndUpdateState(
                  value: value as bool,
                  context: context,
                  appContexts: widget.thisAppContexts,
                  signedIn: widget.appState.credentials!.isSignedIn!,
                  refreshToken: widget.appState.credentials!.refreshToken!,
                );
              });

              if (snapshot.data == null) {
                return MaterialApp(
                  theme: AppTheme.getAppTheme(widget.thisAppContexts),
                  home: const Scaffold(
                    body: Center(child: SILPlatformLoader()),
                  ),
                  localizationsDelegates: localizationDelegates,
                  supportedLocales: locales,
                );
              }

              return MaterialApp(
                theme: AppTheme.getAppTheme(widget.thisAppContexts),
                debugShowCheckedModeBanner: widget.appName == testAppName,
                onGenerateRoute: RouteGenerator.generateRoute,
                initialRoute: appInitialRoute.value,
                navigatorKey: widget.appNavigatorKey,
                navigatorObservers: widget.appNavigatorObservers,
                localizationsDelegates: localizationDelegates,
                supportedLocales: locales,
              );
            },
          );
        },
      ),
    );
  }
}
