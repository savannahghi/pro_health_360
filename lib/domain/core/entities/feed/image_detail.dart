import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/feed/image_meta.dart';

part 'image_detail.freezed.dart';
part 'image_detail.g.dart';

@freezed
class ImageDetail with _$ImageDetail {
  factory ImageDetail({
    int? id,
    String? title,
    ImageMeta? meta,
  }) = _ImageDetail;

  factory ImageDetail.fromJson(Map<String, dynamic> json) =>
      _$ImageDetailFromJson(json);
}
