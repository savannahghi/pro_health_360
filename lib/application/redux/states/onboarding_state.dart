// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/login/create_pin.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_state.dart';
import 'package:myafyahub/domain/core/entities/login/set_pin_state.dart';
import 'package:myafyahub/domain/core/entities/login/verify_phone_state.dart';
import 'package:myafyahub/domain/core/entities/login/verify_security_questions_state.dart';
import 'package:myafyahub/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    CreatePINState? createPINState,
    TermsAndConditions? termsAndConditions,
    List<SecurityQuestion>? securityQuestions,
    List<SecurityQuestionResponse>? securityQuestionResponses,
    PhoneLoginState? phoneLogin,
    VerifyPhoneState? verifyPhoneState,
    VerifySecurityQuestionsState? verifySecurityQuestionsState,
    SetPINState? setPINState,
    // If the user has verified their phone number
    bool? isPhoneVerified,
    // If the user has set their security questions
    bool? hasSetSecurityQuestions,
    // If the user has set their nickname
    bool? hasSetNickName,
    // If the user has successfuly verified their security questions if pin is expired
    bool? hasVerifiedSecurityQuestions,
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);

  factory OnboardingState.initial() => OnboardingState(
        phoneLogin: PhoneLoginState.initial(),
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
      );
}
