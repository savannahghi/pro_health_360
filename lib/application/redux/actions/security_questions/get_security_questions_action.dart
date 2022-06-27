// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

class GetSecurityQuestionsAction extends ReduxAction<AppState> {
  GetSecurityQuestionsAction({required this.context, this.phoneNumber});

  final BuildContext context;
  final String? phoneNumber;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(getSecurityQuestionsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(getSecurityQuestionsFlag));
    super.before();
  }

  @override
  Future<AppState> reduce() async {
    final bool isResetPin = state.onboardingState?.currentOnboardingStage ==
        CurrentOnboardingStage.ResetPIN;

    final String? otp = state.onboardingState?.otp;
    final String? phone = state.onboardingState?.phoneNumber;

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
    final String getRecordedSecurityQuestions = AppWrapperBase.of(context)!
        .customContext!
        .respondedSecurityQuestionsEndpoint!;

    final Map<String, dynamic> getRecordedQuestionsVariables =
        <String, dynamic>{
      'phoneNumber': phone,
      'flavour': Flavour.consumer.name,
      'otp': otp,
    };

    final http.Response result = isResetPin
        ? await _client.callRESTAPI(
            endpoint: getRecordedSecurityQuestions,
            method: httpPOST,
            variables: getRecordedQuestionsVariables,
          )
        : await _client.query(getSecurityQuestionsQuery, <String, dynamic>{
            'flavour': Flavour.consumer.name,
          });
    final Map<String, dynamic> body = _client.toMap(result);

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final String? errors = _client.parseError(body);
    if (errors != null || responseMap.isEmpty) {
      throw MyAfyaException(
        cause: getSecurityQuestionsFlag,
        message: somethingWentWrongText,
      );
    }

    if (isResetPin) {
      final RespondedSecurityQuestionsData responseData =
          RespondedSecurityQuestionsData.fromJson(
        responseMap['data'] as Map<String, dynamic>,
      );

      final List<SecurityQuestionResponse> responses =
          <SecurityQuestionResponse>[];
      for (int i = 0; i < responseData.securityQuestions.length; i++) {
        responses.add(SecurityQuestionResponse.initial());
      }

      dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: responseData.securityQuestions,
          securityQuestionsResponses: responses,
        ),
      );
    } else {
      final SecurityQuestionsData securityQuestionsData =
          SecurityQuestionsData.fromJson(
        responseMap['data'] as Map<String, dynamic>,
      );

      final List<SecurityQuestionResponse> responses =
          <SecurityQuestionResponse>[];
      for (int i = 0; i < securityQuestionsData.securityQuestions.length; i++) {
        responses.add(SecurityQuestionResponse.initial());
      }

      dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: securityQuestionsData.securityQuestions,
          securityQuestionsResponses: responses,
        ),
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
            content: Text((error as MyAfyaException).message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(closeString, white, context),
          ),
        );
      return error;
    }
    return error;
  }
}
