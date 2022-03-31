import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_resource.dart';

part 'health_timeline_response.freezed.dart';
part 'health_timeline_response.g.dart';

@freezed
class HealthTimelineResponse with _$HealthTimelineResponse {
  factory HealthTimelineResponse({
    @JsonKey(name: 'patientTimeline')
    @Default(<FhirResource>[])
        List<FhirResource> patientTimeline,
  }) = _HealthTimelineResponse;

  factory HealthTimelineResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthTimelineResponseFromJson(json);
}
