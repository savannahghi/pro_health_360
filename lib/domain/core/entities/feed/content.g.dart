// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Content _$$_ContentFromJson(Map<String, dynamic> json) => _$_Content(
      contentID: json['ID'] as int?,
      title: json['title'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      intro: json['intro'] as String?,
      authorName: json['authorName'] as String?,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      contentType: $enumDecodeNullable(_$ContentTypeEnumMap, json['itemType']),
      estimate: json['timeEstimateSeconds'] as int?,
      body: json['body'] as String?,
      heroImage: json['heroImageRendition'] == null
          ? null
          : HeroImage.fromJson(
              json['heroImageRendition'] as Map<String, dynamic>),
      likeCount: json['likeCount'] as int?,
      bookmarkCount: json['bookmarkCount'] as int?,
      viewCount: json['viewCount'] as int?,
      shareCount: json['shareCount'] as int?,
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categoryDetails'] as List<dynamic>?)
          ?.map((e) => ContentCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tagNames'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      metadata: json['meta'] == null
          ? null
          : ContentMetadata.fromJson(json['meta'] as Map<String, dynamic>),
      featuredMedia: (json['featuredMedia'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : FeaturedMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasLiked: json['hasLiked'] as bool? ?? false,
      hasSaved: json['hasSaved'] as bool? ?? false,
      galleryImages: (json['galleryImages'] as List<dynamic>?)
          ?.map((e) => GalleryImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ContentToJson(_$_Content instance) =>
    <String, dynamic>{
      'ID': instance.contentID,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'intro': instance.intro,
      'authorName': instance.authorName,
      'author': instance.author,
      'itemType': _$ContentTypeEnumMap[instance.contentType],
      'timeEstimateSeconds': instance.estimate,
      'body': instance.body,
      'heroImageRendition': instance.heroImage,
      'likeCount': instance.likeCount,
      'bookmarkCount': instance.bookmarkCount,
      'viewCount': instance.viewCount,
      'shareCount': instance.shareCount,
      'documents': instance.documents,
      'categoryDetails': instance.categories,
      'tagNames': instance.tags,
      'meta': instance.metadata,
      'featuredMedia': instance.featuredMedia,
      'hasLiked': instance.hasLiked,
      'hasSaved': instance.hasSaved,
      'galleryImages': instance.galleryImages,
    };

const _$ContentTypeEnumMap = {
  ContentType.AUDIO_VIDEO: 'AUDIO_VIDEO',
  ContentType.DOCUMENT: 'DOCUMENT',
  ContentType.ARTICLE: 'ARTICLE',
  ContentType.PDF_DOCUMENT: 'PDF_DOCUMENT',
  ContentType.UNKNOWN: 'UNKNOWN',
};
