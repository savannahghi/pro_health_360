// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RelatedPerson _$$_RelatedPersonFromJson(Map<String, dynamic> json) =>
    _$_RelatedPerson(
      active: json['active'] as bool?,
      relatedTo: json['relatedTo'] as String?,
      relationshipType: $enumDecodeNullable(
              _$RelationshipTypeEnumMap, json['relationshipType']) ??
          RelationshipType.UNKNOWN,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      otherName: json['otherName'] as String?,
      gender: genderFromJson(json['gender'] as String?),
      dateOfBirth: json['dateOfBirth'] as String?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RelatedPersonToJson(_$_RelatedPerson instance) =>
    <String, dynamic>{
      'active': instance.active,
      'relatedTo': instance.relatedTo,
      'relationshipType': _$RelationshipTypeEnumMap[instance.relationshipType],
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'otherName': instance.otherName,
      'gender': genderToJson(instance.gender),
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
