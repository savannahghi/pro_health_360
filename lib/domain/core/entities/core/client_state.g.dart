// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientState _$_$_ClientStateFromJson(Map<String, dynamic> json) {
  return _$_ClientState(
    id: json['id'] as String?,
    active: json['active'] as bool? ?? false,
    addresses: (json['addresses'] as List<dynamic>?)
        ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
        .toList(),
    counselled: json['counselled'] as bool? ?? false,
    clientType: _$enumDecodeNullable(_$ClientTypeEnumMap, json['clientType']) ??
        ClientType.UNKNOWN,
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
    facilityName: json['facilityName'] as String?,
    facilityPhoneNumber: json['facilityPhoneNumber'] as String?,
    chvUserID: json['chvUserID'] as String?,
    chvUserName: json['chvUserName'] as String?,
    healthDiaryState: json['healthDiaryState'] == null
        ? null
        : HealthDiaryState.fromJson(
            json['healthDiaryState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ClientStateToJson(_$_ClientState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'addresses': instance.addresses,
      'counselled': instance.counselled,
      'clientType': _$ClientTypeEnumMap[instance.clientType],
      'facilityID': instance.facilityID,
      'relatedPersons': instance.relatedPersons,
      'treatmentBuddy': instance.treatmentBuddy,
      'treatmentEnrollmentDate': instance.treatmentEnrollmentDate,
      'user': instance.user,
      'lastMoodRecordedDate': instance.lastMoodRecordedDate,
      'isSignedIn': instance.isSignedIn,
      'facilityName': instance.facilityName,
      'facilityPhoneNumber': instance.facilityPhoneNumber,
      'chvUserID': instance.chvUserID,
      'chvUserName': instance.chvUserName,
      'healthDiaryState': instance.healthDiaryState,
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
  ClientType.OTZ: 'OTZ',
  ClientType.OTZ_PLUS: 'OTZ_PLUS',
  ClientType.HVL: 'HVL',
  ClientType.DREAMS: 'DREAMS',
  ClientType.HIGH_RISK: 'HIGH_RISK',
  ClientType.SPOUSES: 'SPOUSES',
  ClientType.YOUTH: 'YOUTH',
  ClientType.UNKNOWN: 'UNKNOWN',
};
