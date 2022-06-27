// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';

class ResendOTPAction extends ReduxAction<AppState> {
  ResendOTPAction({
    required this.context,
    required this.phoneNumber,
  });

  final BuildContext context;
  // The phone number to resend this OTP to
  final String phoneNumber;

  @override
  void after() {
    dispatch(WaitAction<AppState>.add(resendOTPFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.remove(resendOTPFlag));
  }

  @override
  Future<AppState?> reduce() async {
    if (phoneNumber != UNKNOWN) {
      final String sendOTPEndpoint =
          AppWrapperBase.of(context)!.customContext!.retryResendOtpEndpoint;

      final Map<String, dynamic> variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'flavour': Flavour.consumer.name,
      };

      final IGraphQlClient httpClient =
          AppWrapperBase.of(context)!.graphQLClient;

      final Response httpResponse = await httpClient.callRESTAPI(
        endpoint: sendOTPEndpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse);

      if (processedResponse.ok == true) {
        // Return OTP sent as string
        final Map<String, dynamic> parsed =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        final Map<String, dynamic>? data =
            parsed['data'] as Map<String, dynamic>?;

        final String otp = data?['sendRetryOTP'] as String;

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

        throw MyAfyaException(
          error: processedResponse.response,
          cause: 'resend_otp_error',
          message: processedResponse.message,
        );
      }
    } else {
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
    }

    return null;
  }
}
