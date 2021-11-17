// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientProfile _$_$_ClientProfileFromJson(Map<String, dynamic> json) {
  return _$_ClientProfile(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    active: json['active'] as bool?,
    lastMoodRecordedDate: json['lastMoodRecordedDate'] as String?,
    isSignedIn: json['isSignedIn'] as bool?,
  );
}

Map<String, dynamic> _$_$_ClientProfileToJson(_$_ClientProfile instance) =>
    <String, dynamic>{
      'user': instance.user,
      'active': instance.active,
      'lastMoodRecordedDate': instance.lastMoodRecordedDate,
      'isSignedIn': instance.isSignedIn,
    };
