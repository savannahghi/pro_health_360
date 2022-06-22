import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/age_range.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class Community with _$Community {
  factory Community({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'memberCount') int? memberCount,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'createdBy') Member? createdBy,
    @JsonKey(name: 'ageRange') AgeRange? ageRange,
    @JsonKey(name: 'gender') List<Gender>? gender,
    @JsonKey(name: 'clientType') List<ClientType>? clientType,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);

  factory Community.initial() => Community(
        id: UNKNOWN,
        name: UNKNOWN,
        memberCount: 0,
        description: UNKNOWN,
        createdBy: Member.initial(),
        clientType: <ClientType>[],
      );
}
