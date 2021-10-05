import 'package:json_annotation/json_annotation.dart';

part 'health_diary_details_item_obj.g.dart';

@JsonSerializable()
class HealthDiaryDetailsItemObj {
  HealthDiaryDetailsItemObj({
    required this.svgIconPath,
    required this.time,
    required this.description,
    required this.title,
  });

  factory HealthDiaryDetailsItemObj.fromJson(Map<String, dynamic> json) =>
      _$HealthDiaryDetailsItemObjFromJson(json);

  final String svgIconPath;
  final String time;
  final String description;
  final String title;

  Map<String, dynamic> toJson() => _$HealthDiaryDetailsItemObjToJson(this);
}
