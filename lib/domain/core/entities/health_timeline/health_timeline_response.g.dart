// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_timeline_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HealthTimelineResponse _$$_HealthTimelineResponseFromJson(
        Map<String, dynamic> json) =>
    _$_HealthTimelineResponse(
      patientTimeline: (json['timeline'] as List<dynamic>?)
              ?.map((e) => FhirResource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FhirResource>[],
      count: json['totalCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_HealthTimelineResponseToJson(
        _$_HealthTimelineResponse instance) =>
    <String, dynamic>{
      'timeline': instance.patientTimeline,
      'totalCount': instance.count,
    };
