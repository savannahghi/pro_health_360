// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_item_obj.dart';

part 'health_diary_month_obj.g.dart';

@JsonSerializable()
class HealthDiaryMonthObj {
  HealthDiaryMonthObj({
    required this.month,
    required this.year,
    required this.diaryItems,
  });

  factory HealthDiaryMonthObj.fromJson(Map<String, dynamic> json) =>
      _$HealthDiaryMonthObjFromJson(json);
  final String month;
  final String year;
  final List<HealthDiaryItemObj> diaryItems;

  Map<String, dynamic> toJson() => _$HealthDiaryMonthObjToJson(this);
}
