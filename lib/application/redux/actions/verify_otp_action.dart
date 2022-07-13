// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
// Project imports:
import 'package:pro_health_360/application/core/services/onboarding_utils.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/onboarding_path_info.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

class VerifyOTPAction extends ReduxAction<AppState> {
  VerifyOTPAction({required this.context, required this.otp});

  final BuildContext context;
  final String otp;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(verifyOTPFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(verifyOTPFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String phoneNumber = state.onboardingState?.phoneNumber ?? UNKNOWN;

    if (phoneNumber != UNKNOWN) {
      final String verifyOTPEndpoint =
          AppWrapperBase.of(context)!.customContext!.verifyContactOTPEndpoint;

      final Map<String, dynamic> variables = <String, dynamic>{
        'otp': otp,
        'phoneNumber': phoneNumber,
        'flavour': Flavour.consumer.name,
      };

      final IGraphQlClient httpClient =
          AppWrapperBase.of(context)!.graphQLClient;

      final Response httpResponse = await httpClient.callRESTAPI(
        endpoint: verifyOTPEndpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse);

      if (processedResponse.ok) {
        final Map<String, dynamic> responseBody =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        final Map<String, dynamic>? data =
            responseBody['data'] as Map<String, dynamic>?;

        final bool isValid = data?['verifyOTP'] as bool;

        if (isValid) {
          dispatch(UpdateOnboardingStateAction(isPhoneVerified: isValid));
          dispatch(
            UpdateUserProfileAction(
              isPhoneVerified: true,
            ),
          );

          final OnboardingPathInfo navConfig = onboardingPath(appState: state);

          dispatch(
            NavigateAction<AppState>.pushReplacementNamed(navConfig.nextRoute),
          );

          final CurrentOnboardingStage? onboardingStage =
              state.onboardingState?.currentOnboardingStage;

          AnalyticsService().logEvent(
            name: verifyOTPEvent,
            eventType: AnalyticsEventType.ONBOARDING,
            parameters: <String, dynamic>{
              'next_page': navConfig.nextRoute,
              'current_onboarding_workflow': describeEnum(onboardingStage!),
            },
          );

          return state;
        } else {
          throw MyAfyaException(
            cause: 'verify_otp_error',
            message: invalidCode,
          );
        }
      } else {
        throw MyAfyaException(
          error: processedResponse.response,
          cause: 'verify_otp_error',
          message: processedResponse.message,
        );
      }
    }

    return null;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == MyAfyaException) {
      showFeedbackBottomSheet(
        context: context,
        modalContent: (error as MyAfyaException).message.toString(),
        imageAssetPath: errorIconUrl,
      );
    }
    return error;
  }
}
