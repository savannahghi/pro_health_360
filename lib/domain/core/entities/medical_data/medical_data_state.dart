import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/medical_data/medical_data.dart';

part 'medical_data_state.freezed.dart';
part 'medical_data_state.g.dart';

@freezed
class MedicalDataState with _$MedicalDataState {
  factory MedicalDataState({
    MedicalData? medicalData,
  }) = _MedicalDataState;

  factory MedicalDataState.fromJson(Map<String, dynamic> json) =>
      _$MedicalDataStateFromJson(json);

  factory MedicalDataState.initial() => MedicalDataState(
        medicalData: MedicalData.initial(),
      );
}
