// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'app_review_obj.g.dart';

@JsonSerializable()
class AppReviewObj {
  AppReviewObj({
    this.launches = 0,
    this.days = 0,
    this.lastLaunchDate = '',
    this.shouldRateApp = true,
  });

  factory AppReviewObj.fromJson(Map<String, dynamic> json) =>
      _$AppReviewObjFromJson(json);

  final int? days;
  final String? lastLaunchDate;
  final int? launches;
  final bool? shouldRateApp;

  Map<String, dynamic> toJson() => _$AppReviewObjToJson(this);
}
