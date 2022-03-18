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
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/infrastructure/endpoints.dart';
import 'package:myafyahub/presentation/onboarding/forgot_pin/pages/pending_pin_request_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/login_counter_page.dart';
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

    final Map<String, dynamic> pinChangeRequiredMock = <String, dynamic>{
      'code': 0,
      'message': 'success',
      'response': <String, dynamic>{
        'credentials': <String, dynamic>{
          'expiresIn': '3600',
          'idToken': 'some id token',
          'refreshToken': 'some-refresh-token'
        },
        'clientProfile': <String, dynamic>{
          'active': true,
          'addresses': <Map<String, dynamic>>[
            <String, dynamic>{
              'active': true,
              'addressType': 'POSTAL',
              'country': 'Kenya',
              'county': null,
              'postalCode': '00300',
              'text': 'One Padmore'
            }
          ],
          'clientCounselled': true,
          'clientType': 'PMTCT',
          'facilityID': 'some-facility-id',
          'relatedPersons': <Map<String, dynamic>>[
            <String, dynamic>{
              'active': true,
              'dateOfBirth': '21 Nov 2002',
              'firstName': 'Juha',
              'gender': 'MALE',
              'lastName': 'Kalulu',
              'otherName': null,
              'relatedTo': 'some-user-id',
              'relationshipType': 'NEXT_OF_KIN',
              'addresses': <Map<String, dynamic>>[
                <String, dynamic>{
                  'active': true,
                  'addressType': 'POSTAL',
                  'country': 'Kenya',
                  'county': null,
                  'postalCode': '00300',
                  'text': 'One Padmore'
                }
              ],
              'primaryContact': <String, dynamic>{
                'active': true,
                'contact': '+254717356476',
                'contactType': 'PHONE',
                'optedIn': true
              },
              'secondaryContacts': <Map<String, dynamic>>[
                <String, dynamic>{
                  'active': true,
                  'contact': '+254717356476',
                  'contactType': 'PHONE',
                  'optedIn': true
                }
              ]
            }
          ],
          'treatmentBuddy': null,
          'treatmentEnrollmentDate': '21 Nov 2021',
          'user': <String, dynamic>{
            'active': true,
            'name': 'Juha Kalulu',
            'firstName': 'Juha',
            'gender': 'MALE',
            'languages': <String>['en', 'sw'],
            'suspended': false,
            'avatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
            'primaryContact': <String, dynamic>{
              'active': true,
              'contact': '+254717356476',
              'contactType': 'PHONE',
              'optedIn': true
            },
            'secondaryContacts': <Map<String, dynamic>>[
              <String, dynamic>{
                'active': true,
                'contact': '+254717356476',
                'contactType': 'PHONE',
                'optedIn': true
              }
            ],
            'lastName': 'Kalulu',
            'pinChangeRequired': true,
            'termsAccepted': false,
            'userID': 'some-user-id',
            'userName': 'Kowalski',
            'userType': 'CLIENT',
            'dateOfBirth': '21 Nov 2002',
          },
        },
        'getStreamToken': 'some-test-token',
      }
    };

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
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.Login,
        ),
      );

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
    test('should change to new user workflow when pin change is required',
        () async {
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(pinChangeRequiredMock),
              200,
            ),
          ),
          loginEndpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );
      storeTester.dispatch(UpdateUserProfileAction(pinChangeRequired: true));

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

    test('navigate to pin reset requests page', () async {
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(<String, dynamic>{'code': 72}),
              400,
            ),
          ),
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

      expect(navDetails?.newRouteName, AppRoutes.pendingPINRequestPage);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<PendingPINRequestPage>(
            builder: (BuildContext context) => const PendingPINRequestPage(),
          ),
        ),
        false,
      );
    });

    test('navigate to pin login counter page', () async {
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(<String, dynamic>{'code': 73, 'retryTime': 10.0}),
              400,
            ),
          ),
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

      expect(navDetails?.newRouteName, AppRoutes.loginCounterPage);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<LoginCounterPage>(
            builder: (BuildContext context) => const LoginCounterPage(
              retryTime: 10,
            ),
          ),
        ),
        false,
      );
    });
  });
}
