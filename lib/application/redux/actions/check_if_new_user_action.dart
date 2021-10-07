// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class CheckIfNewUserAction extends ReduxAction<AppState> {
  CheckIfNewUserAction({
    required this.context,
    required this.flag,
    required this.appSignature,
  });

  final BuildContext context;
  final String flag;
  final String appSignature;

  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: flag);
  }

  @override
  Future<AppState> reduce() async {
    // get the verify phone endpoint based on the context
    final String verifyPhoneEndpoint =
        AppWrapperBase.of(context)!.customContext!.verifyPhoneEndpoint;

    // create the payload
    final Map<String, dynamic> variables = <String, String>{
      'phoneNumber': store.state.miscState!.phoneSignUp!.phoneNumber!,
      'appId': appSignature
    };

    final IGraphQlClient httpClient = AppWrapperBase.of(context)!.graphQLClient;

    final ProcessedResponse processedResponse = processHttpResponse(
      await httpClient.callRESTAPI(
          endpoint: verifyPhoneEndpoint, variables: variables, method: 'POST'),
      context,
    );

    if (processedResponse.ok) {
      final http.Response response = processedResponse.response;

      final Map<String, dynamic> body =
          json.decode(response.body) as Map<String, dynamic>;

      if (body['otp'] != null) {
        // dispatch OTP to state
        store.dispatch(PhoneSignUpStateAction(otp: body['otp'].toString()));

        // explictly hide the loader from the previous page so that when the
        //user goes back, they dont find the loader spinning
        toggleLoadingIndicator(context: context, flag: flag, show: false);

        NavigateAction<AppState>.pushReplacementNamed(BWRoutes.verifySignUpOTP);
        return state;
      } else {
        throw SILException(
            error: body,
            cause: 'otp_error',
            message: 'Error encountered while sending OTP');
      }
    } else {
      toggleLoadingIndicator(context: context, flag: flag, show: false);
      throw SILException(
          error: processedResponse.response,
          cause: 'check_new_user_error',
          message: processedResponse.message);
    }
  }

  @override
  Object wrapError(dynamic error) async {
    reportErrorToSentry(context, error.error);
    return actionWrapError(error: error, context: context);
  }
}
