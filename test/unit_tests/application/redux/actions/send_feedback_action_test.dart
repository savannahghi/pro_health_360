import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/send_feedback_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

import '../../../../mocks.dart';

void main() {
  group('SendFeedbackAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should not update state if error occurs during API call', () async {
      storeTester.dispatch(
        SendFeedbackAction(
          satisfactionLevel: 1,
          serviceName: '',
          feedbackType: FeedBackType.GENERAL_FEEDBACK.name,
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
          feedback: 'Great app',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SendFeedbackAction);

      expect(info.state.wait!.isWaitingFor(sendFeedbackFlag), false);
    });

    test('on error callback is called when there is an error in the response',
        () async {
      int testNumber = 0;
      storeTester.dispatch(
        SendFeedbackAction(
          satisfactionLevel: 1,
          serviceName: '',
          feedbackType: FeedBackType.GENERAL_FEEDBACK.name,
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(
                <String, dynamic>{
                  'data': <String, dynamic>{'sendFeedback': false}
                },
              ),
              201,
            ),
          ),
          onError: () {
            testNumber++;
          },
          feedback: 'Great app',
        ),
      );

      await storeTester.waitUntil(SendFeedbackAction);

      expect(testNumber, 1);
    });
  });
}
