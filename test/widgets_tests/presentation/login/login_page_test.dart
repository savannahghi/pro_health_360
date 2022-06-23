// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
// Project imports:
import 'package:pro_health_360/application/redux/actions/update_connectivity_action.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/onboarding/login/pages/login_page.dart';
import 'package:pro_health_360/presentation/onboarding/login/widgets/phone_login_error_widget.dart';
import 'package:pro_health_360/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import 'package:pro_health_360/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:pro_health_360/presentation/router/router_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('LoginPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
      final Map<String, Object> values = <String, Object>{'clientId': 1};
      SharedPreferences.setMockInitialValues(values);
      await setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('should validate Phone Number', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const LoginPage(),
      );
      await tester.pumpAndSettle();

      final Finder phoneInputField = find.byKey(textFormFieldKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);
      expect(phoneInputField, findsOneWidget);
      expect(continueButton, findsOneWidget);

      expect(find.text('Phone number is required'), findsNothing);

      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('Phone number is required'), findsOneWidget);
    });

    testWidgets('should validate PIN', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const LoginPage(),
      );
      await tester.pumpAndSettle();

      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);
      expect(pinInputField, findsOneWidget);
      expect(continueButton, findsOneWidget);

      expect(find.text('A PIN is required'), findsNothing);

      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('A PIN is required'), findsOneWidget);
    });

    testWidgets('should navigate to terms page if login request is successful',
        (WidgetTester tester) async {
      mockLoginResponse.addAll(<String, dynamic>{'getCurrentTerms': termsMock});
      mockLoginResponse.addAll(<String, dynamic>{
        'data': <String, dynamic>{'sendOTP': '123456'}
      });

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(mockLoginResponse),
          200,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: false,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
          hasSetNickName: true,
          currentOnboardingStage: CurrentOnboardingStage.Login,
        ),
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const LoginPage(),
        );
        await tester.pump();

        final Finder phoneInputField = find.byKey(textFormFieldKey);
        final Finder pinInputField = find.byKey(pinInputKey);
        final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);

        await tester.showKeyboard(phoneInputField);
        await tester.enterText(phoneInputField, '723456789');
        await tester.pumpAndSettle();

        await tester.showKeyboard(pinInputField);
        await tester.enterText(pinInputField, '1234');
        await tester.pumpAndSettle();

        await tester.ensureVisible(continueButton);
        await tester.tap(continueButton);
        await tester.pumpAndSettle();

        expect(find.byType(VerifyPhonePage), findsOneWidget);
      });
    });

    testWidgets(
        'should navigate to counter page in case of exponential back off and return to login after timer',
        (WidgetTester tester) async {
      mockLoginResponse.addAll(<String, dynamic>{'getCurrentTerms': termsMock});
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'message': '73: wrong PIN',
            'code': 73,
            'retryTime': 21.8990
          }),
          400,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
          hasSetNickName: true,
        ),
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return const Scaffold(
                body: LoginPage(),
              );
            },
          ),
        );
        await tester.pump();

        final Finder phoneInputField = find.byKey(textFormFieldKey);
        final Finder pinInputField = find.byKey(pinInputKey);
        final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);

        await tester.showKeyboard(phoneInputField);
        await tester.enterText(phoneInputField, '723456789');
        await tester.pumpAndSettle();

        await tester.showKeyboard(pinInputField);
        await tester.enterText(pinInputField, '1234');
        await tester.pumpAndSettle();

        await tester.ensureVisible(continueButton);
        await tester.tap(continueButton);

        await tester.pump(const Duration(seconds: 10));
        expect(find.byType(LoginPage), findsOneWidget);
        await tester.pump(const Duration(seconds: 24));
        await tester.pumpAndSettle();
        expect(find.byType(LoginPage), findsOneWidget);
      });
    });

    testWidgets('should navigate to PIN expired page if pin is expired',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(
            <String, dynamic>{'message': '48: pin expired', 'code': 48},
          ),
          400,
        ),
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const LoginPage(),
        );
        await tester.pump();

        final Finder phoneInputField = find.byKey(textFormFieldKey);
        final Finder pinInputField = find.byKey(pinInputKey);
        final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);

        await tester.showKeyboard(phoneInputField);
        await tester.enterText(phoneInputField, '723456789');
        await tester.pumpAndSettle();

        await tester.showKeyboard(pinInputField);
        await tester.enterText(pinInputField, '1234');
        await tester.pumpAndSettle();

        await tester.ensureVisible(continueButton);
        await tester.tap(continueButton);
        await tester.pumpAndSettle();

        expect(find.byType(PinExpiredPage), findsWidgets);
        expect(find.text(pinExpiredTitle), findsOneWidget);
        expect(find.byKey(changeMyPinButtonKey), findsOneWidget);
      });
    });

    testWidgets('should reset invalidCredentials when page loads',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'data': mockLoginResponse, 'code': 8}),
          400,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          home: Scaffold(body: LoginPage()),
        ),
      );

      // Should be false when we load up the page
      expect(store.state.onboardingState?.invalidCredentials, false);
      expect(find.byType(PhoneLoginErrorWidget), findsNothing);

      final Finder phoneInputField = find.byKey(textFormFieldKey);
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);

      await tester.showKeyboard(phoneInputField);
      await tester.enterText(phoneInputField, '723456789');
      await tester.pump();

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '1234');
      await tester.pump();

      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      // Should be true after incorrect login credentials are supplied
      expect(store.state.onboardingState?.invalidCredentials, true);
      expect(find.byType(LoginErrorWidget), findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '1');
      await tester.pumpAndSettle();

      // should be false when any input is changed in the page
      expect(store.state.onboardingState?.invalidCredentials, false);
      expect(find.byType(PhoneLoginErrorWidget), findsNothing);

      store.dispatch(UpdateOnboardingStateAction(invalidCredentials: true));

      await tester.pumpAndSettle();

      expect(find.byType(PhoneLoginErrorWidget), findsOneWidget);

      await tester.showKeyboard(phoneInputField);
      await tester.enterText(phoneInputField, '7');
      await tester.pumpAndSettle();

      // final sanity check
      expect(store.state.onboardingState?.invalidCredentials, false);
      expect(find.byType(PhoneLoginErrorWidget), findsNothing);
    });

    testWidgets(
        'should show snackbar if continue tapped and no internet connection',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: false));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          home: Scaffold(
            body: LoginPage(),
          ),
        ),
      );
      await tester.pump();

      final Finder phoneInputField = find.byKey(textFormFieldKey);
      final Finder pinInputField = find.byKey(pinInputKey);
      await tester.showKeyboard(phoneInputField);
      await tester.enterText(phoneInputField, '723456789');
      await tester.pumpAndSettle();

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '1234');
      await tester.pumpAndSettle();
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);

      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pump();

      expect(find.text(checkInternetText), findsOneWidget);
    });
  });
}
