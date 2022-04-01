// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_data_category.freezed.dart';
part 'medical_data_category.g.dart';

@freezed
class MedicalDataCategory with _$MedicalDataCategory {
  factory MedicalDataCategory({
    @JsonKey(name: 'Text') String? text,
  }) = _MedicalDataCategory;

  factory MedicalDataCategory.fromJson(Map<String, dynamic> json) =>
      _$MedicalDataCategoryFromJson(json);

  factory MedicalDataCategory.initial() => MedicalDataCategory(
        text: UNKNOWN,
      );
}
