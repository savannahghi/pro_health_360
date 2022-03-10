import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'channel_members_state.freezed.dart';
part 'channel_members_state.g.dart';

@freezed
class ChannelMembersState with _$ChannelMembersState {
  factory ChannelMembersState({List<Member>? members}) = _ChannelMembersState;

  factory ChannelMembersState.fromJson(Map<String, dynamic> json) =>
      _$ChannelMembersStateFromJson(json);
}
