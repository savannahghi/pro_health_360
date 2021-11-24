// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_question_response.freezed.dart';
part 'security_question_response.g.dart';

@freezed
class SecurityQuestionResponse with _$SecurityQuestionResponse {
  factory SecurityQuestionResponse({
    @JsonKey(name: 'userID') String? userID,
    @JsonKey(name: 'securityQuestionID') String? securityQuestionID,
    @JsonKey(name: 'response') String? response,
  }) = _SecurityQuestionResponse;

  factory SecurityQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$SecurityQuestionResponseFromJson(json);

  factory SecurityQuestionResponse.initial() => SecurityQuestionResponse(
        userID: UNKNOWN,
        securityQuestionID: UNKNOWN,
        response: UNKNOWN,
      );
}
