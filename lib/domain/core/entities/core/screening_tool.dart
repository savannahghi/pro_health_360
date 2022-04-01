import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening_tool.freezed.dart';
part 'screening_tool.g.dart';

@freezed
class ScreeningTool with _$ScreeningTool {
  factory ScreeningTool({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
  }) = _ScreeningTool;

  factory ScreeningTool.fromJson(Map<String, dynamic> json) =>
      _$ScreeningToolFromJson(json);

  factory ScreeningTool.initial() => ScreeningTool(
        title: UNKNOWN,
        description: UNKNOWN,
      );
}
