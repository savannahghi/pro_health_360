// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/viral_load/viral_load_node_data.dart';

part 'viral_load_node.freezed.dart';
part 'viral_load_node.g.dart';

@freezed
class ViralLoadNode with _$ViralLoadNode {
  factory ViralLoadNode({
    @JsonKey(name: 'node') ViralLoadNodeData? node,
  }) = _ViralLoadNode;

  factory ViralLoadNode.fromJson(Map<String, dynamic> json) =>
      _$ViralLoadNodeFromJson(json);

  factory ViralLoadNode.initial() => ViralLoadNode(
        node: ViralLoadNodeData.initial(),
      );
}
