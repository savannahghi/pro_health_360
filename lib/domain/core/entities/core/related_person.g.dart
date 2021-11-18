// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
