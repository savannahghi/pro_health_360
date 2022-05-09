// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_data_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicalDataDetails _$$_MedicalDataDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_MedicalDataDetails(
      valueString: json['ValueString'] as String?,
      code: json['Code'] == null
          ? null
          : MedicalDataCode.fromJson(json['Code'] as Map<String, dynamic>),
      category: json['Category'] == null
          ? null
          : MedicalDataCategory.fromJson(
              json['Category'] as Map<String, dynamic>),
      medicationCodeableConcept: json['MedicationCodeableConcept'] == null
          ? null
          : MedicationCodeableConcept.fromJson(
              json['MedicationCodeableConcept'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MedicalDataDetailsToJson(
        _$_MedicalDataDetails instance) =>
    <String, dynamic>{
      'ValueString': instance.valueString,
      'Code': instance.code,
      'Category': instance.category,
      'MedicationCodeableConcept': instance.medicationCodeableConcept,
    };
