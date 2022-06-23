import 'dart:async';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/update_misc_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/surveys/survey.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchAvailableSurveysAction extends ReduxAction<AppState> {
  FetchAvailableSurveysAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchAvailableSurveysFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchAvailableSurveysFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': state.clientState!.user!.userId,
    };

    final Response response =
        await client.query(getUserSurveyFormsQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);
    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(
          getErrorMessage('fetching available surveys'),
        );
      }
      final List<Survey> surveyList = <Survey>[];

      if (body['data']?['getUserSurveyForms'] != null) {
        final List<dynamic>? availableSurveys =
            body['data']?['getUserSurveyForms'] as List<dynamic>?;

        if (availableSurveys?.isNotEmpty ?? false) {
          for (final dynamic surv in availableSurveys!) {
            final Survey survey = Survey.fromJson(surv as Map<String, dynamic>);
            surveyList.add(survey);
          }

          dispatch(UpdateMiscStateAction(availableSurveyList: surveyList));
        }
      } else {
        dispatch(UpdateMiscStateAction(availableSurveyList: surveyList));
      }
    } else {
      throw UserException(processedResponse.message);
    }
  }
}
