// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viral_load_node_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViralLoadNodeData _$$_ViralLoadNodeDataFromJson(Map<String, dynamic> json) =>
    _$_ViralLoadNodeData(
      status: json['Status'] as String?,
      valueString: json['ValueString'] as String?,
      effectiveInstant: json['EffectiveInstant'] as String?,
      code: json['Code'] == null
          ? null
          : ViralLoadCode.fromJson(json['Code'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ViralLoadNodeDataToJson(
        _$_ViralLoadNodeData instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'ValueString': instance.valueString,
      'EffectiveInstant': instance.effectiveInstant,
      'Code': instance.code,
    };
