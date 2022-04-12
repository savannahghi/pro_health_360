// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viral_load_edges.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViralLoadEdges _$$_ViralLoadEdgesFromJson(Map<String, dynamic> json) =>
    _$_ViralLoadEdges(
      edges: (json['edges'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ViralLoadNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ViralLoadEdgesToJson(_$_ViralLoadEdges instance) =>
    <String, dynamic>{
      'edges': instance.edges,
    };
