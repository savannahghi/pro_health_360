// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_data_clinical_status.freezed.dart';
part 'medical_data_clinical_status.g.dart';

@freezed
class MedicalDataClinicalStatus with _$MedicalDataClinicalStatus {
  factory MedicalDataClinicalStatus({
    @JsonKey(name: 'Text') String? text,
  }) = _MedicalDataClinicalStatus;

  factory MedicalDataClinicalStatus.fromJson(Map<String, dynamic> json) =>
      _$MedicalDataClinicalStatusFromJson(json);

  factory MedicalDataClinicalStatus.initial() => MedicalDataClinicalStatus(
        text: UNKNOWN,
      );
}
