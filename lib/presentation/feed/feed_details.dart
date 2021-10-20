// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_details.freezed.dart';
part 'feed_details.g.dart';

@freezed
class FeedDetails with _$FeedDetails {
  factory FeedDetails({
    @JsonKey(name: 'coverImageUrl') required String coverImageUrl,
    @JsonKey(name: 'header') required String header,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'readTime') String? readTime,
    @JsonKey(name: 'authorName') required String authorName,
    @JsonKey(name: 'bodyContent') required String bodyContent,
    @JsonKey(name: 'authorDisplayPic') String? authorDisplayPic,
    @JsonKey(name: 'isNew') bool? isNew,
  }) = _FeedDetails;

  factory FeedDetails.fromJson(Map<String, dynamic> json) =>
      _$FeedDetailsFromJson(json);
}
