import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';

part 'terms_and_conditions_response.freezed.dart';
part 'terms_and_conditions_response.g.dart';

@freezed
class TermsAndConditionsResponse with _$TermsAndConditionsResponse {
  factory TermsAndConditionsResponse({
    @JsonKey(name: 'getCurrentTerms')
        required TermsAndConditions termsAndConditions,
  }) = _TermsAndConditionsResponse;

  factory TermsAndConditionsResponse.fromJson(Map<String, dynamic> json) =>
      _$TermsAndConditionsResponseFromJson(json);
}
