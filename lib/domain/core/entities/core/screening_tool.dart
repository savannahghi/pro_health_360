import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

part 'screening_tool.freezed.dart';
part 'screening_tool.g.dart';

@freezed
class ScreeningTool with _$ScreeningTool {
  factory ScreeningTool({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'toolType') ScreeningToolsType? toolType,
  }) = _ScreeningTool;

  factory ScreeningTool.fromJson(Map<String, dynamic> json) =>
      _$ScreeningToolFromJson(json);

  factory ScreeningTool.initial() => ScreeningTool(
        title: UNKNOWN,
        description: UNKNOWN,
        toolType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
      );
}
