// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_timeline_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HealthTimelineState _$$_HealthTimelineStateFromJson(
        Map<String, dynamic> json) =>
    _$_HealthTimelineState(
      healthTimelineItems:
          (json['healthTimelineItems'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(
                    k,
                    (e as List<dynamic>)
                        .map((e) =>
                            FhirResource.fromJson(e as Map<String, dynamic>))
                        .toList()),
              ) ??
              const <String, List<FhirResource>>{},
      offset: json['offset'] as int? ?? 0,
    );

Map<String, dynamic> _$$_HealthTimelineStateToJson(
        _$_HealthTimelineState instance) =>
    <String, dynamic>{
      'healthTimelineItems': instance.healthTimelineItems,
      'offset': instance.offset,
    };
