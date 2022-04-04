// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/medical_data/medical_data_details.dart';

part 'medical_data.freezed.dart';
part 'medical_data.g.dart';

@freezed
class MedicalData with _$MedicalData {
  factory MedicalData({
    @JsonKey(name: 'regimen') List<MedicalDataDetails?>? regimen,
    @JsonKey(name: 'allergies') List<MedicalDataDetails?>? allergies,
    @JsonKey(name: 'weight') List<MedicalDataDetails?>? weight,
    @JsonKey(name: 'viralLoad') List<MedicalDataDetails?>? viralLoad,
    @JsonKey(name: 'bmi') List<MedicalDataDetails?>? bmi,
    @JsonKey(name: 'cd4Count') List<MedicalDataDetails?>? cd4Count,
  }) = _MedicalData;

  factory MedicalData.fromJson(Map<String, dynamic> json) =>
      _$MedicalDataFromJson(json);

  factory MedicalData.initial() => MedicalData(
        regimen: <MedicalDataDetails>[],
        allergies: <MedicalDataDetails>[],
        viralLoad: <MedicalDataDetails>[],
        bmi: <MedicalDataDetails>[],
        cd4Count: <MedicalDataDetails>[],
      );
}
