import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myafyahub/application/redux/actions/onboarding/phone_login_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/infrastructure/endpoints.dart';
import 'package:myafyahub/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import '../../../../mocks.dart';
import 'phone_login_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('PhoneLoginAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          onboardingState: OnboardingState(
            phoneLogin:
                PhoneLoginState(phoneNumber: '+254798000000', pinCode: '0000'),
          ),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('show handle error if pin is too short', () async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          onboardingState: OnboardingState(
            phoneLogin:
                PhoneLoginState(phoneNumber: '+254798000000', pinCode: '0'),
          ),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      String failureReason = '';

      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockGraphQlClient(),
          loginEndpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (String reason) => failureReason = reason,
        ),
      );

      await storeTester.waitUntil(PhoneLoginAction);

      expect(failureReason, fourDigitPin);
    });

    test('show handle api error', () async {
      String failureReason = '';

      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(<String, dynamic>{'code': 10}),
              400,
            ),
          ),
          loginEndpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (String reason) => failureReason = reason,
        ),
      );

      await storeTester.waitUntil(PhoneLoginAction);

      expect(
        failureReason,
        'Sorry, we could not find a user with those details. Please confirm that '
        'the credentials you provided are correct',
      );
    });

    test('show handle wrong credentials', () async {
      String failureReason = '';

      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(<String, dynamic>{'code': 8}),
              400,
            ),
          ),
          loginEndpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (String reason) => failureReason = reason,
        ),
      );

      await storeTester.waitUntil(PhoneLoginAction);

      expect(failureReason, 'Your phone number or PIN do not match.');
    });

    test('show handle pin reset', () async {
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(<String, dynamic>{'code': 48}),
              400,
            ),
          ),
          loginEndpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );

      final TestInfo<AppState> info = await storeTester.waitUntilAllGetLast(
        <Type>[UpdateOnboardingStateAction, PhoneLoginAction],
      );

      expect(info.state.onboardingState?.setPINState?.isResetPin, true);
    });

    test('show update state correctly if response is ok', () async {
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockGraphQlClient(),
          loginEndpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(PhoneLoginAction);

      expect(info.state.clientState?.user?.name, 'Juha Kalulu');
    });

    test('navigates to next page successfully', () async {
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockGraphQlClient(),
          loginEndpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamedAndRemoveUntil? navDetails =
          actionDispatched?.details
              as NavigatorDetails_PushNamedAndRemoveUntil?;

      expect(navDetails?.newRouteName, AppRoutes.verifySignUpOTP);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<VerifyPhonePage>(
            builder: (BuildContext context) => const VerifyPhonePage(),
          ),
        ),
        false,
      );
    });

    test('should handle uncaught exception', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.callRESTAPI(
          endpoint: kTestLoginByPhoneEndpoint,
          method: httpPOST,
          variables: anyNamed('variables'),
        ),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: client,
          loginEndpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );

      final TestInfo<AppState> info = await storeTester.waitUntilErrorGetLast(
        error: MyAfyaException,
      );

      expect(info.error, isInstanceOf<MyAfyaException>());
    });
  });
}
