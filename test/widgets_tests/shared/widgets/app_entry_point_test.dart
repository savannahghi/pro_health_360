// Flutter imports:
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:misc_utilities/refresh_token_manager.dart';
// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_name_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/infrastructure/connecitivity/connectivity_interface.dart';
import 'package:myafyahub/infrastructure/connecitivity/mobile_connectivity_status.dart';
import 'package:myafyahub/presentation/core/widgets/app_entry_point.dart';
import 'package:myafyahub/presentation/core/widgets/preload_app.dart';

import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  FlutterConfig.loadValueForTesting(<String, String>{'DEV_SENTRY_DNS': ''});

  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets(
    'AppEntryPoint should render correctly',
    (WidgetTester tester) async {
      final GlobalKey<NavigatorState> navigatorKey =
          GlobalKey<NavigatorState>();
      final NavigatorObserver navigatorObserver = NavigatorObserver();

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      final ConnectivityStatus connectivityStatus =
          ConnectivityStatus.initial();

      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: AppEntryPoint(
              appSetupData: devAppSetupData,
              appName: testAppName,
              appNavigatorKey: navigatorKey,
              appNavigatorObservers: <NavigatorObserver>[navigatorObserver],
              appStore: store,
              connectivityStatus: connectivityStatus,
            ),
          ),
        ),
      );

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      RefreshTokenManger().listen.add(true);

      await tester.pumpAndSettle();

      final Finder silAppWrapperWidget = find.byType(AppWrapper);
      expect(silAppWrapperWidget, findsOneWidget);

      final Finder preLoadAppWidget = find.byType(PreLoadApp);
      expect(preLoadAppWidget, findsOneWidget);

      RefreshTokenManger().listen.add(true);

      await tester.pumpAndSettle();
      final Finder storeProviderWidget = find.byKey(globalStoreKey);
      expect(storeProviderWidget, findsWidgets);
    },
  );

  testWidgets(
    'AppEntryPoint should not render when paused',
    (WidgetTester tester) async {
      final GlobalKey<NavigatorState> navigatorKey =
          GlobalKey<NavigatorState>();
      final NavigatorObserver navigatorObserver = NavigatorObserver();

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      final ConnectivityStatus connectivityStatus =
          ConnectivityStatus.initial();

      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: AppEntryPoint(
              appSetupData: devAppSetupData,
              appName: testAppName,
              appNavigatorKey: navigatorKey,
              appNavigatorObservers: <NavigatorObserver>[navigatorObserver],
              appStore: store,
              connectivityStatus: connectivityStatus,
            ),
          ),
        ),
      );
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      RefreshTokenManger().listen.add(true);

      await tester.pumpAndSettle();

      final Finder silAppWrapperWidget = find.byType(AppWrapper);
      expect(silAppWrapperWidget, findsOneWidget);

      final Finder preLoadAppWidget = find.byType(PreLoadApp);
      expect(preLoadAppWidget, findsOneWidget);
      await tester.pumpAndSettle();
    },
  );

  testWidgets('should trigger connectivity changes',
      (WidgetTester tester) async {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    final NavigatorObserver navigatorObserver = NavigatorObserver();

    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    final MockConnectivityPlatform fakePlatform = MockConnectivityPlatform(
      connectivityValues: <ConnectivityResult>[
        ConnectivityResult.none,
        ConnectivityResult.mobile
      ],
    );
    ConnectivityPlatform.instance = fakePlatform;

    final MobileConnectivityStatus connectivityStatus =
        MobileConnectivityStatus(
      checkInternetCallback: () async => true,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: AppEntryPoint(
          appSetupData: devAppSetupData,
          appName: testAppName,
          appNavigatorKey: navigatorKey,
          appNavigatorObservers: <NavigatorObserver>[navigatorObserver],
          appStore: store,
          connectivityStatus: connectivityStatus,
        ),
      ),
    );

    await tester.pump(const Duration(minutes: 5));
  });
}
