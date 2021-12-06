import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';

part 'saved_content_state.freezed.dart';
part 'saved_content_state.g.dart';

@freezed
class SavedContentState with _$SavedContentState {
  factory SavedContentState({
    @JsonKey(name: 'items') List<Content?>? savedContentItems,
    bool? errorFetchingContent,
    bool? timeoutFetchingContent,
  }) = _SavedContentState;

  factory SavedContentState.fromJson(Map<String, dynamic> json) =>
      _$SavedContentStateFromJson(json);

  factory SavedContentState.initial() => SavedContentState(
        savedContentItems: <Content>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
      );
}
