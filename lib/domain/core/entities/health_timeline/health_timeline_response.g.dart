// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_timeline_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HealthTimelineResponse _$$_HealthTimelineResponseFromJson(
        Map<String, dynamic> json) =>
    _$_HealthTimelineResponse(
      healthTimelineItems: (json['healthTimelineItems'] as List<dynamic>?)
              ?.map((e) => FhirResource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FhirResource>[],
    );

Map<String, dynamic> _$$_HealthTimelineResponseToJson(
        _$_HealthTimelineResponse instance) =>
    <String, dynamic>{
      'healthTimelineItems': instance.healthTimelineItems,
    };
