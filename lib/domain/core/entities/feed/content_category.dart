// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_category.freezed.dart';
part 'content_category.g.dart';

@freezed
class ContentCategory with _$ContentCategory {
  factory ContentCategory({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'iconUrl') String? icon,
  }) = _ContentCategory;

  factory ContentCategory.fromJson(Map<String, dynamic> json) =>
      _$ContentCategoryFromJson(json);

  factory ContentCategory.initial() => ContentCategory(
        id: 0,
        name: 'all',
        icon: UNKNOWN,
      );
}
