import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/actions/security_questions/verify_security_questions_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

import '../../../../../mocks.dart';

void main() {
  group('SetNicknameAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
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
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
          verifySecurityQuestionsEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifySecurityQuestionAction);

      expect(info.state.onboardingState?.hasVerifiedSecurityQuestions, false);
    });
  });
}
