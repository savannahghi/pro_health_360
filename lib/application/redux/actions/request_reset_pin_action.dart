// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class RequestResetPinAction extends ReduxAction<AppState> {
  RequestResetPinAction({required this.context, required this.flag});

  final BuildContext context;
  final String flag;

  @override
  void after() {
    toggleLoadingIndicator(context: context, flag: flag, show: false);
    super.after();
  }

  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: flag);
  }

  @override
  Future<AppState> reduce() async {
    if (state.userProfileState!.userProfile!.primaryPhoneNumber ==
        PhoneNumber.withValue(UNKNOWN)) {
      throw SILException(
        cause: 'no_phone_number',
        message: providePhoneToProceed,
      );
    }

    // get the verify phone endpoint based on the context

    final String resetPinResetEndpoint =
        AppWrapperBase.of(context)!.customContext!.pinResetEndpoint;

    // create the payload
    final Map<String, dynamic> _variables = <String, String>{
      'phoneNumber': store
          .state.userProfileState!.userProfile!.primaryPhoneNumber!
          .getValue()
    };
    final IGraphQlClient _httpClient =
        AppWrapperBase.of(context)!.graphQLClient;
    // forgot PIN endpoint to sent and OTP to the number and not check if user exists
    final ProcessedResponse processedResponse = processHttpResponse(
      await _httpClient.callRESTAPI(
        endpoint: resetPinResetEndpoint,
        variables: _variables,
        method: 'POST',
      ),
      context,
    );
    if (processedResponse.ok) {
      final http.Response response = processedResponse.response;

      final Map<String, dynamic> body =
          json.decode(response.body) as Map<String, dynamic>;

      if (body['otp'] != null) {
        // dispatch OTP to state
        store.dispatch(
          UpdatePinStatusAction(recoveryOtp: body['otp'].toString()),
        );
        // navigate to forgot PIN otp page to verify the OTP
        Navigator.pushNamed(context, BWRoutes.forgotPinOtpWidget);
        return state;
      }
      throw SILException(
        error: body,
        cause: 'otp_error',
        message: sendOtpError,
      );
    }
    throw SILException(
      error: processedResponse.response,
      cause: 'check_new_user_error',
      message: processedResponse.message,
    );
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException && error.error != null) {
      reportErrorToSentry(context, error.error, hint: errorResettingPIN);
    }
    return actionWrapError(error: error, context: context);
  }
}
