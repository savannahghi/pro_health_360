import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/actions/security_questions/verify_security_questions_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

import '../../../../../mocks.dart';

void main() {
  group('VerifySecurityQuestionAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() async {
      await setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should not update state if error occurs during API call', () async {
      storeTester.dispatch(
        VerifySecurityQuestionAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{
                'error': <String, dynamic>{},
                'message': '2: internal error',
              }),
              400,
            ),
          ),
          verifySecurityQuestionsEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifySecurityQuestionAction);

      expect(info.state.onboardingState?.hasVerifiedSecurityQuestions, false);
    });

    test(
        'should return response mismatch if one or more responses do not match',
        () async {
      storeTester.dispatch(
        VerifySecurityQuestionAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{
                'error': <String, dynamic>{},
                'message': 'security question response does not match',
                'code': 78,
              }),
              400,
            ),
          ),
          verifySecurityQuestionsEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifySecurityQuestionAction);

      expect(
        (info.error! as UserException).msg,
        responseNotMatchingText,
      );

      expect(info.state.onboardingState?.hasVerifiedSecurityQuestions, false);
    });

    test('should navigate to help page if more than 3 attempts are made',
        () async {
      storeTester.dispatch(
        VerifySecurityQuestionAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{
                'error': <String, dynamic>{},
                'message': 'security question response does not match',
                'code': 77,
              }),
              400,
            ),
          ),
          verifySecurityQuestionsEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifySecurityQuestionAction);

      expect(info.state.onboardingState?.hasVerifiedSecurityQuestions, false);
    });

    test('verifies security questions successfully', () async {
      storeTester.dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: <SecurityQuestion>[
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
          ],
          securityQuestionsResponses: <SecurityQuestionResponse>[
            SecurityQuestionResponse.initial(),
            SecurityQuestionResponse.initial().copyWith(response: ''),
            SecurityQuestionResponse.initial(),
          ],
          currentOnboardingStage: CurrentOnboardingStage.PINExpired,
        ),
      );
      storeTester.dispatch(
        VerifySecurityQuestionAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{
                'data': <String, dynamic>{
                  'verifySecurityQuestionResponses': true,
                },
              }),
              201,
            ),
          ),
          verifySecurityQuestionsEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifySecurityQuestionAction);

      expect(info.state.onboardingState?.hasVerifiedSecurityQuestions, true);
    });
  });
}
