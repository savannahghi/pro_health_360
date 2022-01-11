// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:domain_objects/value_objects.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/security_questions/responses/security_question_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

/// [SecurityQuestionResponsesAction] is a Redux Action whose job is to update security questions responses.
///
/// Otherwise delightfully notify user of any Error that might occur during the process

class RecordSecurityQuestionResponsesAction extends ReduxAction<AppState> {
  RecordSecurityQuestionResponsesAction({
    required this.context,
  });

  final BuildContext context;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: recordSecurityQuestionsFlag);
  }

  @override
  void after() {
    toggleLoadingIndicator(
      context: context,
      flag: recordSecurityQuestionsFlag,
      show: false,
    );
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    final List<SecurityQuestionResponse> securityQuestionsResponses =
        state.onboardingState!.securityQuestionResponses!;

    // initializing of the RecordSecurityQuestionResponses mutation
    final Map<String, dynamic> _variables = <String, dynamic>{
      'input': securityQuestionsResponses
    };
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await _client.query(
      recordSecurityQuestionResponsesMutation,
      _variables,
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (_client.parseError(body) != null || responseMap['errors'] != null) {
      throw SILException(
        cause: recordSecurityQuestionsFlag,
        message: somethingWentWrongText,
      );
    }

    dispatch(
      UpdateOnboardingStateAction(
        hasSetSecurityQuestions: true,
      ),
    );

    final String route = onboardingPath(appState: state).route;
    if (route == BWRoutes.createPin) {
      final String phoneNumber =
          state.clientState?.user?.primaryContact?.value ?? UNKNOWN;
      Navigator.pushReplacementNamed(
        context,
        route,
        arguments: phoneNumber,
      );
    }

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException) {
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
