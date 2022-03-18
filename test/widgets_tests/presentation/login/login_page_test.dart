// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_connectivity_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import 'package:myafyahub/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('LoginPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
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
      mockLoginResponse.addAll(
        <String, dynamic>{
          'data': <String, dynamic>{'getCurrentTerms': termsMock}
        },
      );

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
          isPhoneVerified: true,
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

        expect(find.byType(TermsAndConditionsPage), findsOneWidget);
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

      expect(
        store.state.onboardingState?.phoneLogin?.invalidCredentials,
        false,
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
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

      expect(
        store.state.onboardingState?.phoneLogin?.invalidCredentials,
        true,
      );
      expect(find.byType(LoginErrorWidget), findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '1');
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState?.phoneLogin?.invalidCredentials,
        false,
      );

      store.dispatch(PhoneLoginStateAction(invalidCredentials: true));
      await tester.pump();

      await tester.showKeyboard(phoneInputField);
      await tester.enterText(phoneInputField, '7');
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState?.phoneLogin?.invalidCredentials,
        false,
      );
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
