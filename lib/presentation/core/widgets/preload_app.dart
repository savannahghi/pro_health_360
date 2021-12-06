// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:myafyahub/application/core/services/custom_client.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitialRouteViewModel>(
      converter: (Store<AppState> store) =>
          InitialRouteViewModel.fromStore(store.state),
      builder: (BuildContext context, InitialRouteViewModel vm) {
        if (vm.initialRoute == null || vm.initialRoute == UNKNOWN) {
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
          initialRoute: vm.initialRoute,
          navigatorKey: widget.appNavigatorKey,
          navigatorObservers: widget.appNavigatorObservers,
          localizationsDelegates: localizationDelegates,
          supportedLocales: locales,
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
