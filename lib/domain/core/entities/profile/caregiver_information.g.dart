// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caregiver_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CaregiverInformation _$_$_CaregiverInformationFromJson(
    Map<String, dynamic> json) {
  return _$_CaregiverInformation(
    clientID: json['clientID'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    caregiverType: caregiverTypeFromJson(json['caregiverType'] as String?),
  );
}

Map<String, dynamic> _$_$_CaregiverInformationToJson(
        _$_CaregiverInformation instance) =>
    <String, dynamic>{
      'clientID': instance.clientID,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'caregiverType': caregiverTypeToJson(instance.caregiverType),
    };
