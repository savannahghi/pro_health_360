// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  factory Group({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'cid') String? messagingID,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'disabled') bool? disabled,
    @JsonKey(name: 'memberCount') int? memberCount,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'gender') List<Gender>? gender,
    @JsonKey(name: 'clientType') List<ClientType>? clientType,
    @JsonKey(name: 'inviteOnly') bool? inviteOnly,
    @JsonKey(name: 'description') String? description,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

   factory Group.initial() => Group(
        id: UNKNOWN,
        messagingID: UNKNOWN,
        name: UNKNOWN,
        disabled: false,
        memberCount: 0,
        avatar: UNKNOWN,
        createdAt: UNKNOWN,
        updatedAt: UNKNOWN,
        gender: <Gender>[],
        clientType: <ClientType>[],
        inviteOnly: false,
        description: UNKNOWN,
      );
}
