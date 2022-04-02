// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_data_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicalDataState _$$_MedicalDataStateFromJson(Map<String, dynamic> json) =>
    _$_MedicalDataState(
      medicalData: json['medicalData'] == null
          ? null
          : MedicalData.fromJson(json['medicalData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MedicalDataStateToJson(_$_MedicalDataState instance) =>
    <String, dynamic>{
      'medicalData': instance.medicalData,
    };
