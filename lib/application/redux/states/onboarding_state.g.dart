// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OnboardingState _$_$_OnboardingStateFromJson(Map<String, dynamic> json) {
  return _$_OnboardingState(
    createPINState: json['createPINState'] == null
        ? null
        : CreatePINState.fromJson(
            json['createPINState'] as Map<String, dynamic>),
    termsAndConditions: json['termsAndConditions'] == null
        ? null
        : TermsAndConditions.fromJson(
            json['termsAndConditions'] as Map<String, dynamic>),
    securityQuestions: (json['securityQuestions'] as List<dynamic>?)
        ?.map((e) => SecurityQuestion.fromJson(e as Map<String, dynamic>))
        .toList(),
    securityQuestionResponses: (json['securityQuestionResponses']
            as List<dynamic>?)
        ?.map(
            (e) => SecurityQuestionResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    phoneLogin: json['phoneLogin'] == null
        ? null
        : PhoneLoginState.fromJson(json['phoneLogin'] as Map<String, dynamic>),
    otp: json['otp'] as String?,
  );
}

Map<String, dynamic> _$_$_OnboardingStateToJson(_$_OnboardingState instance) =>
    <String, dynamic>{
      'createPINState': instance.createPINState,
      'termsAndConditions': instance.termsAndConditions,
      'securityQuestions': instance.securityQuestions,
      'securityQuestionResponses': instance.securityQuestionResponses,
      'phoneLogin': instance.phoneLogin,
      'otp': instance.otp,
    };
