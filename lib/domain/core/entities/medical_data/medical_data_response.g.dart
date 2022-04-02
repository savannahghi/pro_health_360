// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicalDataResponse _$$_MedicalDataResponseFromJson(
        Map<String, dynamic> json) =>
    _$_MedicalDataResponse(
      medicalData: json['getMedicalData'] == null
          ? null
          : MedicalData.fromJson(
              json['getMedicalData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MedicalDataResponseToJson(
        _$_MedicalDataResponse instance) =>
    <String, dynamic>{
      'getMedicalData': instance.medicalData,
    };
