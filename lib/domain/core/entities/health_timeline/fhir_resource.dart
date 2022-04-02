import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/codeable_concept.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_enums.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/reaction.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/reference.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/resource.dart';

part 'fhir_resource.freezed.dart';
part 'fhir_resource.g.dart';

@Freezed(unionKey: 'resourceType', unionValueCase: FreezedUnionCase.pascal)
class FhirResource with _$FhirResource {
  @FreezedUnionValue('Observation')
  @Implements<Resource>()
  const factory FhirResource.observation({
    @JsonKey(name: 'category') List<CodeableConcept>? category,
    @JsonKey(name: 'code') CodeableConcept? code,
    @JsonKey(name: 'effectiveDateTime') String? date,
    @JsonKey(name: 'resourceType') ReferenceType? resourceType,
    @JsonKey(name: 'status', fromJson: observationStatusFromJson)
        ObservationStatus? status,
    @JsonKey(name: 'subject') Reference? patient,
    @JsonKey(name: 'timelineDate') String? timelineDate,
    @JsonKey(name: 'valueString') String? value,
  }) = Observation;

  @FreezedUnionValue('AllergyIntolerance')
  @Implements<Resource>()
  const factory FhirResource.allergyIntolerance({
    @JsonKey(name: 'category') List<AllergyIntoleranceCategory>? category,
    @JsonKey(name: 'clinicalStatus') CodeableConcept? clinicalStatus,
    @JsonKey(name: 'code') CodeableConcept? code,
    @JsonKey(name: 'patient') Reference? patient,
    @JsonKey(name: 'reaction') List<Reaction>? reaction,
    @JsonKey(name: 'recordedDate') String? recordedDate,
    @JsonKey(name: 'resourceType') ReferenceType? resourceType,
    @JsonKey(name: 'timelineDate') String? timelineDate,
    @JsonKey(name: 'type') AllergyIntoleranceType? type,
    @JsonKey(name: 'verificationStatus') CodeableConcept? verificationStatus,
  }) = AllergyIntolerance;

  @FreezedUnionValue('MedicationStatement')
  @Implements<Resource>()
  const factory FhirResource.medicationStatement({
    @JsonKey(name: 'category') CodeableConcept? category,
    @JsonKey(name: 'code') CodeableConcept? code,
    @JsonKey(name: 'effectiveDateTime') String? date,
    @JsonKey(name: 'medicationCodeableConcept') CodeableConcept? medication,
    @JsonKey(name: 'resourceType') ReferenceType? resourceType,
    @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
        MedicationStatusCodes? status,
    @JsonKey(name: 'subject') Reference? subject,
    @JsonKey(name: 'timelineDate') String? timelineDate,
  }) = MedicationStatement;

  factory FhirResource.fromJson(Map<String, dynamic> json) =>
      _$FhirResourceFromJson(json);
}
