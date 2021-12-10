// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_response.freezed.dart';
part 'generic_response.g.dart';

@freezed
class GenericResponse with _$GenericResponse {
  factory GenericResponse({
    @JsonKey(name: 'errors') List<Map<String, dynamic>>? errors,
    @JsonKey(name: 'data') Map<String, dynamic>? data,
  }) = _GenericResponse;

  factory GenericResponse.fromJson(Map<String, dynamic> json) =>
      _$GenericResponseFromJson(json);
}
