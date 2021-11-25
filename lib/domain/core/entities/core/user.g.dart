// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    userId: json['userID'] as String?,
    username: json['userName'] as String?,
    avatar: json['avatar'] as String?,
    displayName: json['displayName'] as String?,
    firstName: json['firstName'] as String?,
    middleName: json['middleName'] as String?,
    lastName: json['lastName'] as String?,
    dateOfBirth: json['dateOfBirth'] as String?,
    gender: _$enumDecodeNullable(_$UserGenderEnumMap, json['gender']) ??
        UserGender.UNKNOWN,
    active: json['active'] as bool? ?? false,
    primaryContact: json['primaryContact'] == null
        ? null
        : Contact.fromJson(json['primaryContact'] as Map<String, dynamic>),
    secondaryContacts: (json['secondaryContacts'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Contact.fromJson(e as Map<String, dynamic>))
        .toList(),
    languages:
        (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList(),
    termsAccepted: json['termsAccepted'] as bool?,
    hasSetPin: json['hasSetPin'] as bool?,
    hasSetSecurityQuestions: json['hasSetSecurityQuestions'] as bool?,
    hasSetNickname: json['hasSetNickname'] as bool?,
    isPhoneVerified: json['isPhoneVerified'] as bool?,
    pinChangeRequired: json['pinChangeRequired'] as bool? ?? false,
    suspended: json['suspended'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'userID': instance.userId,
      'userName': instance.username,
      'avatar': instance.avatar,
      'displayName': instance.displayName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': _$UserGenderEnumMap[instance.gender],
      'active': instance.active,
      'primaryContact': instance.primaryContact,
      'secondaryContacts': instance.secondaryContacts,
      'languages': instance.languages,
      'termsAccepted': instance.termsAccepted,
      'hasSetPin': instance.hasSetPin,
      'hasSetSecurityQuestions': instance.hasSetSecurityQuestions,
      'hasSetNickname': instance.hasSetNickname,
      'isPhoneVerified': instance.isPhoneVerified,
      'pinChangeRequired': instance.pinChangeRequired,
      'suspended': instance.suspended,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$UserGenderEnumMap = {
  UserGender.MALE: 'MALE',
  UserGender.FEMALE: 'FEMALE',
  UserGender.UNKNOWN: 'UNKNOWN',
};
