// Dart imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';
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
    required this.resetPinPhoneNumber,
    bool? isResend,
    this.callBackFunction,
  }) : isResend = isResend ?? false;

  final BuildContext context;
  final String resetPinPhoneNumber;
  final Function? callBackFunction;
  bool isResend;

  @override
  void after() {
    final String flag = isResend ? resendOTPFlag : sendOTPFlag;
    dispatch(WaitAction<AppState>.remove(flag));

    ///Ensure the callBackFunction is not null
    callBackFunction?.call();
    super.after();
  }

  @override
  void before() {
    final String flag = isResend ? resendOTPFlag : sendOTPFlag;
    dispatch(WaitAction<AppState>.add(flag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final bool isResetPin = state.onboardingState?.isResetPin ?? false;

    final String phoneNumber = isResetPin
        ? resetPinPhoneNumber
        : state.clientState!.user!.primaryContact!.value ?? UNKNOWN;

    if (phoneNumber != UNKNOWN) {
      final Map<String, dynamic> variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'flavour': Flavour.consumer.name,
      };

      //Incase of send/resend otp error it is cleared
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: false));
      final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

      final Response httpResponse = await retrieveOTP(
        httpClient: _client,
        context: context,
        isResetPin: isResetPin,
        isResend: isResend,
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
          hint: 'Error sending OTP',
        );

        dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));

        return null;
      }

      if (processedResponse.ok == true) {
        //Return OTP sent as string
        //OTP are stored on the backend with the username
        final Map<String, dynamic> parsed =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        final String otp = isResetPin
            ? parsed['otp'] as String
            : isResend
                ? parsed['data']['sendRetryOTP'] as String
                : parsed['data']['sendOTP'] as String;

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
      //Incase user's phone number is not found
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
    }
  }
}
