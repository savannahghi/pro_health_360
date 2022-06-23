// Dart imports:
import 'dart:async';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/core/services/onboarding_utils.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

/// [SecurityQuestionResponsesAction] is a Redux Action whose job is to update security questions responses.
///
/// Otherwise delightfully notify user of any Error that might occur during the process

class RecordSecurityQuestionResponsesAction extends ReduxAction<AppState> {
  RecordSecurityQuestionResponsesAction({required this.context});

  final BuildContext context;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(recordSecurityQuestionsFlag));
    super.after();
  }

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  @override
  void before() {
    dispatch(WaitAction<AppState>.add(recordSecurityQuestionsFlag));
  }

  @override
  Future<AppState> reduce() async {
    final List<SecurityQuestionResponse> securityQuestionsResponses =
        state.onboardingState!.securityQuestionResponses!;
    final List<Map<String, dynamic>> vars = <Map<String, dynamic>>[];
    for (final SecurityQuestionResponse response
        in securityQuestionsResponses) {
      vars.add(response.toJson());
    }

    // initializing of the RecordSecurityQuestionResponses mutation
    final Map<String, dynamic> _variables = <String, dynamic>{'input': vars};
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await _client.query(
      recordSecurityQuestionResponsesMutation,
      _variables,
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    if (_client.parseError(body) != null) {
      throw MyAfyaException(
        cause: recordSecurityQuestionsFlag,
        message: somethingWentWrongText,
      );
    }

    final RecordSecurityQuestionResponsesData responseMap =
        RecordSecurityQuestionResponsesData.fromJson(
      body['data'] as Map<String, dynamic>,
    );

    if (responseMap.recordSecurityQuestionResponses.isNotEmpty) {
      dispatch(UpdateOnboardingStateAction(hasSetSecurityQuestions: true));

      final String route = onboardingPath(appState: state).nextRoute;

      Navigator.pushReplacementNamed(context, route);

      final CurrentOnboardingStage? onboardingStage =
          state.onboardingState!.currentOnboardingStage;

      await AnalyticsService().logEvent(
        name: recordSecurityQuestionsEvent,
        eventType: AnalyticsEventType.ONBOARDING,
        parameters: <String, dynamic>{
          'next_page': route,
          'current_onboarding_workflow': describeEnum(onboardingStage!),
        },
      );

      await AnalyticsService().logEvent(
        name: recordSecurityQuestionsEvent,
        eventType: AnalyticsEventType.ONBOARDING,
      );
    }

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == MyAfyaException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(error.message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(closeString, white, context),
          ),
        );
      return error;
    }
    return error;
  }
}
