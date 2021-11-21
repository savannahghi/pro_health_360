// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';

class UpdateOnboardingStateAction extends ReduxAction<AppState> {
  UpdateOnboardingStateAction({
    this.securityQuestionsResponses,
    this.isPhoneVerified,
    this.isPINSet,
    this.otp,
    this.invalidOTP,
    this.failedToSendOTP,
  });

  List<SecurityQuestionResponse>? securityQuestionsResponses;
  bool? isPhoneVerified;
  bool? isPINSet;
  final String? otp;
  final bool? invalidOTP;
  final bool? failedToSendOTP;

  @override
  AppState reduce() {
    final bool? oldPhoneVerified = state.onboardingState?.isPhoneVerified;

    final OnboardingState? newOnboardingState = state.onboardingState?.copyWith(
      securityQuestionResponses: securityQuestionsResponses,
      isPhoneVerified: isPhoneVerified ?? oldPhoneVerified,
      isPINSet: isPINSet ?? state.onboardingState?.isPINSet,
      verifyPhoneState: state.onboardingState!.verifyPhoneState!.copyWith.call(
        otp: otp ?? state.onboardingState!.verifyPhoneState!.otp,
        invalidOTP:
            invalidOTP ?? state.onboardingState!.verifyPhoneState!.invalidOTP,
        failedToSendOTP: failedToSendOTP ??
            state.onboardingState!.verifyPhoneState!.failedToSendOTP,
      ),
    );

    final AppState newState =
        state.copyWith(onboardingState: newOnboardingState);

    return newState;
  }
}
