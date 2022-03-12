// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/entities/login/set_pin_state.dart';

class UpdateOnboardingStateAction extends ReduxAction<AppState> {
  UpdateOnboardingStateAction({
    this.securityQuestions,
    this.securityQuestionsResponses,
    this.isPhoneVerified,
    this.otp,
    this.invalidOTP,
    this.failedToSendOTP,
    this.canResendOTP,
    this.hasSetNickName,
    this.hasSetSecurityQuestions,
    this.hasSetPin,
    this.isResetPin,
    this.hasVerifiedSecurityQuestions,
  });

  List<SecurityQuestion>? securityQuestions;
  List<SecurityQuestionResponse>? securityQuestionsResponses;
  bool? isPhoneVerified;
  final String? otp;
  final bool? invalidOTP;
  final bool? failedToSendOTP;
  final bool? canResendOTP;
  String? phone;
  bool? hasSetNickName;
  bool? hasSetSecurityQuestions;
  bool? hasSetPin;
  bool? isResetPin;
  bool? hasVerifiedSecurityQuestions;

  @override
  AppState reduce() {
    final bool? oldPhoneVerified = state.onboardingState?.isPhoneVerified;
    final SetPINState newSetPINState = SetPINState(
      phone: phone ?? state.onboardingState?.setPINState?.phone ?? UNKNOWN,
      isPINSet:
          hasSetPin ?? state.onboardingState?.setPINState?.isPINSet ?? false,
      isResetPin:
          isResetPin ?? state.onboardingState?.setPINState?.isResetPin ?? false,
    );

    final OnboardingState? newOnboardingState = state.onboardingState?.copyWith(
      setPINState: newSetPINState,
      securityQuestions:
          securityQuestions ?? state.onboardingState?.securityQuestions,
      securityQuestionResponses: securityQuestionsResponses ??
          state.onboardingState?.securityQuestionResponses,
      isPhoneVerified: isPhoneVerified ?? oldPhoneVerified,
      hasSetNickName: hasSetNickName ?? state.onboardingState?.hasSetNickName,
      hasSetSecurityQuestions: hasSetSecurityQuestions ??
          state.onboardingState?.hasSetSecurityQuestions,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions ??
          state.onboardingState?.hasVerifiedSecurityQuestions,
      verifyPhoneState: state.onboardingState?.verifyPhoneState?.copyWith(
        otp: otp ?? state.onboardingState?.verifyPhoneState?.otp,
        invalidOTP: invalidOTP ??
            state.onboardingState?.verifyPhoneState?.invalidOTP ??
            false,
        failedToSendOTP: failedToSendOTP ??
            state.onboardingState?.verifyPhoneState?.failedToSendOTP ??
            false,
        canResendOTP: canResendOTP ??
            state.onboardingState?.verifyPhoneState?.canResendOTP ??
            false,
      ),
    );

    final AppState newState =
        state.copyWith(onboardingState: newOnboardingState);

    return newState;
  }
}
