import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/health_timeline/fhir_resource.dart';

part 'health_timeline_response.freezed.dart';
part 'health_timeline_response.g.dart';

@freezed
class HealthTimelineResponse with _$HealthTimelineResponse {
  factory HealthTimelineResponse({
    @JsonKey(name: 'timeline')
    @Default(<FhirResource>[])
        List<FhirResource> patientTimeline,
    @JsonKey(name: 'totalCount') @Default(0) int count,
  }) = _HealthTimelineResponse;

  factory HealthTimelineResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthTimelineResponseFromJson(json);
}
