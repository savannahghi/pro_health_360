import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question.dart';

part 'security_questions_data.freezed.dart';
part 'security_questions_data.g.dart';

@freezed
class SecurityQuestionsData with _$SecurityQuestionsData {
  factory SecurityQuestionsData({
    @JsonKey(name: 'getSecurityQuestions')
        required List<SecurityQuestion> securityQuestionsData,
  }) = _SecurityQuestionsData;

  factory SecurityQuestionsData.fromJson(Map<String, dynamic> json) =>
      _$SecurityQuestionsDataFromJson(json);
}
