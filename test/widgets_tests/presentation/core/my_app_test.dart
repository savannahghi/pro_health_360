// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:misc_utilities/refresh_token_manager.dart';

// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/connectivity_interface.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/my_app.dart';
import 'package:myafyahub/presentation/core/widgets/preload_app.dart';
import '../../../mock_utils.dart';

void main() {
  FlutterConfig.loadValueForTesting(<String, String>{'DEV_SENTRY_DNS': ''});

  setupFirebaseAuthMocks();

  const MethodChannel channel = MethodChannel('uni_links/messages');

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets(
    'MyApp should render correctly',
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
      final ConnectivityStatus connectivityStatus =
          ConnectivityStatus.initial();

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: MyApp(
              store: store,
              navigatorObserver: <NavigatorObserver>[navigatorObserver].first,
              navigatorKey: navigatorKey,
              appSetupData: devAppSetupData,
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
}
