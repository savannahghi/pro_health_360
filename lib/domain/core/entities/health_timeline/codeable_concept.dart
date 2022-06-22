import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/health_timeline/coding.dart';

part 'codeable_concept.freezed.dart';
part 'codeable_concept.g.dart';

/// A concept that may be defined by a formal reference to a terminology or
///  ontology or may be provided by text
@freezed
class CodeableConcept with _$CodeableConcept {
  factory CodeableConcept({
    /// A reference to a code defined by a terminology system.
    @JsonKey(name: 'coding') List<Coding?>? coding,

    /// A human language representation of the concept as seen/selected/uttered
    ///  by the user who entered the data and/or which represents the intended
    ///  meaning of the user.
    @JsonKey(name: 'text') String? text,
  }) = _CodeableConcept;

  factory CodeableConcept.fromJson(Map<String, dynamic> json) =>
      _$CodeableConceptFromJson(json);
}
