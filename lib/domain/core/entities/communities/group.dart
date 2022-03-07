// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  factory Group({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'memberCount') int? memberCount,
    @JsonKey(name: 'avatar') String? avatar,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

   factory Group.initial() => Group(
        id: UNKNOWN,
        name: UNKNOWN,
        memberCount: 0,
        avatar: UNKNOWN,
      );
}
