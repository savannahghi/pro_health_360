// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

class ResendOTPAction extends ReduxAction<AppState> {
  ResendOTPAction({
    required this.context,
    required this.callBackFunction,
  });

  final BuildContext context;
  final Function callBackFunction;

  @override
  void after() {
    toggleLoadingIndicator(context: context, flag: resendOTPFlag, show: false);
    callBackFunction();
    super.after();
  }

  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: resendOTPFlag);
  }

  @override
  Future<AppState?> reduce() async {
    final String phoneNumber =
        state.clientState!.user!.primaryContact!.value ?? UNKNOWN;

    if (phoneNumber != UNKNOWN) {
      final String sendOTPEndpoint =
          AppWrapperBase.of(context)!.customContext!.retryResendOtpEndpoint;

      final Map<String, dynamic> variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'flavour': Flavour.CONSUMER.name,
      };

      final IGraphQlClient httpClient =
          AppWrapperBase.of(context)!.graphQLClient;

      final Response httpResponse = await httpClient.callRESTAPI(
        endpoint: sendOTPEndpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse, context);

      if (processedResponse.ok == true) {
        //Return OTP sent as string
        final String parsed = jsonDecode(httpResponse.body) as String;
        final String otp = parsed;

        // save the OTP to state
        dispatch(UpdateOnboardingStateAction(otp: otp));
        return state;
      } else {
        // exception thrown if the backend could not send an OTP
        //OTP are stored on the backend with the username
        showFeedbackBottomSheet(
          context: context,
          modalContent: processedResponse.message ?? UNKNOWN, // safety-net
          imageAssetPath: errorIconUrl,
        );

        dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
        throw SILException(
          error: processedResponse.response,
          cause: 'resend_otp_error',
          message: processedResponse.message,
        );
      }
    } else {
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
    }
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException && error.error != null) {
      reportErrorToSentry(context, error.error, hint: errorLoggingIn);
    }

    return error;
  }
}
