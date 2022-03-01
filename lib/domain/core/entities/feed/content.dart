// Package imports:

// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/author.dart';
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';
import 'package:myafyahub/domain/core/entities/feed/content_metadata.dart';
import 'package:myafyahub/domain/core/entities/feed/document.dart';
import 'package:myafyahub/domain/core/entities/feed/featured_media.dart';
import 'package:myafyahub/domain/core/entities/feed/gallery_image.dart';
import 'package:myafyahub/domain/core/entities/feed/hero_image.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'content.freezed.dart';
part 'content.g.dart';

@freezed
class Content with _$Content {
  factory Content({
    @JsonKey(name: 'ID') int? contentID,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'intro') String? intro,
    // TODO(abiud): move this to the Author object
    @JsonKey(name: 'authorName') String? authorName,
    // TODO(abiud): add when backend is ready
    // @JsonKey(name: 'authorAvatar') String? authorAvatar,
    @JsonKey(name: 'author') Author? author,
    @JsonKey(name: 'itemType') ContentType? contentType, // "ARTICLE"
    @JsonKey(name: 'timeEstimateSeconds') int? estimate,
    @JsonKey(name: 'body') String? body,
    @JsonKey(name: 'heroImageRendition') HeroImage? heroImage,
    @JsonKey(name: 'likeCount') int? likeCount,
    @JsonKey(name: 'bookmarkCount') int? bookmarkCount,
    @JsonKey(name: 'viewCount') int? viewCount,
    @JsonKey(name: 'shareCount') int? shareCount,
    @JsonKey(name: 'documents') List<Document>? documents,
    @JsonKey(name: 'categoryDetails') List<ContentCategory>? categories,
    // TODO(abiud): add when backend is ready
    // @JsonKey(name: 'isNew') bool? isNew,
    @JsonKey(name: 'tagNames') List<String?>? tags,
    @JsonKey(name: 'meta') ContentMetadata? metadata,
    @JsonKey(name: 'featuredMedia') List<FeaturedMedia?>? featuredMedia,
    // Internal trackers to know whether this user has performed any action on
    // this content item
    @JsonKey(name: 'hasLiked', defaultValue: false) bool? hasLiked,
    @JsonKey(name: 'hasSaved', defaultValue: false) bool? hasSaved,
    @JsonKey(name: 'galleryImages') List<GalleryImage>? galleryImages,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  factory Content.initial() => Content(
        contentID: 0,
        title: UNKNOWN,
        date: UNKNOWN,
        intro: UNKNOWN,
        authorName: UNKNOWN,
        author: Author.initial(),
        contentType: ContentType.UNKNOWN,
        estimate: 0,
        body: UNKNOWN,
        heroImage: HeroImage.initial(),
        likeCount: 0,
        bookmarkCount: 0,
        viewCount: 0,
        shareCount: 0,
        documents: <Document>[],
        categories: <ContentCategory>[],
        metadata: ContentMetadata.initial(),
        hasLiked: false,
        hasSaved: false,
      );
}
