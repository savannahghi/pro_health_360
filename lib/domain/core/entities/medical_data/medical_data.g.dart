// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicalData _$$_MedicalDataFromJson(Map<String, dynamic> json) =>
    _$_MedicalData(
      regimen: json['regimen'] == null
          ? null
          : MedicalDataDetails.fromJson(
              json['regimen'] as Map<String, dynamic>),
      allergies: json['allergies'] == null
          ? null
          : MedicalDataDetails.fromJson(
              json['allergies'] as Map<String, dynamic>),
      weight: (json['weight'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MedicalDataDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      viralLoad: (json['viralLoad'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MedicalDataDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      bmi: (json['bmi'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MedicalDataDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      cd4Count: (json['cd4Count'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MedicalDataDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MedicalDataToJson(_$_MedicalData instance) =>
    <String, dynamic>{
      'regimen': instance.regimen,
      'allergies': instance.allergies,
      'weight': instance.weight,
      'viralLoad': instance.viralLoad,
      'bmi': instance.bmi,
      'cd4Count': instance.cd4Count,
    };
