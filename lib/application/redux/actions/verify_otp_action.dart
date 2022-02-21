// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:domain_objects/value_objects.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

class VerifyOTPAction extends ReduxAction<AppState> {
  VerifyOTPAction({
    required this.context,
    required this.otp,
  });

  final BuildContext context;
  final String otp;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(verifyOTP));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(verifyOTP));
  }

  @override
  Future<AppState?> reduce() async {
    final String userID = state.clientState!.user!.userId ?? UNKNOWN;
    final String phoneNumber =
        state.clientState!.user!.primaryContact!.value ?? UNKNOWN;

    if (userID != UNKNOWN && phoneNumber != UNKNOWN) {
      final String sendOTPEndpoint =
          AppWrapperBase.of(context)!.customContext!.verifyContactOTPEndpoint;

      final Map<String, dynamic> variables = <String, dynamic>{
        'user_id': userID,
        'otp': otp,
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

      if (processedResponse.ok) {
        final bool isValid =
            jsonDecode(httpResponse.body)['data']['verifyOTP'] as bool;

        if (isValid) {
          dispatch(
            UpdateOnboardingStateAction(
              isPhoneVerified: isValid,
            ),
          );

          final OnboardingPathConfig onboardingPathConfig =
              onboardingPath(appState: state);

          dispatch(
            NavigateAction<AppState>.pushNamed(onboardingPathConfig.route),
          );

          return state;
        } else {
          throw SILException(
            cause: 'verify_otp_error',
            message: invalidCode,
          );
        }
      } else {
        throw SILException(
          error: processedResponse.response,
          cause: 'verify_otp_error',
          message: processedResponse.message,
        );
      }
    }
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException) {
      showFeedbackBottomSheet(
        context: context,
        modalContent: error.message.toString(),
        imageAssetPath: errorIconUrl,
      );
    }
    return error;
  }
}
