// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQContent _$FAQContentFromJson(Map<String, dynamic> json) {
  return FAQContent(
    title: json['title'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$FAQContentToJson(FAQContent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };
