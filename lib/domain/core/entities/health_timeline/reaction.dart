// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/codeable_concept.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_enums.dart';

part 'reaction.freezed.dart';
part 'reaction.g.dart';

/// risk of harmful or undesirable, physiological response which is unique
///  to an individual and associated with exposure to a substance.
@freezed
class Reaction with _$Reaction {
  factory Reaction({
    /// Identification of the specific substance (or pharmaceutical product)
    ///  considered to be responsible for the Adverse Reaction event.
    ///
    ///  Note: the substance for a specific reaction may be different from the
    ///  substance identified as the cause of the risk, but it must be
    ///  consistent with it. For instance, it may be a more specific
    ///  substance (e.g. a brand medication) or a composite product that
    ///  includes the identified substance. It must be clinically safe to only
    ///  process the 'code' and ignore the 'reaction.substance'.
    ///  If a receiving system is unable to confirm that
    ///  AllergyIntolerance.reaction.substance falls within the semantic scope
    ///  of AllergyIntolerance.code, then the receiving system should ignore
    ///  AllergyIntolerance.reaction.substance.
    @JsonKey(name: 'Substance') CodeableConcept? substance,

    /// Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.
    @JsonKey(name: 'Manifestation') List<CodeableConcept?>? manifestation,

    /// Text description about the reaction as a whole, including details of the manifestation if required.
    @JsonKey(name: 'Description') String? description,

    /// Clinical assessment of the severity of the reaction event as a whole,
    ///  potentially considering multiple different manifestations.
    @JsonKey(name: 'Severity', unknownEnumValue: AllergyIntoleranceSeverity.moderate)
        AllergyIntoleranceSeverity? severity,
  }) = _Reaction;

  factory Reaction.fromJson(Map<String, dynamic> json) =>
      _$ReactionFromJson(json);
}
