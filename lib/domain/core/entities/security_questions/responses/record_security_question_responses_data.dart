// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/security_questions/responses/record_security_question_response.dart';

part 'record_security_question_responses_data.freezed.dart';
part 'record_security_question_responses_data.g.dart';

@freezed
class RecordSecurityQuestionResponsesData
    with _$RecordSecurityQuestionResponsesData {
  factory RecordSecurityQuestionResponsesData({
    @JsonKey(name: 'recordSecurityQuestionResponses')
        required List<RecordSecurityQuestionResponse>
            recordSecurityQuestionResponses,
  }) = _RecordSecurityQuestionResponsesData;

  factory RecordSecurityQuestionResponsesData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RecordSecurityQuestionResponsesDataFromJson(json);
}
