// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/communities/group.dart';

part 'groups_state.freezed.dart';
part 'groups_state.g.dart';

@freezed
class GroupState with _$GroupState {
  factory GroupState({
    @JsonKey(name: 'recommendedCommunities') List<Group?>? recommendedGroups,
    @JsonKey(name: 'listCommunityMembers') List<GroupMember?>? groupMembers,
  }) = _GroupState;

  factory GroupState.fromJson(Map<String, dynamic> json) =>
      _$GroupStateFromJson(json);

  factory GroupState.initial() => GroupState(
        recommendedGroups: <Group?>[],
        groupMembers: <GroupMember>[],
      );
}
