// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'content.freezed.dart';
part 'content.g.dart';

@freezed
class Content with _$Content {
  factory Content({
    @JsonKey(name: 'contentID') String? contentID,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'body') String? body,
    @JsonKey(name: 'author') String? author,
    @JsonKey(name: 'authorAvatar') String? authorAvatar,
    @JsonKey(name: 'heroImage') String? heroImage,
    @JsonKey(name: 'contentType') ContentType? contentType,
    @JsonKey(name: 'publicLink') String? publicLink,
    @JsonKey(name: 'isNew') bool? isNew,
    @JsonKey(name: 'estimate') String? estimate,
    @JsonKey(name: 'tags') List<String?>? tags,
    @JsonKey(name: 'createdAt') String? createdAt,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}
