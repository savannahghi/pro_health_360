// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientState _$_$_ClientStateFromJson(Map<String, dynamic> json) {
  return _$_ClientState(
    active: json['active'] as bool? ?? false,
    addresses: (json['addresses'] as List<dynamic>?)
        ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
        .toList(),
    clientCounselled: json['clientCounselled'] as bool? ?? false,
    clientType: _$enumDecodeNullable(_$ClientTypeEnumMap, json['clientType']),
    facilityID: json['facilityID'] as String?,
    relatedPersons: (json['relatedPersons'] as List<dynamic>?)
        ?.map((e) => RelatedPerson.fromJson(e as Map<String, dynamic>))
        .toList(),
    treatmentBuddy: json['treatmentBuddy'] as String?,
    treatmentEnrollmentDate: json['treatmentEnrollmentDate'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    lastMoodRecordedDate: json['lastMoodRecordedDate'] as String?,
    isSignedIn: json['isSignedIn'] as bool?,
  );
}

Map<String, dynamic> _$_$_ClientStateToJson(_$_ClientState instance) =>
    <String, dynamic>{
      'active': instance.active,
      'addresses': instance.addresses,
      'clientCounselled': instance.clientCounselled,
      'clientType': _$ClientTypeEnumMap[instance.clientType],
      'facilityID': instance.facilityID,
      'relatedPersons': instance.relatedPersons,
      'treatmentBuddy': instance.treatmentBuddy,
      'treatmentEnrollmentDate': instance.treatmentEnrollmentDate,
      'user': instance.user,
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
