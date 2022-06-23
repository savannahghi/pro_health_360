import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/answer_screening_tools_action.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/update_screening_tools_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

import '../../../../mocks.dart';

void main() {
  group('AnswerScreeningToolsAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should dispatch error if body is null for violence', () async {
      storeTester.dispatch(
        AnswerScreeningToolsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'answerScreeningToolQuestion': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateScreeningToolsState);

      expect(
        info.state.wait!.isWaitingFor(answerScreeningQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.violenceState,
        isNotNull,
      );
      expect(
        info.state.miscState?.screeningToolsState?.violenceState
            ?.errorAnsweringQuestions,
        true,
      );
    });

    test('should dispatch error if body is null for contraceptives', () async {
      storeTester.dispatch(
        AnswerScreeningToolsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'answerScreeningToolQuestion': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateScreeningToolsState);

      expect(
        info.state.wait!.isWaitingFor(answerScreeningQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.contraceptiveState,
        isNotNull,
      );
      expect(
        info.state.miscState?.screeningToolsState?.contraceptiveState
            ?.errorAnsweringQuestions,
        true,
      );
    });
    test('should dispatch error if body is null for alcohol', () async {
      storeTester.dispatch(
        AnswerScreeningToolsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'answerScreeningToolQuestion': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateScreeningToolsState);

      expect(
        info.state.wait!.isWaitingFor(answerScreeningQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.alcoholSubstanceUseState,
        isNotNull,
      );
      expect(
        info.state.miscState?.screeningToolsState?.alcoholSubstanceUseState
            ?.errorAnsweringQuestions,
        true,
      );
    });
    test('should dispatch error if body is null for tb', () async {
      storeTester.dispatch(
        AnswerScreeningToolsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'answerScreeningToolQuestion': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.TB_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateScreeningToolsState);

      expect(
        info.state.wait!.isWaitingFor(answerScreeningQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.tbState,
        isNotNull,
      );
      expect(
        info.state.miscState?.screeningToolsState?.tbState
            ?.errorAnsweringQuestions,
        true,
      );
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        AnswerScreeningToolsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(AnswerScreeningToolsAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        AnswerScreeningToolsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(AnswerScreeningToolsAction);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('posting answers'),
      );
    });
  });
}
