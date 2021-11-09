// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_diary_month_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthDiaryMonthObj _$HealthDiaryMonthObjFromJson(Map<String, dynamic> json) {
  return HealthDiaryMonthObj(
    month: json['month'] as String,
    year: json['year'] as String,
    diaryItems: (json['diaryItems'] as List<dynamic>)
        .map((e) => HealthDiaryItemObj.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HealthDiaryMonthObjToJson(
        HealthDiaryMonthObj instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'diaryItems': instance.diaryItems,
    };
