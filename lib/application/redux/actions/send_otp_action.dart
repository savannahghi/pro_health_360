// Dart imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

class SendOTPAction extends ReduxAction<AppState> {
  SendOTPAction({
    required this.context,
    required this.phoneNumber,
    this.afterCallback,
  });

  // A function to be called after execution of this action is complete
  final Function? afterCallback;

  final BuildContext context;
// The phone number to resend this OTP to
  final String phoneNumber;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(sendOTPFlag));

    ///Ensure the callBackFunction is not null
    afterCallback?.call();
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(sendOTPFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    if (phoneNumber != UNKNOWN) {
      final Map<String, dynamic> variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'flavour': Flavour.consumer.name,
      };

      //Incase of send/resend otp error it is cleared
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: false));

      final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
      final String sendOTPEndpoint = AppWrapperBase.of(context)!
          .customContext!
          .sendRecoverAccountOtpEndpoint;

      final Response httpResponse = await _client.callRESTAPI(
        endpoint: sendOTPEndpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse);

      final Map<String, dynamic> payLoad = _client.toMap(httpResponse);

      final String? error = parseError(payLoad);

      if (error != null) {
        reportErrorToSentry(
          context,
          error,
          hint: 'Error while sending OTP',
        );

        dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));

        return null;
      }

      if (processedResponse.ok) {
        // Return OTP sent as string
        final Map<String, dynamic> parsed =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        final String otp = parsed['data']['sendOTP'] as String;

        // save the OTP to state
        dispatch(UpdateOnboardingStateAction(otp: otp));

        return state;
      } else {
        // exception thrown if the backend could not send an OTP
        showFeedbackBottomSheet(
          context: context,
          modalContent: processedResponse.message ??
              defaultUserFriendlyMessage, // safety-net
          imageAssetPath: errorIconUrl,
        );

        dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));

        reportErrorToSentry(
          context,
          processedResponse.response,
          hint: errorLoggingIn,
        );
      }
    } else {
      // In case user's phone number is not found
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
    }
  }
}
