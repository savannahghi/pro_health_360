// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/core/community.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'communities_state.freezed.dart';
part 'communities_state.g.dart';

@freezed
class CommunitiesState with _$CommunitiesState {
  factory CommunitiesState({
    @JsonKey(name: 'invitedCommunities') List<Community?>? invitedCommunities,
    List<Message?>? flaggedMessages,
  }) = _CommunitiesState;

  factory CommunitiesState.fromJson(Map<String, dynamic> json) =>
      _$CommunitiesStateFromJson(json);

  factory CommunitiesState.initial() => CommunitiesState(
        invitedCommunities: <Community>[],
        flaggedMessages: <Message>[],
      );
}
