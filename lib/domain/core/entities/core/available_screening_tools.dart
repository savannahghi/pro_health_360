import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/screening_tool.dart';

part 'available_screening_tools.freezed.dart';
part 'available_screening_tools.g.dart';

@freezed
class AvailableScreeningTools with _$AvailableScreeningTools {
  factory AvailableScreeningTools({
    @JsonKey(name: 'availableScreeningTools')
        List<ScreeningTool>? availableScreeningTools,
  }) = _AvailableScreeningTools;

  factory AvailableScreeningTools.fromJson(Map<String, dynamic> json) =>
      _$AvailableScreeningToolsFromJson(json);

  factory AvailableScreeningTools.initial() =>
      AvailableScreeningTools(availableScreeningTools: <ScreeningTool>[]);
}
