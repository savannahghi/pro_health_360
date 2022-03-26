import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/community.dart';

part 'pending_invites_response.freezed.dart';
part 'pending_invites_response.g.dart';

@freezed
class PendingInvitesResponse with _$PendingInvitesResponse {
  factory PendingInvitesResponse({
    @JsonKey(name: 'listPendingInvites') List<Community>? communities,
  }) = _PendingInvites;

  factory PendingInvitesResponse.fromJson(Map<String, dynamic> json) =>
      _$PendingInvitesResponseFromJson(json);
}
