import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/update_screening_tools_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/alcohol_substance_use_state.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/contraceptive_state.dart';
import 'package:pro_health_360/application/redux/states/tb_state.dart';
import 'package:pro_health_360/application/redux/states/violence_state.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_question.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class AnswerScreeningToolsAction extends ReduxAction<AppState> {
  AnswerScreeningToolsAction({
    required this.screeningToolsType,
    required this.client,
  });

  final IGraphQlClient client;
  final ScreeningToolsType screeningToolsType;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(answerScreeningQuestionsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(answerScreeningQuestionsFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> map = getAnswersVariables(screeningToolsType);
    final Response response = await client.query(
      answerScreeningToolQuestionMutation,
      map,
    );

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
          getErrorMessage('posting answers'),
        );
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      if (data != null &&
          data['answerScreeningToolQuestion'] != null &&
          data['answerScreeningToolQuestion'] is bool &&
          data['answerScreeningToolQuestion'] == true) {
        // log event
        await AnalyticsService().logEvent(
          name: successfulToolAssessmentEvent,
          eventType: AnalyticsEventType.INTERACTION,
          parameters: <String, dynamic>{
            'screeningToolType': screeningToolsType.name,
          },
        );

        dispatch(
          NavigateAction<AppState>.pushNamed(
            AppRoutes.successfulAssessmentSubmissionPage,
          ),
        );
      } else {
        dispatch(
          updateErrorAnsweringQuestions(type: screeningToolsType),
        );
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }

  Map<String, dynamic> getAnswersVariables(ScreeningToolsType type) {
    final Map<String, dynamic> variables = <String, dynamic>{
      'screeningToolResponses': <dynamic>[],
    };
    switch (type) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        for (final ScreeningQuestion question in state
            .miscState!
            .screeningToolsState!
            .violenceState!
            .screeningQuestions!
            .screeningQuestionsList!) {
          if (question.answer != null) {
            (variables['screeningToolResponses'] as List<dynamic>).add(
              <String, dynamic>{
                'clientID': state.clientState!.id,
                'questionID': question.id,
                'response': question.answer
              },
            );
          }
        }
        return variables;

      case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
        for (final ScreeningQuestion question in state
            .miscState!
            .screeningToolsState!
            .contraceptiveState!
            .screeningQuestions!
            .screeningQuestionsList!) {
          (variables['screeningToolResponses'] as List<dynamic>).add(
            <String, dynamic>{
              'clientID': state.clientState!.id,
              'questionID': question.id,
              'response': question.answer
            },
          );
        }
        return variables;

      case ScreeningToolsType.TB_ASSESSMENT:
        for (final ScreeningQuestion question in state
            .miscState!
            .screeningToolsState!
            .tbState!
            .screeningQuestions!
            .screeningQuestionsList!) {
          (variables['screeningToolResponses'] as List<dynamic>).add(
            <String, dynamic>{
              'clientID': state.clientState!.id,
              'questionID': question.id,
              'response': question.answer
            },
          );
        }
        return variables;

      default:
        for (final ScreeningQuestion question in state
            .miscState!
            .screeningToolsState!
            .alcoholSubstanceUseState!
            .screeningQuestions!
            .screeningQuestionsList!) {
          (variables['screeningToolResponses'] as List<dynamic>).add(
            <String, dynamic>{
              'clientID': state.clientState!.id,
              'questionID': question.id,
              'response': question.answer
            },
          );
        }
        return variables;
    }
  }

  ReduxAction<AppState> updateErrorAnsweringQuestions({
    required ScreeningToolsType type,
  }) {
    switch (type) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        return UpdateScreeningToolsState(
          violenceState: ViolenceState(errorAnsweringQuestions: true),
        );
      case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
        return UpdateScreeningToolsState(
          contraceptiveState: ContraceptiveState(errorAnsweringQuestions: true),
        );

      case ScreeningToolsType.TB_ASSESSMENT:
        return UpdateScreeningToolsState(
          tbState: TBState(errorAnsweringQuestions: true),
        );
      default:
        return UpdateScreeningToolsState(
          alcoholSubstanceUseState:
              AlcoholSubstanceUseState(errorAnsweringQuestions: true),
        );
    }
  }
}
