import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/fetch_violence_screening_questions_action.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/update_alcohol_state_action.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/update_contraceptive_state.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/update_tb_state.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/update_violence_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/connectivity_state.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

import '../../../../mocks.dart';

void main() {
  group('FetchViolenceScreeningQuestionsAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('shows loading indicator successfully', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockGraphQlClient(),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingViolenceQuestionsFlag),
        false,
      );
    });

    test('should run successfully for violence', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockGraphQlClient(),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateViolenceStateAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingViolenceQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.violenceState,
        isNotNull,
      );
    });

    test('should run successfully for contraceptives', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockGraphQlClient(),
          screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateContraceptiveStateAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingContraceptivesQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.contraceptiveState,
        isNotNull,
      );
    });
    test('should run successfully for alcohol', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockGraphQlClient(),
          screeningToolsType: ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateAlcoholStateAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingAlcoholQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.alcoholSubstanceUseState,
        isNotNull,
      );
    });
    test('should run successfully for tb', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockGraphQlClient(),
          screeningToolsType: ScreeningToolsType.TB_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateTBStateAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingTBQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.tbState,
        isNotNull,
      );
    });

    test('should dispatch error if body is null for violence', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'getScreeningToolQuestions': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateViolenceStateAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingViolenceQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.violenceState,
        isNotNull,
      );
      expect(
        info.state.miscState?.screeningToolsState?.violenceState
            ?.errorFetchingQuestions,
        true,
      );
    });

    test('should dispatch error if body is null for contraceptives', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'getScreeningToolQuestions': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateContraceptiveStateAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingContraceptivesQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.contraceptiveState,
        isNotNull,
      );
      expect(
        info.state.miscState?.screeningToolsState?.contraceptiveState
            ?.errorFetchingQuestions,
        true,
      );
    });
    test('should dispatch error if body is null for alcohol', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'getScreeningToolQuestions': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateAlcoholStateAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingAlcoholQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.alcoholSubstanceUseState,
        isNotNull,
      );
      expect(
        info.state.miscState?.screeningToolsState?.alcoholSubstanceUseState
            ?.errorFetchingQuestions,
        true,
      );
    });
    test('should dispatch error if body is null for tb', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'getScreeningToolQuestions': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.TB_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateTBStateAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingTBQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.tbState,
        isNotNull,
      );
      expect(
        info.state.miscState?.screeningToolsState?.tbState
            ?.errorFetchingQuestions,
        true,
      );
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
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
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
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
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('fetching questions'),
      );
    });
  });
}
