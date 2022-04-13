// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'next_refill_data.freezed.dart';
part 'next_refill_data.g.dart';

@freezed
class NextRefillData with _$NextRefillData {
  factory NextRefillData({
    @JsonKey(name: 'nextRefill') String? nextRefill,
  }) = _NextRefillData;

  factory NextRefillData.fromJson(Map<String, dynamic> json) =>
      _$NextRefillDataFromJson(json);

  factory NextRefillData.initial() => NextRefillData(
        nextRefill: UNKNOWN,
      );
}
