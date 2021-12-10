import 'package:domain_objects/value_objects.dart';
// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'featured_media.freezed.dart';
part 'featured_media.g.dart';

@freezed
class FeaturedMedia with _$FeaturedMedia {
  factory FeaturedMedia({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'url') String? mediaUrl,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'type', unknownEnumValue: FeaturedMediaType.UNKNOWN)
        FeaturedMediaType? featuredMediaType,
    @JsonKey(name: 'duration') int? duration,
    @JsonKey(name: 'width') int? width,
    @JsonKey(name: 'height') int? height,
    @JsonKey(name: 'thumbnail') String? thumbnail,
  }) = _FeaturedMedia;

  factory FeaturedMedia.fromJson(Map<String, dynamic> json) =>
      _$FeaturedMediaFromJson(json);

  factory FeaturedMedia.initial() => FeaturedMedia(
        id: 0,
        title: UNKNOWN,
        mediaUrl: UNKNOWN,
        featuredMediaType: FeaturedMediaType.UNKNOWN,
        width: 0,
        height: 0,
        thumbnail: UNKNOWN,
      );
}
