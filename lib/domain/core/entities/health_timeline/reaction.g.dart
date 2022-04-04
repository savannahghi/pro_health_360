// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reaction _$$_ReactionFromJson(Map<String, dynamic> json) => _$_Reaction(
      substance: json['substance'] == null
          ? null
          : CodeableConcept.fromJson(json['substance'] as Map<String, dynamic>),
      manifestation: (json['manifestation'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CodeableConcept.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      severity: $enumDecodeNullable(
          _$AllergyIntoleranceSeverityEnumMap, json['severity'],
          unknownValue: AllergyIntoleranceSeverity.moderate),
    );

Map<String, dynamic> _$$_ReactionToJson(_$_Reaction instance) =>
    <String, dynamic>{
      'substance': instance.substance,
      'manifestation': instance.manifestation,
      'description': instance.description,
      'severity': _$AllergyIntoleranceSeverityEnumMap[instance.severity],
    };

const _$AllergyIntoleranceSeverityEnumMap = {
  AllergyIntoleranceSeverity.mild: 'mild',
  AllergyIntoleranceSeverity.moderate: 'moderate',
  AllergyIntoleranceSeverity.severe: 'severe',
};
