// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication_codeable_concept.freezed.dart';
part 'medication_codeable_concept.g.dart';

@freezed
class MedicationCodeableConcept with _$MedicationCodeableConcept {
  factory MedicationCodeableConcept({
    @JsonKey(name: 'Text') String? text,
  }) = _MedicationCodeableConcept;

  factory MedicationCodeableConcept.fromJson(Map<String, dynamic> json) =>
      _$MedicationCodeableConceptFromJson(json);

  factory MedicationCodeableConcept.initial() => MedicationCodeableConcept(
        text: UNKNOWN,
      );
}
