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

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    addressType:
        _$enumDecodeNullable(_$AddressTypeEnumMap, json['addressType']),
    text: json['text'] as String?,
    country: json['country'] as String?,
    postalCode: json['postalCode'] as String?,
    county: json['county'] as String?,
    active: json['active'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'addressType': _$AddressTypeEnumMap[instance.addressType],
      'text': instance.text,
      'country': instance.country,
      'postalCode': instance.postalCode,
      'county': instance.county,
      'active': instance.active,
    };

const _$AddressTypeEnumMap = {
  AddressType.POSTAL: 'POSTAL',
  AddressType.PHYSICAL: 'PHYSICAL',
  AddressType.BOTH: 'BOTH',
  AddressType.UNKNOWN: 'UNKNOWN',
};

_$_RelatedPerson _$_$_RelatedPersonFromJson(Map<String, dynamic> json) {
  return _$_RelatedPerson(
    active: json['active'] as bool?,
    relatedTo: json['relatedTo'] as String?,
    relationshipType: _$enumDecodeNullable(
            _$RelationshipTypeEnumMap, json['relationshipType']) ??
        RelationshipType.UNKNOWN,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    otherName: json['otherName'] as String?,
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
    dateOfBirth: json['dateOfBirth'] as String?,
    addresses: (json['addresses'] as List<dynamic>?)
        ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
        .toList(),
    contacts: (json['contacts'] as List<dynamic>?)
        ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_RelatedPersonToJson(_$_RelatedPerson instance) =>
    <String, dynamic>{
      'active': instance.active,
      'relatedTo': instance.relatedTo,
      'relationshipType': _$RelationshipTypeEnumMap[instance.relationshipType],
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'otherName': instance.otherName,
      'gender': _$GenderEnumMap[instance.gender],
      'dateOfBirth': instance.dateOfBirth,
      'addresses': instance.addresses,
      'contacts': instance.contacts,
    };

const _$RelationshipTypeEnumMap = {
  RelationshipType.NEXT_OF_KIN: 'NEXT_OF_KIN',
  RelationshipType.EMPLOYER: 'EMPLOYER',
  RelationshipType.EMERGENCY_CONTACT: 'EMERGENCY_CONTACT',
  RelationshipType.CHILD: 'CHILD',
  RelationshipType.OTHER: 'OTHER',
  RelationshipType.UNKNOWN: 'UNKNOWN',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
};
