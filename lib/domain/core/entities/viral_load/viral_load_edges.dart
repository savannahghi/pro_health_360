// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/viral_load/viral_load_node.dart';

part 'viral_load_edges.freezed.dart';
part 'viral_load_edges.g.dart';

@freezed
class ViralLoadEdges with _$ViralLoadEdges {
  factory ViralLoadEdges({
    @JsonKey(name: 'edges') List<ViralLoadNode?>? edges,
  }) = _ViralLoadEdges;

  factory ViralLoadEdges.fromJson(Map<String, dynamic> json) =>
      _$ViralLoadEdgesFromJson(json);

  factory ViralLoadEdges.initial() => ViralLoadEdges(
        edges: <ViralLoadNode>[],
      );
}
