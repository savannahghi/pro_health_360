// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

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
    this.hasVerifiedSecurityQuestions,
    this.currentOnboardingStage,
    this.isPINChanged,
    this.phoneNumber,
    this.invalidCredentials,
    this.pin,
    this.confirmPIN,
    this.failedLoginCount,
  });

  List<SecurityQuestion>? securityQuestions;
  List<SecurityQuestionResponse>? securityQuestionsResponses;

  ///------------WORKFLOW RELATED BOOLEANS------------
  final CurrentOnboardingStage? currentOnboardingStage;
  bool? isPhoneVerified;
  bool? hasSetSecurityQuestions;
  bool? hasVerifiedSecurityQuestions;
  bool? hasSetNickName;
  final bool? isPINChanged;

  ///------------WORKFLOW RELATED VALUES------------
  final String? phoneNumber;
  final String? pin;
  final String? confirmPIN;
  final String? otp;

  ///------------VERIFY PIN RELATED VALUES------------
  final bool? invalidOTP;
  final bool? failedToSendOTP;
  final bool? canResendOTP;
  bool? hasSetPin;

  ///------------LOGIN RELATED VALUES------------
  final int? failedLoginCount;
  final bool? invalidCredentials;

  @override
  AppState reduce() {
    final OnboardingState? fromState = state.onboardingState;

    final OnboardingState? newOnboardingState = state.onboardingState?.copyWith(
      securityQuestions: securityQuestions ?? fromState?.securityQuestions,
      securityQuestionResponses:
          securityQuestionsResponses ?? fromState?.securityQuestionResponses,
      isPhoneVerified: isPhoneVerified ?? fromState?.isPhoneVerified,
      hasSetNickName: hasSetNickName ?? fromState?.hasSetNickName,
      hasSetSecurityQuestions:
          hasSetSecurityQuestions ?? fromState?.hasSetSecurityQuestions,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions ??
          fromState?.hasVerifiedSecurityQuestions,
      verifyPhoneState: fromState?.verifyPhoneState?.copyWith(
        otp: otp ?? fromState?.verifyPhoneState?.otp,
        invalidOTP:
            invalidOTP ?? fromState?.verifyPhoneState?.invalidOTP ?? false,
        failedToSendOTP: failedToSendOTP ??
            fromState?.verifyPhoneState?.failedToSendOTP ??
            false,
        canResendOTP:
            canResendOTP ?? fromState?.verifyPhoneState?.canResendOTP ?? false,
      ),
      pinExpiredState: fromState?.pinExpiredState?.copyWith(
        otp: otp ?? fromState?.pinExpiredState?.otp,
        isPhoneVerified:
            isPhoneVerified ?? fromState?.pinExpiredState?.isPhoneVerified,
        isPINChanged: isPINChanged ?? fromState?.pinExpiredState?.isPINChanged,
      ),
      currentOnboardingStage:
          currentOnboardingStage ?? fromState?.currentOnboardingStage,
      hasSetPin: hasSetPin ?? fromState?.hasSetPin,
      pin: pin ?? fromState?.pin,
      confirmPIN: confirmPIN ?? fromState?.confirmPIN,
      otp: otp ?? fromState?.otp,
      failedLoginCount: failedLoginCount ?? fromState?.failedLoginCount,
      invalidCredentials: invalidCredentials ?? fromState?.invalidCredentials,
      invalidOTP: invalidOTP ?? fromState?.invalidOTP,
      failedToSendOTP: failedToSendOTP ?? fromState?.failedToSendOTP,
      canResendOTP: canResendOTP ?? fromState?.canResendOTP,
    );

    final AppState newState =
        state.copyWith(onboardingState: newOnboardingState);

    return newState;
  }
}
