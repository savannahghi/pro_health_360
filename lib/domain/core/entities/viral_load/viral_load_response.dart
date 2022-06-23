// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/viral_load/viral_load_edges.dart';

part 'viral_load_response.freezed.dart';
part 'viral_load_response.g.dart';

@freezed
class ViralLoadResponse with _$ViralLoadResponse {
  factory ViralLoadResponse({
    @JsonKey(name: 'searchFHIRObservation') ViralLoadEdges? data,
  }) = _ViralLoadResponse;

  factory ViralLoadResponse.fromJson(Map<String, dynamic> json) =>
      _$ViralLoadResponseFromJson(json);

  factory ViralLoadResponse.initial() => ViralLoadResponse(
        data: ViralLoadEdges.initial(),
      );
}
