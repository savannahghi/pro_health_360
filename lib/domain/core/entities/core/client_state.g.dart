// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientState _$$_ClientStateFromJson(Map<String, dynamic> json) =>
    _$_ClientState(
      id: json['id'] as String?,
      active: json['active'] as bool? ?? false,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      counselled: json['counselled'] as bool? ?? false,
      clientType:
          $enumDecodeNullable(_$ClientTypeEnumMap, json['clientType']) ??
              ClientType.UNKNOWN,
      facilityID: json['facilityID'] as String?,
      relatedPersons: (json['relatedPersons'] as List<dynamic>?)
          ?.map((e) => RelatedPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
      treatmentBuddy: json['treatmentBuddy'] as String?,
      treatmentEnrollmentDate: json['treatmentEnrollmentDate'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      lastMoodRecordedDate: json['lastMoodRecordedDate'] as String?,
      isSignedIn: json['isSignedIn'] as bool?,
      facilityName: json['facilityName'] as String?,
      facilityPhoneNumber: json['facilityPhoneNumber'] as String?,
      chvUserID: json['chvUserID'] as String?,
      chvUserName: json['chvUserName'] as String?,
      cccNumber: json['CCCNumber'] as String?,
      fhirPatientID: json['fhirPatientID'] as String?,
      healthDiaryState: json['healthDiaryState'] == null
          ? null
          : HealthDiaryState.fromJson(
              json['healthDiaryState'] as Map<String, dynamic>),
      communitiesState: json['communitiesState'] == null
          ? null
          : CommunitiesState.fromJson(
              json['communitiesState'] as Map<String, dynamic>),
      pastAppointments: (json['pastAppointments'] as List<dynamic>?)
          ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      upcomingAppointments: (json['upcomingAppointments'] as List<dynamic>?)
          ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      healthTimelineState: json['healthTimelineState'] == null
          ? null
          : HealthTimelineState.fromJson(
              json['healthTimelineState'] as Map<String, dynamic>),
      medicalDataState: json['medicalDataState'] == null
          ? null
          : MedicalDataState.fromJson(
              json['medicalDataState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ClientStateToJson(_$_ClientState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'addresses': instance.addresses,
      'counselled': instance.counselled,
      'clientType': _$ClientTypeEnumMap[instance.clientType],
      'facilityID': instance.facilityID,
      'relatedPersons': instance.relatedPersons,
      'treatmentBuddy': instance.treatmentBuddy,
      'treatmentEnrollmentDate': instance.treatmentEnrollmentDate,
      'user': instance.user,
      'lastMoodRecordedDate': instance.lastMoodRecordedDate,
      'isSignedIn': instance.isSignedIn,
      'facilityName': instance.facilityName,
      'facilityPhoneNumber': instance.facilityPhoneNumber,
      'chvUserID': instance.chvUserID,
      'chvUserName': instance.chvUserName,
      'CCCNumber': instance.cccNumber,
      'fhirPatientID': instance.fhirPatientID,
      'healthDiaryState': instance.healthDiaryState,
      'communitiesState': instance.communitiesState,
      'pastAppointments': instance.pastAppointments,
      'upcomingAppointments': instance.upcomingAppointments,
      'healthTimelineState': instance.healthTimelineState,
      'medicalDataState': instance.medicalDataState,
    };

const _$ClientTypeEnumMap = {
  ClientType.PMTCT: 'PMTCT',
  ClientType.OVC: 'OVC',
  ClientType.OTZ: 'OTZ',
  ClientType.OTZ_PLUS: 'OTZ_PLUS',
  ClientType.HVL: 'HVL',
  ClientType.DREAMS: 'DREAMS',
  ClientType.HIGH_RISK: 'HIGH_RISK',
  ClientType.SPOUSES: 'SPOUSES',
  ClientType.YOUTH: 'YOUTH',
  ClientType.UNKNOWN: 'UNKNOWN',
};
