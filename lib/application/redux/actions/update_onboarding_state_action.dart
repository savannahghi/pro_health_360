// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';

class UpdateOnboardingStateAction extends ReduxAction<AppState> {
  UpdateOnboardingStateAction({
    this.securityQuestions,
    this.securityQuestionsResponses,
    this.isPhoneVerified,
    this.isPINSet,
    this.otp,
    this.invalidOTP,
    this.failedToSendOTP,
    this.hasSetNickName,
    this.hasSetSecurityQuestions,
  });

  List<SecurityQuestion>? securityQuestions;
  List<SecurityQuestionResponse>? securityQuestionsResponses;
  bool? isPhoneVerified;
  bool? isPINSet;
  final String? otp;
  final bool? invalidOTP;
  final bool? failedToSendOTP;
  bool? hasSetNickName;
  bool? hasSetSecurityQuestions;

  @override
  AppState reduce() {
    final bool? oldPhoneVerified = state.onboardingState?.isPhoneVerified;

    final OnboardingState? newOnboardingState = state.onboardingState?.copyWith(
      securityQuestions:
          securityQuestions ?? state.onboardingState?.securityQuestions,
      securityQuestionResponses: securityQuestionsResponses ??
          state.onboardingState?.securityQuestionResponses,
      isPhoneVerified: isPhoneVerified ?? oldPhoneVerified,
      isPINSet: isPINSet ?? state.onboardingState?.isPINSet,
      hasSetNickName: hasSetNickName ?? state.onboardingState?.hasSetNickName,
      hasSetSecurityQuestions: hasSetSecurityQuestions ??
          state.onboardingState?.hasSetSecurityQuestions,
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
