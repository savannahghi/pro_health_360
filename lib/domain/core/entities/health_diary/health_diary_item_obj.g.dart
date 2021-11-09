// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_diary_item_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthDiaryItemObj _$HealthDiaryItemObjFromJson(Map<String, dynamic> json) {
  return HealthDiaryItemObj(
    date: json['date'] as String,
    detailsList: (json['detailsList'] as List<dynamic>)
        .map((e) =>
            HealthDiaryDetailsItemObj.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HealthDiaryItemObjToJson(HealthDiaryItemObj instance) =>
    <String, dynamic>{
      'date': instance.date,
      'detailsList': instance.detailsList,
    };
