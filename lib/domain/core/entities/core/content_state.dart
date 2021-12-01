// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';

part 'content_state.freezed.dart';
part 'content_state.g.dart';

@freezed
class ContentState with _$ContentState {
  factory ContentState({
    @JsonKey(name: 'items') List<Content?>? contentItems,
    ContentCategory? selectedCategory,
    bool? errorFetchingContent,
    bool? timeoutFetchingContent,
  }) = _ContentState;

  factory ContentState.fromJson(Map<String, dynamic> json) =>
      _$ContentStateFromJson(json);

  factory ContentState.initial() => ContentState(
        contentItems: <Content>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
        selectedCategory: ContentCategory.initial(),
      );
}
