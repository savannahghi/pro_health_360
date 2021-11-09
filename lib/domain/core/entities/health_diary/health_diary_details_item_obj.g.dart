// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_diary_details_item_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthDiaryDetailsItemObj _$HealthDiaryDetailsItemObjFromJson(
    Map<String, dynamic> json) {
  return HealthDiaryDetailsItemObj(
    svgIconPath: json['svgIconPath'] as String,
    time: json['time'] as String,
    description: json['description'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$HealthDiaryDetailsItemObjToJson(
        HealthDiaryDetailsItemObj instance) =>
    <String, dynamic>{
      'svgIconPath': instance.svgIconPath,
      'time': instance.time,
      'description': instance.description,
      'title': instance.title,
    };
