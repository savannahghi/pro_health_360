// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_metadata.freezed.dart';
part 'content_metadata.g.dart';


@freezed
class ContentMetadata with _$ContentMetadata {
  factory ContentMetadata({
    @JsonKey(name: 'contentHTMLURL') String? publicLink,
    @JsonKey(name: 'firstPublishedAt') String? createdAt,
  }) = _ContentMetadata;

  factory ContentMetadata.fromJson(Map<String, dynamic> json) =>
      _$ContentMetadataFromJson(json);

  factory ContentMetadata.initial() => ContentMetadata(
        publicLink: UNKNOWN,
        createdAt: UNKNOWN,
      );
}
