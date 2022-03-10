// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_members_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChannelMembersState _$$_ChannelMembersStateFromJson(
        Map<String, dynamic> json) =>
    _$_ChannelMembersState(
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChannelMembersStateToJson(
        _$_ChannelMembersState instance) =>
    <String, dynamic>{
      'members': instance.members,
    };
