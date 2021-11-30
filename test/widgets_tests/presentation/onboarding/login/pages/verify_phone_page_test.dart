// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/pin_input_field_widget.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_card_widget.dart';
import 'package:myafyahub/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:myafyahub/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:myafyahub/presentation/onboarding/verify_phone/widgets/verify_otp_widget.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('VerifyPhonePage', () {
    late Store<AppState> store;

    setUpAll(() {
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
            .verifyPhoneState!
            .call(otp: '123456', invalidOTP: false),
      );
    });

    testWidgets('should verify an OTP correctly and navigate to terms page',
        (WidgetTester tester) async {
      final MockGraphQlClient mockClient = MockGraphQlClient();
      final http.Response otpResponse = http.Response(
        '123456',
        200,
      );

      final http.Response verifyResponse = http.Response(
        'true',
        200,
      );

      final http.Response getTermsResponse = http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'getCurrentTerms': termsMock,
          }
        }),
        200,
      );

      when(
        baseGraphQlClientMock.callRESTAPI(
          endpoint: kTestVerifyPhoneEndpoint,
          method: httpPOST,
          variables: <String, dynamic>{
            'user_id': 'user-id',
            'otp': '123456',
            'phoneNumber': phoneNumber,
            'flavour': Flavour.CONSUMER.name,
          },
        ),
      ).thenAnswer((_) async => Future<http.Response>.value(verifyResponse));

      when(
        baseGraphQlClientMock.callRESTAPI(
          endpoint: kTestSendRecoverAccountOtpEndpoint,
          method: httpPOST,
          variables: <String, dynamic>{
            'phoneNumber': '+254712345678',
            'flavour': Flavour.CONSUMER.name,
          },
        ),
      ).thenAnswer((_) async => Future<http.Response>.value(otpResponse));

      when(
        baseGraphQlClientMock.query(getTermsQuery, <String, dynamic>{}),
      ).thenAnswer(
        (_) async => Future<http.Response>.value(getTermsResponse),
      );

      store.dispatch(UpdateCredentialsAction(isSignedIn: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockClient,
        widget: VerifyPhonePage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(VerifyOtpWidget), findsOneWidget);
      await tester.pumpAndSettle();

      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '123456');
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(TermsAndConditionsPage), findsWidgets);
    });

    testWidgets('should show error if code is invalid',
        (WidgetTester tester) async {
      final MockGraphQlClient mockClient = MockGraphQlClient();
      final http.Response otpResponse = http.Response(
        '123456',
        200,
      );

      when(
        baseGraphQlClientMock.callRESTAPI(
          endpoint: kTestSendRecoverAccountOtpEndpoint,
          method: httpPOST,
          variables: <String, dynamic>{
            'phoneNumber': '+254712345678',
            'flavour': Flavour.CONSUMER.name,
          },
        ),
      ).thenAnswer((_) async => Future<http.Response>.value(otpResponse));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockClient,
        widget: VerifyPhonePage(),
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
      final MockGraphQlClient mockClient = MockGraphQlClient();

      final http.Response otpResponse = http.Response(
        '123456',
        200,
      );

      when(
        baseGraphQlClientMock.callRESTAPI(
          endpoint: kTestSendRecoverAccountOtpEndpoint,
          method: httpPOST,
          variables: <String, dynamic>{
            'phoneNumber': '+254712345678',
            'flavour': Flavour.CONSUMER.name,
          },
        ),
      ).thenAnswer((_) async => Future<http.Response>.value(otpResponse));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockClient,
        widget: VerifyPhonePage(),
      );

      expect(find.byType(VerifyOtpWidget), findsOneWidget);

      store.dispatch(WaitAction<AppState>.add(sendOTPFlag));
      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
      store.dispatch(WaitAction<AppState>.remove(sendOTPFlag));
    });

    testWidgets('should show a loading indicator when verifying an OTP',
        (WidgetTester tester) async {
      final MockGraphQlClient mockClient = MockGraphQlClient();

      final http.Response otpResponse = http.Response(
        '123456',
        200,
      );

      when(
        baseGraphQlClientMock.callRESTAPI(
          endpoint: kTestSendRecoverAccountOtpEndpoint,
          method: httpPOST,
          variables: <String, dynamic>{
            'phoneNumber': '+254712345678',
            'flavour': Flavour.CONSUMER.name,
          },
        ),
      ).thenAnswer((_) async => Future<http.Response>.value(otpResponse));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockClient,
        widget: VerifyPhonePage(),
      );

      expect(find.byType(VerifyOtpWidget), findsOneWidget);

      store.dispatch(WaitAction<AppState>.add(verifyOTP));
      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
      expect(find.text(verifyCode), findsOneWidget);
    });

    testWidgets(
        'should show default error card when there is an error when fetching an OTP',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
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
        widget: VerifyPhonePage(),
      );

      expect(find.byType(VerifyOtpWidget), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(ErrorCardWidget), findsOneWidget);
    });

    testWidgets('default error card is clickable', (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
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
        widget: VerifyPhonePage(),
      );

      expect(find.byType(VerifyOtpWidget), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(ErrorCardWidget), findsOneWidget);

      await tester.ensureVisible(find.text(resendOTP));
      await tester.tap(find.text(resendOTP));
      await tester.pumpAndSettle();

      expect(find.text(didNotReceiveOTP), findsNothing);
    });
  });
}
