// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentDetails _$ContentDetailsFromJson(Map<String, dynamic> json) {
  return ContentDetails(
    content: Content.fromJson(json['content'] as Map<String, dynamic>),
    showReactions: json['showReactions'] as bool,
  );
}

Map<String, dynamic> _$ContentDetailsToJson(ContentDetails instance) =>
    <String, dynamic>{
      'content': instance.content,
      'showReactions': instance.showReactions,
    };
