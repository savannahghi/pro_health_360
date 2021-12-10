// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FAQContentResponse _$_$_FAQContentResponseFromJson(
    Map<String, dynamic> json) {
  return _$_FAQContentResponse(
    profileFAQsContent: (json['getFAQContent'] as List<dynamic>?)
        ?.map((e) => FAQContent.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_FAQContentResponseToJson(
        _$_FAQContentResponse instance) =>
    <String, dynamic>{
      'getFAQContent': instance.profileFAQsContent,
    };
