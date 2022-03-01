// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedContent _$$_SavedContentFromJson(Map<String, dynamic> json) =>
    _$_SavedContent(
      savedContent: json['getUserBookmarkedContent'] == null
          ? null
          : FeedItems.fromJson(
              json['getUserBookmarkedContent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SavedContentToJson(_$_SavedContent instance) =>
    <String, dynamic>{
      'getUserBookmarkedContent': instance.savedContent,
    };
