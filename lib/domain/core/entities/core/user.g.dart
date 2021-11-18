// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    userId: json['userID'] as String?,
    username: json['userName'] as String?,
    displayName: json['displayName'] as String?,
    firstName: json['firstName'] as String?,
    middleName: json['middleName'] as String?,
    lastName: json['lastName'] as String?,
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
    active: json['active'] as bool? ?? false,
    contacts: (json['contacts'] as List<dynamic>?)
        ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
        .toList(),
    languages:
        (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList(),
    termsAccepted: json['termsAccepted'] as bool?,
    pinChangeRequired: json['pinChangeRequired'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'userID': instance.userId,
      'userName': instance.username,
      'displayName': instance.displayName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'gender': _$GenderEnumMap[instance.gender],
      'active': instance.active,
      'contacts': instance.contacts,
      'languages': instance.languages,
      'termsAccepted': instance.termsAccepted,
      'pinChangeRequired': instance.pinChangeRequired,
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

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
};
