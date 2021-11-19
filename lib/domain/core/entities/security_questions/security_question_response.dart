import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_question_response.freezed.dart';
part 'security_question_response.g.dart';

@freezed
class SecurityQuestionResponse with _$SecurityQuestionResponse {
  factory SecurityQuestionResponse({
    String? id,
    String? timeStamp,
    String? userId,
    String? securityQuestionId,
    String? response,
  }) = _SecurityQuestionResponse;

  factory SecurityQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$SecurityQuestionResponseFromJson(json);

  factory SecurityQuestionResponse.initial() => SecurityQuestionResponse(
        id: UNKNOWN,
        timeStamp: UNKNOWN,
        userId: UNKNOWN,
        securityQuestionId: UNKNOWN,
        response: UNKNOWN,
      );
}
