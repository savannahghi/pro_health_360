// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_screening_tools.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AvailableScreeningTools _$$_AvailableScreeningToolsFromJson(
        Map<String, dynamic> json) =>
    _$_AvailableScreeningTools(
      availableScreeningTools:
          (json['availableScreeningTools'] as List<dynamic>?)
              ?.map((e) => ScreeningTool.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_AvailableScreeningToolsToJson(
        _$_AvailableScreeningTools instance) =>
    <String, dynamic>{
      'availableScreeningTools': instance.availableScreeningTools,
    };
