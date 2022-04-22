// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caregiver_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CaregiverInformation _$$_CaregiverInformationFromJson(
        Map<String, dynamic> json) =>
    _$_CaregiverInformation(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      caregiverType: caregiverTypeFromJson(json['caregiverType'] as String?),
    );

Map<String, dynamic> _$$_CaregiverInformationToJson(
        _$_CaregiverInformation instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'caregiverType': caregiverTypeToJson(instance.caregiverType),
    };
