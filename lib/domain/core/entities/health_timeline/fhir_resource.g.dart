// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fhir_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Observation _$$ObservationFromJson(Map<String, dynamic> json) =>
    _$Observation(
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] == null
          ? null
          : CodeableConcept.fromJson(json['code'] as Map<String, dynamic>),
      date: json['effectiveInstant'] as String?,
      resourceType:
          $enumDecodeNullable(_$ReferenceTypeEnumMap, json['resourceType']),
      status: observationStatusFromJson(json['status'] as String?),
      patient: json['subject'] == null
          ? null
          : Reference.fromJson(json['subject'] as Map<String, dynamic>),
      timelineDate: json['timelineDate'] as String?,
      value: json['valueString'] as String?,
    );

Map<String, dynamic> _$$ObservationToJson(_$Observation instance) =>
    <String, dynamic>{
      'category': instance.category,
      'code': instance.code,
      'effectiveInstant': instance.date,
      'resourceType': _$ReferenceTypeEnumMap[instance.resourceType],
      'status': _$ObservationStatusEnumMap[instance.status],
      'subject': instance.patient,
      'timelineDate': instance.timelineDate,
      'valueString': instance.value,
    };

const _$ReferenceTypeEnumMap = {
  ReferenceType.Observation: 'Observation',
  ReferenceType.AllergyIntolerance: 'AllergyIntolerance',
  ReferenceType.MedicationStatement: 'MedicationStatement',
};

const _$ObservationStatusEnumMap = {
  ObservationStatus.Registered: 'Registered',
  ObservationStatus.Preliminary: 'Preliminary',
  ObservationStatus.Final: 'Final',
  ObservationStatus.Amended: 'Amended',
  ObservationStatus.Corrected: 'Corrected',
  ObservationStatus.Cancelled: 'Cancelled',
  ObservationStatus.Entered_in_error: 'Entered_in_error',
  ObservationStatus.Unknown: 'Unknown',
};

_$AllergyIntolerance _$$AllergyIntoleranceFromJson(Map<String, dynamic> json) =>
    _$AllergyIntolerance(
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$AllergyIntoleranceCategoryEnumMap, e))
          .toList(),
      clinicalStatus: json['clinicalStatus'] == null
          ? null
          : CodeableConcept.fromJson(
              json['clinicalStatus'] as Map<String, dynamic>),
      code: json['code'] == null
          ? null
          : CodeableConcept.fromJson(json['code'] as Map<String, dynamic>),
      patient: json['patient'] == null
          ? null
          : Reference.fromJson(json['patient'] as Map<String, dynamic>),
      reaction: (json['reaction'] as List<dynamic>?)
          ?.map((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      recordedDate: json['recordedDate'] as String?,
      resourceType:
          $enumDecodeNullable(_$ReferenceTypeEnumMap, json['resourceType']),
      timelineDate: json['timelineDate'] as String?,
      type: $enumDecodeNullable(_$AllergyIntoleranceTypeEnumMap, json['type']),
      verificationStatus: json['verificationStatus'] == null
          ? null
          : CodeableConcept.fromJson(
              json['verificationStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AllergyIntoleranceToJson(
        _$AllergyIntolerance instance) =>
    <String, dynamic>{
      'category': instance.category
          ?.map((e) => _$AllergyIntoleranceCategoryEnumMap[e])
          .toList(),
      'clinicalStatus': instance.clinicalStatus,
      'code': instance.code,
      'patient': instance.patient,
      'reaction': instance.reaction,
      'recordedDate': instance.recordedDate,
      'resourceType': _$ReferenceTypeEnumMap[instance.resourceType],
      'timelineDate': instance.timelineDate,
      'type': _$AllergyIntoleranceTypeEnumMap[instance.type],
      'verificationStatus': instance.verificationStatus,
    };

const _$AllergyIntoleranceCategoryEnumMap = {
  AllergyIntoleranceCategory.food: 'food',
  AllergyIntoleranceCategory.medication: 'medication',
  AllergyIntoleranceCategory.environment: 'environment',
  AllergyIntoleranceCategory.biologic: 'biologic',
};

const _$AllergyIntoleranceTypeEnumMap = {
  AllergyIntoleranceType.allergy: 'allergy',
  AllergyIntoleranceType.intolerance: 'intolerance',
};

_$MedicationStatement _$$MedicationStatementFromJson(
        Map<String, dynamic> json) =>
    _$MedicationStatement(
      category: json['category'] == null
          ? null
          : CodeableConcept.fromJson(json['category'] as Map<String, dynamic>),
      code: json['code'] == null
          ? null
          : CodeableConcept.fromJson(json['code'] as Map<String, dynamic>),
      date: json['effectiveDateTime'] as String?,
      medication: json['medicationCodeableConcept'] == null
          ? null
          : CodeableConcept.fromJson(
              json['medicationCodeableConcept'] as Map<String, dynamic>),
      resourceType:
          $enumDecodeNullable(_$ReferenceTypeEnumMap, json['resourceType']),
      status: medicationStatusCodesFromJson(json['status'] as String?),
      subject: json['subject'] == null
          ? null
          : Reference.fromJson(json['subject'] as Map<String, dynamic>),
      timelineDate: json['timelineDate'] as String?,
    );

Map<String, dynamic> _$$MedicationStatementToJson(
        _$MedicationStatement instance) =>
    <String, dynamic>{
      'category': instance.category,
      'code': instance.code,
      'effectiveDateTime': instance.date,
      'medicationCodeableConcept': instance.medication,
      'resourceType': _$ReferenceTypeEnumMap[instance.resourceType],
      'status': _$MedicationStatusCodesEnumMap[instance.status],
      'subject': instance.subject,
      'timelineDate': instance.timelineDate,
    };

const _$MedicationStatusCodesEnumMap = {
  MedicationStatusCodes.active: 'active',
  MedicationStatusCodes.completed: 'completed',
  MedicationStatusCodes.entered_in_error: 'entered_in_error',
  MedicationStatusCodes.intended: 'intended',
  MedicationStatusCodes.stopped: 'stopped',
  MedicationStatusCodes.on_hold: 'on_hold',
  MedicationStatusCodes.unknown: 'unknown',
  MedicationStatusCodes.not_taken: 'not_taken',
};
