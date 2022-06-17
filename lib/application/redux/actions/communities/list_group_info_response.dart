import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/community.dart';

part 'list_group_info_response.freezed.dart';
part 'list_group_info_response.g.dart';

@freezed
class ListGroupInfoResponse with _$ListGroupInfoResponse {
  factory ListGroupInfoResponse({
    @JsonKey(name: 'listCommunityMembers') List<GroupMember?>? groupMembers,
    @JsonKey(name: 'listCommunities') List<Community?>? communities,
  }) = _ListGroupInfoResponse;

  factory ListGroupInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGroupInfoResponseFromJson(json);
}
