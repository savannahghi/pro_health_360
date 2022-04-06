import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myafyahub/application/redux/actions/set_nickname_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import '../../../../../mocks.dart';
import 'set_nickname_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('SetNicknameAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should update onboarding state', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'setNickName': true,
              'completeOnboardingTour': true,
            }
          }),
          201,
        ),
      );

      storeTester.dispatch(
        SetNicknameAction(
          client: client,
          flag: setNickNameFlag,
          nickname: 'test',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetNicknameAction);

      expect(info.state.onboardingState?.hasSetNickName, true);
      expect(info.state.clientState?.user?.username, 'test');
    });

    test('should not update state if error occurs during API call', () async {
      storeTester.dispatch(
        SetNicknameAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
          flag: setNickNameFlag,
          nickname: 'test',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetNicknameAction);

      expect(info.state.onboardingState?.hasSetNickName, false);
      expect(info.state.clientState?.user?.username, UNKNOWN);
    });

    test('should handle error code 71', () async {
      String errorString = '';

      storeTester.dispatch(
        SetNicknameAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': '71'}),
              201,
            ),
          ),
          flag: setNickNameFlag,
          nickname: 'test',
          onError: (String error) {
            errorString = error;
          },
        ),
      );

      expect(errorString, '');

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetNicknameAction);

      expect(info.state.onboardingState?.hasSetNickName, false);
      expect(info.state.clientState?.user?.username, UNKNOWN);
      expect(errorString, usernameTakenText);
    });

    test('should handle false response', () async {
      String errorString = '';

      storeTester.dispatch(
        SetNicknameAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{
                'data': <String, dynamic>{
                  'setNickName': false,
                }
              }),
              200,
            ),
          ),
          flag: setNickNameFlag,
          nickname: 'test',
          onError: (String error) {
            errorString = error;
          },
        ),
      );

      expect(errorString, '');

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetNicknameAction);

      expect(info.state.onboardingState?.hasSetNickName, false);
      expect(info.state.clientState?.user?.username, UNKNOWN);
      expect(errorString, errorSettingNicknameText);
    });

    test('should handle none 200 response', () async {
      storeTester.dispatch(
        SetNicknameAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'error': 'error'}),
              400,
            ),
          ),
          flag: setNickNameFlag,
          nickname: 'test',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntilErrorGetLast(error: UserException);

      expect(info.state.onboardingState?.hasSetNickName, false);
      expect(info.state.clientState?.user?.username, UNKNOWN);
      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });

    test('navigates to next page successfully', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'setNickName': true,
              'completeOnboardingTour': true,
            }
          }),
          201,
        ),
      );

      storeTester.dispatch(
        SetNicknameAction(client: client, flag: '', nickname: 'test'),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamedAndRemoveUntil? navDetails =
          actionDispatched?.details
              as NavigatorDetails_PushNamedAndRemoveUntil?;

      expect(navDetails?.newRouteName, AppRoutes.phoneLogin);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<LoginPage>(
            builder: (BuildContext context) => const LoginPage(),
          ),
        ),
        false,
      );
    });

    test('should catch unhandled error', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(
        SetNicknameAction(client: client, flag: '', nickname: 'test'),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetNicknameAction);

      expect(info.state.onboardingState?.hasSetNickName, false);
      expect(info.state.clientState?.user?.username, UNKNOWN);
      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });
  });
}
