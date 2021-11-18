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
  );
}

Map<String, dynamic> _$_$_OnboardingStateToJson(_$_OnboardingState instance) =>
    <String, dynamic>{
      'createPINState': instance.createPINState,
      'termsAndConditions': instance.termsAndConditions,
    };
