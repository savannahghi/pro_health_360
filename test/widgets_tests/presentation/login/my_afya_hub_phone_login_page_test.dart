// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/verify_phone_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/my_afya_hub_phone_login_page.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';

import '../../../mock_utils.dart';
import '../../../test_helpers.dart';

void main() {
  group('MyAfyaHubLoginPage', () {
    setupFirebaseAuthMocks();

    setUpAll(() async {
      await Firebase.initializeApp();
    });

    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('MyAfyaHubCountryPicker should render a list of countries',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPhoneLoginPage();
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final Finder phoneInputField = find.byKey(textFormFieldKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);

      expect(phoneInputField, findsOneWidget);
      expect(continueButton, findsOneWidget);

      await tester.showKeyboard(phoneInputField);
      await tester.enterText(phoneInputField, '0725999999');
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(selectCountryKey));
      await tester.pumpAndSettle();

      expect(find.byType(ListTile), findsNWidgets(6));
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();
      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('+254'), findsOneWidget);
    });
    testWidgets('should validate Phone Number', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPhoneLoginPage();
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder phoneInputField = find.byKey(textFormFieldKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);
      expect(phoneInputField, findsOneWidget);
      expect(continueButton, findsOneWidget);

      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('A PIN is required'), findsOneWidget);
      await tester.showKeyboard(phoneInputField);
      await tester.enterText(phoneInputField, '123456');
      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      await tester.showKeyboard(phoneInputField);
      await tester.enterText(phoneInputField, '1234567890');
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('Phone number is required'), findsNothing);
    });
    testWidgets('should validate PIN', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPhoneLoginPage();
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);
      expect(pinInputField, findsOneWidget);
      expect(continueButton, findsOneWidget);

      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('A PIN is required'), findsOneWidget);
      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '123');
      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '1234');
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('A PIN is required'), findsNothing);
    });

    testWidgets('should Navigate to Verify OTP Page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPhoneLoginPage();
              },
            ),
          ),
        ),
      );

      final Finder gestureDetector = find.byKey(verifyOTPGestureKey);
      await tester.tap(gestureDetector);
      await tester.pumpAndSettle();

      expect(find.byType(VerifyPhonePage), findsOneWidget);
    });
  });
}
