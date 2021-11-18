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
    treatmentEnrollmentDate: json['treatmentEnrollmentDate'] as String?,
    clientType: _$enumDecodeNullable(_$ClientTypeEnumMap, json['clientType']),
    active: json['active'] as bool? ?? false,
    addresses: (json['addresses'] as List<dynamic>?)
        ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
        .toList(),
    relatedPersons: (json['relatedPersons'] as List<dynamic>?)
        ?.map((e) => RelatedPerson.fromJson(e as Map<String, dynamic>))
        .toList(),
    facilityID: json['facilityID'] as String?,
    treatmentBuddy: json['treatmentBuddy'] as String?,
    clientCounselled: json['clientCounselled'] as bool? ?? false,
    lastMoodRecordedDate: json['lastMoodRecordedDate'] as String?,
    isSignedIn: json['isSignedIn'] as bool?,
  );
}

Map<String, dynamic> _$_$_ClientProfileToJson(_$_ClientProfile instance) =>
    <String, dynamic>{
      'user': instance.user,
      'treatmentEnrollmentDate': instance.treatmentEnrollmentDate,
      'clientType': _$ClientTypeEnumMap[instance.clientType],
      'active': instance.active,
      'addresses': instance.addresses,
      'relatedPersons': instance.relatedPersons,
      'facilityID': instance.facilityID,
      'treatmentBuddy': instance.treatmentBuddy,
      'clientCounselled': instance.clientCounselled,
      'lastMoodRecordedDate': instance.lastMoodRecordedDate,
      'isSignedIn': instance.isSignedIn,
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

const _$ClientTypeEnumMap = {
  ClientType.PMTCT: 'PMTCT',
  ClientType.OVC: 'OVC',
  ClientType.UNKNOWN: 'UNKNOWN',
};
