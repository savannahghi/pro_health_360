// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'viral_load_code.freezed.dart';
part 'viral_load_code.g.dart';

@freezed
class ViralLoadCode with _$ViralLoadCode {
  factory ViralLoadCode({
    @JsonKey(name: 'Text') String? text,
  }) = _ViralLoadCode;

  factory ViralLoadCode.fromJson(Map<String, dynamic> json) =>
      _$ViralLoadCodeFromJson(json);

  factory ViralLoadCode.initial() => ViralLoadCode(
        text: UNKNOWN,
      );
}
