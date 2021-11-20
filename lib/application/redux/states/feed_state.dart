// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_state.freezed.dart';
part 'feed_state.g.dart';

@freezed
class FeedState with _$FeedState {
  factory FeedState() = _FeedState;

  factory FeedState.fromJson(Map<String, dynamic> json) =>
      _$FeedStateFromJson(json);

  factory FeedState.initial() => FeedState();
}
