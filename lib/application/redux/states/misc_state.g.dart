// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MiscState _$_$_MiscStateFromJson(Map<String, dynamic> json) {
  return _$_MiscState(
    initialRoute: json['initialRoute'] as String?,
    userPin: json['userPin'] == null
        ? null
        : UserPin.fromJson(json['userPin'] as Map<String, dynamic>),
    libraryListItems: json['libraryListItems'] as List<dynamic>?,
    profileFAQsContentState: json['profileFAQsContentState'] == null
        ? null
        : FAQsContentState.fromJson(
            json['profileFAQsContentState'] as Map<String, dynamic>),
    healthPagePINInputTime: json['healthPagePINInputTime'] as String?,
    pinInputTries: json['pinInputTries'] as int?,
    maxTryTime: json['maxTryTime'] as String?,
    pinVerified: json['pinVerified'] as bool?,
    resumeTimer: json['resumeTimer'] as bool?,
  );
}

Map<String, dynamic> _$_$_MiscStateToJson(_$_MiscState instance) =>
    <String, dynamic>{
      'initialRoute': instance.initialRoute,
      'userPin': instance.userPin,
      'libraryListItems': instance.libraryListItems,
      'profileFAQsContentState': instance.profileFAQsContentState,
      'healthPagePINInputTime': instance.healthPagePINInputTime,
      'pinInputTries': instance.pinInputTries,
      'maxTryTime': instance.maxTryTime,
      'pinVerified': instance.pinVerified,
      'resumeTimer': instance.resumeTimer,
    };
