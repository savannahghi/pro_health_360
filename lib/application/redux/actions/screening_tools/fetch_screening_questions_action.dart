import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/update_screening_tools_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/alcohol_substance_use_state.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/contraceptive_state.dart';
import 'package:myafyahub/application/redux/states/tb_state.dart';
import 'package:myafyahub/application/redux/states/violence_state.dart';
import 'package:myafyahub/domain/core/entities/core/screening_questions_list.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

class FetchScreeningToolsQuestionsAction extends ReduxAction<AppState> {
  FetchScreeningToolsQuestionsAction({
    required this.screeningToolsType,
    required this.client,
  });

  final IGraphQlClient client;
  final ScreeningToolsType screeningToolsType;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchingViolenceQuestionsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchingViolenceQuestionsFlag));
    super.before();
  }

  ReduxAction<AppState> updateErrorScreeningToolsQuestions({
    required ScreeningToolsType type,
  }) {
    switch (type) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        return UpdateScreeningToolsState(
          violenceState: ViolenceState(errorFetchingQuestions: true),
        );
      case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
        return UpdateScreeningToolsState(
          contraceptiveState: ContraceptiveState(errorFetchingQuestions: true),
        );

      case ScreeningToolsType.TB_ASSESSMENT:
        return UpdateScreeningToolsState(
          tbState: TBState(errorFetchingQuestions: true),
        );
      default:
        return UpdateScreeningToolsState(
          alcoholSubstanceUseState:
              AlcoholSubstanceUseState(errorFetchingQuestions: true),
        );
    }
  }

  ReduxAction<AppState> updateScreeningToolsQuestions({
    required ScreeningToolsType type,
    required ScreeningQuestionsList screeningQuestionsList,
  }) {
    switch (type) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        return UpdateScreeningToolsState(
          violenceState: ViolenceState(
            screeningQuestions: screeningQuestionsList,
          ),
        );
      case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
        return UpdateScreeningToolsState(
          contraceptiveState: ContraceptiveState(
            screeningQuestions: screeningQuestionsList,
          ),
        );

      case ScreeningToolsType.TB_ASSESSMENT:
        return UpdateScreeningToolsState(
          tbState: TBState(
            screeningQuestions: screeningQuestionsList,
          ),
        );
      default:
        return UpdateScreeningToolsState(
          alcoholSubstanceUseState: AlcoholSubstanceUseState(
            screeningQuestions: screeningQuestionsList,
          ),
        );
    }
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'toolType': screeningToolsType.name
    };
    final Response response =
        await client.query(getScreeningToolsQuestionsQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(
          getErrorMessage('fetching questions'),
        );
      }

      if (body['data'] != null &&
          body['data']['getScreeningToolQuestions'] != null &&
          (body['data']['getScreeningToolQuestions'] as List<dynamic>)
              .isNotEmpty) {
        final ScreeningQuestionsList screeningQuestionsList =
            ScreeningQuestionsList.fromJson(
          body['data'] as Map<String, dynamic>,
        );

        if (screeningQuestionsList.screeningQuestionsList?.isNotEmpty ??
            false) {
          dispatch(
            updateScreeningToolsQuestions(
              screeningQuestionsList: screeningQuestionsList,
              type: screeningToolsType,
            ),
          );
        }
      } else {
        dispatch(
          updateErrorScreeningToolsQuestions(type: screeningToolsType),
        );
      }
    } else {
      throw UserException(processedResponse.message);
    }
  }
}
