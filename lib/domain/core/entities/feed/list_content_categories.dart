// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';

part 'list_content_categories.freezed.dart';
part 'list_content_categories.g.dart';

@freezed
class ListContentCategory with _$ListContentCategory {
  factory ListContentCategory({
    @JsonKey(name: 'listContentCategories')
        List<ContentCategory?>? contentCategories,
  }) = _ListContentCategory;

  factory ListContentCategory.fromJson(Map<String, dynamic> json) =>
      _$ListContentCategoryFromJson(json);
}
