import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/application/core/services/utils.dart';

part 'caregiver_information.freezed.dart';
part 'caregiver_information.g.dart';

@freezed
class CaregiverInformation with _$CaregiverInformation {
  factory CaregiverInformation({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromJson, toJson: caregiverTypeToJson)
        CaregiverType? caregiverType,
    String? clientID,
  }) = _CaregiverInformation;

  factory CaregiverInformation.fromJson(Map<String, dynamic> json) =>
      _$CaregiverInformationFromJson(json);

  factory CaregiverInformation.initial() => CaregiverInformation(
        firstName: UNKNOWN,
        lastName: UNKNOWN,
        phoneNumber: UNKNOWN,
        caregiverType: CaregiverType.HEALTHCARE_PROFESSIONAL,
        clientID: UNKNOWN,
      );
}
