// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/login/create_pin.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_state.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';
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
    String? otp,
    // The platform terms and conditions
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);

  factory OnboardingState.initial() => OnboardingState(
        phoneLogin: PhoneLoginState.initial(),
        termsAndConditions: TermsAndConditions.initial(),
        createPINState: CreatePINState.initial(),
        securityQuestions: <SecurityQuestion>[],
        securityQuestionResponses: <SecurityQuestionResponse>[],
        otp: UNKNOWN,
      );
}
