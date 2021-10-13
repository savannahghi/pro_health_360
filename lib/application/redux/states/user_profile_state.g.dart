// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileState _$_$_UserProfileStateFromJson(Map<String, dynamic> json) {
  return _$_UserProfileState(
    userProfile: json['userProfile'] == null
        ? null
        : UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
    customerProfile: json['customerProfile'] == null
        ? null
        : Customer.fromJson(json['customerProfile'] as Map<String, dynamic>),
    communicationSettings: json['communicationSettings'] == null
        ? null
        : CommunicationSettings.fromJson(
            json['communicationSettings'] as Map<String, dynamic>),
    auth: json['auth'] == null
        ? null
        : AuthCredentialResponse.fromJson(json['auth'] as Map<String, dynamic>),
    onboardingTourComplete: json['onboardingTourComplete'] as bool?,
    profileSetupComplete: json['profileSetupComplete'] as bool?,
    unmaskedPhoneNumbers: (json['unmaskedPhoneNumbers'] as List<dynamic>?)
        ?.map((e) => PhoneNumber.fromJson(e as String))
        .toList(),
    maskedPhoneNumbers: (json['maskedPhoneNumbers'] as List<dynamic>?)
        ?.map((e) => PhoneNumber.fromJson(e as String))
        .toList(),
    isSignedIn: json['isSignedIn'] as bool?,
    inActivitySetInTime: json['inActivitySetInTime'] as String?,
    signedInTime: json['signedInTime'] as String?,
    isFirstLaunch: json['isFirstLaunch'] as bool?,
    securityQuestions: (json['securityQuestions'] as List<dynamic>?)
        ?.map((e) => SecurityQuestion.fromJson(e as Map<String, dynamic>))
        .toList(),
    securityQuestionsResponses:
        (json['securityQuestionsResponses'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k, SecurityQuestionResponse.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$_$_UserProfileStateToJson(
        _$_UserProfileState instance) =>
    <String, dynamic>{
      'userProfile': instance.userProfile,
      'customerProfile': instance.customerProfile,
      'communicationSettings': instance.communicationSettings,
      'auth': instance.auth,
      'onboardingTourComplete': instance.onboardingTourComplete,
      'profileSetupComplete': instance.profileSetupComplete,
      'unmaskedPhoneNumbers': instance.unmaskedPhoneNumbers,
      'maskedPhoneNumbers': instance.maskedPhoneNumbers,
      'isSignedIn': instance.isSignedIn,
      'inActivitySetInTime': instance.inActivitySetInTime,
      'signedInTime': instance.signedInTime,
      'isFirstLaunch': instance.isFirstLaunch,
      'securityQuestions': instance.securityQuestions,
      'securityQuestionsResponses': instance.securityQuestionsResponses,
    };
