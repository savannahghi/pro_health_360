// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_security_question_response.freezed.dart';
part 'record_security_question_response.g.dart';

@freezed
class RecordSecurityQuestionResponse with _$RecordSecurityQuestionResponse {
  factory RecordSecurityQuestionResponse({
    @JsonKey(name: 'securityQuestionID') String? securityQuestionID,
    @JsonKey(name: 'isCorrect') @Default(true) bool? isCorrect,
  }) = _RecordSecurityQuestionResponse;

  factory RecordSecurityQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$RecordSecurityQuestionResponseFromJson(json);

  factory RecordSecurityQuestionResponse.initial() =>
      RecordSecurityQuestionResponse(
        securityQuestionID: UNKNOWN,
        isCorrect: true,
      );
}
