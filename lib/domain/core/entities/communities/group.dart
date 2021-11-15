// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  factory Group({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'avatar') required String avatar,
    @JsonKey(name: 'members') required String members,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
