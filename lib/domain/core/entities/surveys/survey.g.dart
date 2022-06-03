// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Survey _$$_SurveyFromJson(Map<String, dynamic> json) => _$_Survey(
      id: json['id'] as String?,
      title: json['title'] as String?,
      link: json['link'] as String?,
      description: json['description'] as String?,
      projectID: json['projectID'] as int?,
      linkID: json['linkID'] as int?,
      formID: json['formID'] as String?,
    );

Map<String, dynamic> _$$_SurveyToJson(_$_Survey instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'link': instance.link,
      'description': instance.description,
      'projectID': instance.projectID,
      'linkID': instance.linkID,
      'formID': instance.formID,
    };
