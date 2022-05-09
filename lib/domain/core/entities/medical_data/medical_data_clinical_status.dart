// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_data_clinical_status.freezed.dart';
part 'medical_data_clinical_status.g.dart';

@freezed
class MedicalDataCode with _$MedicalDataCode {
  factory MedicalDataCode({
    @JsonKey(name: 'Text') String? text,
  }) = _MedicalDataCode;

  factory MedicalDataCode.fromJson(Map<String, dynamic> json) =>
      _$MedicalDataCodeFromJson(json);

  factory MedicalDataCode.initial() => MedicalDataCode(
        text: UNKNOWN,
      );
}
