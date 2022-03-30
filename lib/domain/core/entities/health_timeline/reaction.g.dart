// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reaction _$$_ReactionFromJson(Map<String, dynamic> json) => _$_Reaction(
      substance: json['Substance'] == null
          ? null
          : CodeableConcept.fromJson(json['Substance'] as Map<String, dynamic>),
      manifestation: (json['Manifestation'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CodeableConcept.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      severity: $enumDecodeNullable(
          _$AllergyIntoleranceSeverityEnumMap, json['Severity'],
          unknownValue: AllergyIntoleranceSeverity.moderate),
    );

Map<String, dynamic> _$$_ReactionToJson(_$_Reaction instance) =>
    <String, dynamic>{
      'Substance': instance.substance,
      'Manifestation': instance.manifestation,
      'Description': instance.description,
      'Severity': _$AllergyIntoleranceSeverityEnumMap[instance.severity],
    };

const _$AllergyIntoleranceSeverityEnumMap = {
  AllergyIntoleranceSeverity.mild: 'mild',
  AllergyIntoleranceSeverity.moderate: 'moderate',
  AllergyIntoleranceSeverity.severe: 'severe',
};
