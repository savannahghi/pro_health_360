// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viral_load_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViralLoadResponse _$$_ViralLoadResponseFromJson(Map<String, dynamic> json) =>
    _$_ViralLoadResponse(
      data: json['searchFHIRObservation'] == null
          ? null
          : ViralLoadEdges.fromJson(
              json['searchFHIRObservation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ViralLoadResponseToJson(
        _$_ViralLoadResponse instance) =>
    <String, dynamic>{
      'searchFHIRObservation': instance.data,
    };
