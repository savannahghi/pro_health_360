import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/redux/actions/app_review_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_name_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/app_entry_point.dart';
import 'package:myafyahub/presentation/core/widgets/preload_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:misc_utilities/refresh_token_manager.dart';

import '../../../mock_utils.dart';

void main() {
  FlutterConfig.loadValueForTesting(<String, String>{'DEV_SENTRY_DNS': ''});

  setupFirebaseAuthMocks();

  const MethodChannel channel = MethodChannel('uni_links/messages');

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets(
    'AppEntryPoint should render correctly',
    (WidgetTester tester) async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method == 'getInitialLink') {
          return 'https//:bewell.co.ke/phoneLogin';
        }
        return null;
      });

      final GlobalKey<NavigatorState> navigatorKey =
          GlobalKey<NavigatorState>();
      final NavigatorObserver navigatorObserver = NavigatorObserver();

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      store.dispatch(AppReviewAction(
          lastLaunchDate: '2020-08-23 08:48:24.731',
          days: 0,
          launches: 0,
          shouldRateApp: true));

      await tester.pumpWidget(MaterialApp(
        home: Center(
          child: AppEntryPoint(
            appSetupData: devAppSetupData,
            appName: testAppName,
            appNavigatorKey: navigatorKey,
            appNavigatorObservers: <NavigatorObserver>[navigatorObserver],
            appStore: store,
          ),
        ),
      ));

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
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method == 'getLatestLink') {
          return 'https//:bewell.co.ke/phoneLogin';
        }

        return null;
      });
      channel.invokeMethod<String?>('getLatestLink');

      final GlobalKey<NavigatorState> navigatorKey =
          GlobalKey<NavigatorState>();
      final NavigatorObserver navigatorObserver = NavigatorObserver();

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await tester.pumpWidget(MaterialApp(
        home: Center(
          child: AppEntryPoint(
            appSetupData: devAppSetupData,
            appName: testAppName,
            appNavigatorKey: navigatorKey,
            appNavigatorObservers: <NavigatorObserver>[navigatorObserver],
            appStore: store,
          ),
        ),
      ));
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
}
