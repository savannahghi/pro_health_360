// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_details_item_obj.dart';

part 'health_diary_item_obj.g.dart';

@JsonSerializable()
class HealthDiaryItemObj {
  HealthDiaryItemObj({
    required this.date,
    required this.detailsList,
  });

  factory HealthDiaryItemObj.fromJson(Map<String, dynamic> json) =>
      _$HealthDiaryItemObjFromJson(json);

  final String date;
  List<HealthDiaryDetailsItemObj> detailsList;

  Map<String, dynamic> toJson() => _$HealthDiaryItemObjToJson(this);
}
