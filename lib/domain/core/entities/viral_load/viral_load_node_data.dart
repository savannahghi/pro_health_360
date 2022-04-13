// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/viral_load/viral_load_code.dart';

part 'viral_load_node_data.freezed.dart';
part 'viral_load_node_data.g.dart';

@freezed
class ViralLoadNodeData with _$ViralLoadNodeData {
  factory ViralLoadNodeData({
    @JsonKey(name: 'Status') String? status,
    @JsonKey(name: 'ValueString') String? valueString,
    @JsonKey(name: 'EffectiveInstant') String? effectiveInstant,
    @JsonKey(name: 'Code') ViralLoadCode? code,
  }) = _ViralLoadNodeData;

  factory ViralLoadNodeData.fromJson(Map<String, dynamic> json) =>
      _$ViralLoadNodeDataFromJson(json);

  factory ViralLoadNodeData.initial() => ViralLoadNodeData(
        status: UNKNOWN,
        valueString: UNKNOWN,
        effectiveInstant: UNKNOWN,
        code: ViralLoadCode.initial(),
      );
}
