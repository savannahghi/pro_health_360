// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_terms_and_conditions_response.freezed.dart';
part 'accept_terms_and_conditions_response.g.dart';

@freezed
class AcceptTermsAndConditionsResponse with _$AcceptTermsAndConditionsResponse {
  factory AcceptTermsAndConditionsResponse({
    @JsonKey(name: 'acceptTerms') required bool acceptTerms,
  }) = _AcceptTermsAndConditionsResponse;

  factory AcceptTermsAndConditionsResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AcceptTermsAndConditionsResponseFromJson(json);
}
