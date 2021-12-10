// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FAQContent _$_$_FAQContentFromJson(Map<String, dynamic> json) {
  return _$_FAQContent(
    id: json['ID'] as String?,
    active: json['Active'] as bool?,
    title: json['Title'] as String?,
    description: json['Description'] as String?,
    body: json['Body'] as String?,
    flavour: json['Flavour'] as String?,
  );
}

Map<String, dynamic> _$_$_FAQContentToJson(_$_FAQContent instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Active': instance.active,
      'Title': instance.title,
      'Description': instance.description,
      'Body': instance.body,
      'Flavour': instance.flavour,
    };
