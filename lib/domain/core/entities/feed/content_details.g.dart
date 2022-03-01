// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentDetails _$ContentDetailsFromJson(Map<String, dynamic> json) =>
    ContentDetails(
      content: Content.fromJson(json['content'] as Map<String, dynamic>),
      showReactions: json['showReactions'] as bool? ?? true,
      contentDisplayedType: $enumDecodeNullable(
              _$ContentDisplayedTypeEnumMap, json['contentDisplayedType']) ??
          ContentDisplayedType.UNKNOWN,
    );

Map<String, dynamic> _$ContentDetailsToJson(ContentDetails instance) =>
    <String, dynamic>{
      'content': instance.content,
      'showReactions': instance.showReactions,
      'contentDisplayedType':
          _$ContentDisplayedTypeEnumMap[instance.contentDisplayedType],
    };

const _$ContentDisplayedTypeEnumMap = {
  ContentDisplayedType.RECENT: 'RECENT',
  ContentDisplayedType.FEED: 'FEED',
  ContentDisplayedType.BOOKMARK: 'BOOKMARK',
  ContentDisplayedType.UNKNOWN: 'UNKNOWN',
};
