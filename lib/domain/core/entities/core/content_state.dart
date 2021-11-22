// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';

part 'content_state.freezed.dart';
part 'content_state.g.dart';

@freezed
class ContentState with _$ContentState {
  factory ContentState({@JsonKey(name: 'items') List<Content>? contentItems}) =
      _ContentState;

  factory ContentState.fromJson(Map<String, dynamic> json) =>
      _$ContentStateFromJson(json);

  factory ContentState.initial() => ContentState(contentItems: <Content>[]);
}
