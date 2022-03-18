// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OnboardingState _$$_OnboardingStateFromJson(Map<String, dynamic> json) =>
    _$_OnboardingState(
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
      securityQuestionResponses:
          (json['securityQuestionResponses'] as List<dynamic>?)
              ?.map((e) =>
                  SecurityQuestionResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
      verifyPhoneState: json['verifyPhoneState'] == null
          ? null
          : VerifyPhoneState.fromJson(
              json['verifyPhoneState'] as Map<String, dynamic>),
      verifySecurityQuestionsState: json['verifySecurityQuestionsState'] == null
          ? null
          : VerifySecurityQuestionsState.fromJson(
              json['verifySecurityQuestionsState'] as Map<String, dynamic>),
      setPINState: json['setPINState'] == null
          ? null
          : SetPINState.fromJson(json['setPINState'] as Map<String, dynamic>),
      pinExpiredState: json['pinExpiredState'] == null
          ? null
          : PINExpiredState.fromJson(
              json['pinExpiredState'] as Map<String, dynamic>),
      currentOnboardingStage: $enumDecodeNullable(
          _$CurrentOnboardingStageEnumMap, json['currentOnboardingStage']),
      isPhoneVerified: json['isPhoneVerified'] as bool?,
      hasSetSecurityQuestions: json['hasSetSecurityQuestions'] as bool?,
      hasVerifiedSecurityQuestions:
          json['hasVerifiedSecurityQuestions'] as bool?,
      hasSetNickName: json['hasSetNickName'] as bool?,
      hasSetPin: json['hasSetPin'] as bool?,
      phoneNumber: json['phoneNumber'] as String?,
      pin: json['pin'] as String?,
      confirmPIN: json['confirmPIN'] as String?,
      otp: json['otp'] as String?,
      failedLoginCount: json['failedLoginCount'] as int?,
      invalidCredentials: json['invalidCredentials'] as bool?,
      invalidOTP: json['invalidOTP'] as bool?,
      failedToSendOTP: json['failedToSendOTP'] as bool?,
      canResendOTP: json['canResendOTP'] as bool?,
    );

Map<String, dynamic> _$$_OnboardingStateToJson(_$_OnboardingState instance) =>
    <String, dynamic>{
      'createPINState': instance.createPINState,
      'termsAndConditions': instance.termsAndConditions,
      'securityQuestions': instance.securityQuestions,
      'securityQuestionResponses': instance.securityQuestionResponses,
      'verifyPhoneState': instance.verifyPhoneState,
      'verifySecurityQuestionsState': instance.verifySecurityQuestionsState,
      'setPINState': instance.setPINState,
      'pinExpiredState': instance.pinExpiredState,
      'currentOnboardingStage':
          _$CurrentOnboardingStageEnumMap[instance.currentOnboardingStage],
      'isPhoneVerified': instance.isPhoneVerified,
      'hasSetSecurityQuestions': instance.hasSetSecurityQuestions,
      'hasVerifiedSecurityQuestions': instance.hasVerifiedSecurityQuestions,
      'hasSetNickName': instance.hasSetNickName,
      'hasSetPin': instance.hasSetPin,
      'phoneNumber': instance.phoneNumber,
      'pin': instance.pin,
      'confirmPIN': instance.confirmPIN,
      'otp': instance.otp,
      'failedLoginCount': instance.failedLoginCount,
      'invalidCredentials': instance.invalidCredentials,
      'invalidOTP': instance.invalidOTP,
      'failedToSendOTP': instance.failedToSendOTP,
      'canResendOTP': instance.canResendOTP,
    };

const _$CurrentOnboardingStageEnumMap = {
  CurrentOnboardingStage.Login: 'Login',
  CurrentOnboardingStage.ChangePIN: 'ChangePIN',
  CurrentOnboardingStage.PINExpired: 'PINExpired',
};
