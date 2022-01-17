import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'caregiver_information.freezed.dart';
part 'caregiver_information.g.dart';

@freezed
class CaregiverInformation with _$CaregiverInformation {
  factory CaregiverInformation({
    String? clientID,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromJson, toJson: caregiverTypeToJson)
        CaregiverType? caregiverType,
  }) = _CaregiverInformation;

  factory CaregiverInformation.fromJson(Map<String, dynamic> json) =>
      _$CaregiverInformationFromJson(json);
}