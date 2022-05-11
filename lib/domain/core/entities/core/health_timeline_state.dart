import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_resource.dart';

part 'health_timeline_state.freezed.dart';
part 'health_timeline_state.g.dart';

@freezed
class HealthTimelineState with _$HealthTimelineState {
  factory HealthTimelineState({
    @Default(<String, List<FhirResource>>{})
        Map<String, List<FhirResource>> healthTimelineItems,
    @Default(0) int offset,
    @Default(10) int count,
  }) = _HealthTimelineState;

  factory HealthTimelineState.fromJson(Map<String, dynamic> json) =>
      _$HealthTimelineStateFromJson(json);

  factory HealthTimelineState.initial() => HealthTimelineState(
        healthTimelineItems: <String, List<FhirResource>>{},
        offset: 0,
        count: 10,
      );
}
