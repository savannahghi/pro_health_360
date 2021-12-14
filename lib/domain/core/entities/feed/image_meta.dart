import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_meta.freezed.dart';
part 'image_meta.g.dart';

@freezed
class ImageMeta with _$ImageMeta {
  factory ImageMeta({
    String? imageDownloadUrl,
  }) = _ImageMeta;

  factory ImageMeta.fromJson(Map<String, dynamic> json) =>
      _$ImageMetaFromJson(json);
}
