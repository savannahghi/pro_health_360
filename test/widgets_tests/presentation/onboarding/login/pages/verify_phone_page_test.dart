// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_card_widget.dart';
import 'package:myafyahub/presentation/onboarding/set_new_pin/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:myafyahub/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:myafyahub/presentation/onboarding/verify_phone/widgets/verify_otp_widget.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('VerifyPhonePage', () {
    late Store<AppState> store;
    late int now;

    setUp(() {
      now = DateTime.now().microsecondsSinceEpoch;
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith
            .clientState!
            .user!
            .call(
              primaryContact: Contact(value: '+254712345678'),
              userId: 'user-id',
            )
            .copyWith
            .onboardingState!
            .call(otp: '123456', invalidOTP: false),
      );
    });

    testWidgets('should verify an OTP correctly and navigate to terms page',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getCurrentTerms': termsMock,
              'sendOTP': '123456',
              'verifyOTP': true
            }
          }),
          201,
        ),
      );

      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.Login,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const VerifyPhonePage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(VerifyOtpWidget), findsOneWidget);

      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '123456');
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(TermsAndConditionsPage), findsWidgets);
    });

    testWidgets('should show error if code is invalid',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'sendOTP': '123456',
            }
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const VerifyPhonePage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(VerifyOtpWidget), findsOneWidget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(PINInputField));
      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '000000');
      await tester.pumpAndSettle();

      expect(find.text(invalidCode), findsWidgets);
    });

    testWidgets('should show a loading indicator when sending an OTP',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'sendOTP': '123456',
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const VerifyPhonePage(),
      );

      expect(find.byType(VerifyOtpWidget), findsOneWidget);

      store.dispatch(WaitAction<AppState>.add(sendOTPFlag));
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
      store.dispatch(WaitAction<AppState>.remove(sendOTPFlag));
    });

    testWidgets('should show a loading indicator when verifying an OTP',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyOTP': true,
              'sendOTP': '123456',
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const VerifyPhonePage(),
      );

      expect(find.byType(VerifyOtpWidget), findsOneWidget);

      store.dispatch(WaitAction<AppState>.add(verifyOTPFlag));
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
      expect(find.text(verifyCode), findsOneWidget);
    });

    testWidgets(
        'should show default error card when there is an error when fetching an OTP',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          201,
        ),
      );

      store = Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const VerifyPhonePage(),
      );

      expect(find.byType(VerifyOtpWidget), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(ErrorCardWidget), findsOneWidget);
    });

    testWidgets('default error card is clickable', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          201,
        ),
      );

      store = Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const VerifyPhonePage(),
      );

      expect(find.byType(VerifyOtpWidget), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(ErrorCardWidget), findsOneWidget);

      await tester.ensureVisible(find.text(resendOTP));
      await tester.tap(find.text(resendOTP));
      await tester.pumpAndSettle();

      expect(find.text(didNotReceiveOTP), findsNothing);
    });

    testWidgets(
        'should verify an OTP correctly and navigate to create new pin page if reset pin is true',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'otp': '123456',
            'data': <String, dynamic>{'sendOTP': '123456', 'verifyOTP': true}
          }),
          201,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.PINExpired,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const VerifyPhonePage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(VerifyOtpWidget), findsOneWidget);
      await tester.pumpAndSettle();

      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '123456');
      await tester.pumpAndSettle();

      expect(find.byType(CreateNewPINPage), findsWidgets);
    });

    testWidgets(
        'resend otp button appears after timer runs out and functions correctly',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'otp': '123456',
            'data': <String, dynamic>{
              'sendRetryOTP': '123456',
              'sendOTP': '123456',
              'verifyOTP': true
            }
          }),
          201,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.PINExpired,
        ),
      );

      now = now + const Duration(seconds: 100).inSeconds;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const VerifyPhonePage(),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(resendOtpButtonKey), findsOneWidget);

      await tester.tap(find.byKey(resendOtpButtonKey));

      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '123456');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(store.state.onboardingState!.isPhoneVerified, true);
    });
  });
}
