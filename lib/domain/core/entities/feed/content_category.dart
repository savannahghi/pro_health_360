// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_category.freezed.dart';
part 'content_category.g.dart';

@freezed
class ContentCategory with _$ContentCategory {
  factory ContentCategory({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'categoryName') String? name,
    @JsonKey(name: 'categoryIcon') String? icon,
  }) = _ContentCategory;

  factory ContentCategory.fromJson(Map<String, dynamic> json) =>
      _$ContentCategoryFromJson(json);

  factory ContentCategory.initial() => ContentCategory(
        id: 0,
        name: UNKNOWN,
        icon: UNKNOWN,
      );
}
