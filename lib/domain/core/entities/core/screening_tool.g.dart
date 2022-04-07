// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_tool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningTool _$$_ScreeningToolFromJson(Map<String, dynamic> json) =>
    _$_ScreeningTool(
      title: json['title'] as String?,
      description: json['description'] as String?,
      toolType:
          $enumDecodeNullable(_$ScreeningToolsTypeEnumMap, json['toolType']),
    );

Map<String, dynamic> _$$_ScreeningToolToJson(_$_ScreeningTool instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'toolType': _$ScreeningToolsTypeEnumMap[instance.toolType],
    };

const _$ScreeningToolsTypeEnumMap = {
  ScreeningToolsType.VIOLENCE_ASSESSMENT: 'VIOLENCE_ASSESSMENT',
  ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT: 'CONTRACEPTIVE_ASSESSMENT',
  ScreeningToolsType.TB_ASSESSMENT: 'TB_ASSESSMENT',
  ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT:
      'ALCOHOL_SUBSTANCE_ASSESSMENT',
};
