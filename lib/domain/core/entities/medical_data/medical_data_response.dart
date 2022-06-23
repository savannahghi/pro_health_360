// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/medical_data.dart';

part 'medical_data_response.freezed.dart';
part 'medical_data_response.g.dart';

@freezed
class MedicalDataResponse with _$MedicalDataResponse {
  factory MedicalDataResponse({
    @JsonKey(name: 'getMedicalData') MedicalData? medicalData,
  }) = _MedicalDataResponse;

  factory MedicalDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalDataResponseFromJson(json);

  factory MedicalDataResponse.initial() => MedicalDataResponse(
        medicalData: MedicalData.initial(),
      );
}
