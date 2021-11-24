// Package imports:

import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
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
      );
}

@freezed
class Document with _$Document {
  factory Document({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'title') String? title,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  factory Document.initial() => Document(id: 0, title: UNKNOWN);
}

@freezed
class ContentCategory with _$ContentCategory {
  factory ContentCategory({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'categoryName') String? name,
    @JsonKey(name: 'categoryIcon') String? icon,
  }) = _ContentCategory;

  factory ContentCategory.fromJson(Map<String, dynamic> json) =>
      _$ContentCategoryFromJson(json);

  factory ContentCategory.initial() => ContentCategory(
        id: 0,
        name: UNKNOWN,
        icon: UNKNOWN,
      );
}

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

@freezed
class Author with _$Author {
  factory Author({@JsonKey(name: 'ID') String? id}) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  factory Author.initial() => Author(id: UNKNOWN);
}

@freezed
class HeroImage with _$HeroImage {
  factory HeroImage({@JsonKey(name: 'url') String? url}) = _HeroImage;

  factory HeroImage.fromJson(Map<String, dynamic> json) =>
      _$HeroImageFromJson(json);

  factory HeroImage.initial() => HeroImage(url: UNKNOWN);
}
