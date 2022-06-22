// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/communities/group.dart';
import 'package:pro_health_360/domain/core/entities/core/community.dart';

part 'groups_state.freezed.dart';
part 'groups_state.g.dart';

@freezed
class GroupState with _$GroupState {
  factory GroupState({
    @JsonKey(name: 'recommendedCommunities') List<Group?>? recommendedGroups,
    @JsonKey(name: 'listCommunityMembers') List<GroupMember?>? groupMembers,
    List<Community?>? communities,
    bool? isModerator,
    bool? isOwner,
  }) = _GroupState;

  factory GroupState.fromJson(Map<String, dynamic> json) =>
      _$GroupStateFromJson(json);

  factory GroupState.initial() => GroupState(
        recommendedGroups: <Group?>[],
        groupMembers: <GroupMember>[],
        isModerator: false,
        isOwner: false,
        communities: <Community>[],
      );
}
