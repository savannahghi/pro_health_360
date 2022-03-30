// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codeable_concept.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CodeableConcept _$$_CodeableConceptFromJson(Map<String, dynamic> json) =>
    _$_CodeableConcept(
      coding: (json['coding'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Coding.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$_CodeableConceptToJson(_$_CodeableConcept instance) =>
    <String, dynamic>{
      'coding': instance.coding,
      'text': instance.text,
    };
