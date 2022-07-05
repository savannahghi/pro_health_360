// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_content_state.freezed.dart';
part 'saved_content_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
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
