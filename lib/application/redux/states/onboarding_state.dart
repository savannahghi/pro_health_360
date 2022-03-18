// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/login/create_pin.dart';
import 'package:myafyahub/domain/core/entities/login/pin_expired_state.dart';
import 'package:myafyahub/domain/core/entities/login/set_pin_state.dart';
import 'package:myafyahub/domain/core/entities/login/verify_phone_state.dart';
import 'package:myafyahub/domain/core/entities/login/verify_security_questions_state.dart';
import 'package:myafyahub/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    CreatePINState? createPINState,
    TermsAndConditions? termsAndConditions,
    List<SecurityQuestion>? securityQuestions,
    List<SecurityQuestionResponse>? securityQuestionResponses,
    VerifyPhoneState? verifyPhoneState,
    VerifySecurityQuestionsState? verifySecurityQuestionsState,
    SetPINState? setPINState,

    // The PIN expired state state
    PINExpiredState? pinExpiredState,

    ///------------WORKFLOW RELATED BOOLEANS------------
    /// Have standardized shared values that will be used across all states
    /// regardless of the workflow
    // The current stage of onboarding that the user is in
    CurrentOnboardingStage? currentOnboardingStage,

    // If the user has verified their phone number
    bool? isPhoneVerified,

    // If the user has set their security questions
    bool? hasSetSecurityQuestions,

    // If the user has successfully verified their security questions if pin is expired
    bool? hasVerifiedSecurityQuestions,

    // If the user has set their nickname
    bool? hasSetNickName,

    // Whether the user's PIN has been set
    final bool? hasSetPin,

    ///------------WORKFLOW RELATED VALUES------------
    // The currently active user's phone number
    final String? phoneNumber,

    // The PIN
    final String? pin,

    // The confirm PIN
    final String? confirmPIN,

    // The OTP used when confirming the phone number
    final String? otp,

    ///------------LOGIN RELATED VALUES------------
    // The number of failed login attempts that this user has
    final int? failedLoginCount,

    // Whether the credentials this user entered are invalid
    final bool? invalidCredentials,

    ///------------VERIFY PHONE RELATED VALUES------------
    // If the OTP entered is invalid
    final bool? invalidOTP,

    // Whether there was a failure while sending an OTP
    final bool? failedToSendOTP,

    //  Whether the user is allowed to resend their PIN
    final bool? canResendOTP,

    ///------------CHANGE PIN RELATED VALUES------------
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);

  factory OnboardingState.initial() => OnboardingState(
        termsAndConditions: TermsAndConditions.initial(),
        createPINState: CreatePINState.initial(),
        securityQuestions: <SecurityQuestion>[],
        securityQuestionResponses: <SecurityQuestionResponse>[],
        verifyPhoneState: VerifyPhoneState.initial(),
        verifySecurityQuestionsState: VerifySecurityQuestionsState.initial(),
        setPINState: SetPINState.initial(),
        isPhoneVerified: false,
        hasSetSecurityQuestions: false,
        hasSetNickName: false,
        hasVerifiedSecurityQuestions: false,
        currentOnboardingStage: CurrentOnboardingStage.Login,
        pinExpiredState: PINExpiredState.initial(),
        phoneNumber: UNKNOWN,
      );
}
