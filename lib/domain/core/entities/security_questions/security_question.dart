// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_question.freezed.dart';
part 'security_question.g.dart';

@freezed
class SecurityQuestion with _$SecurityQuestion {
  factory SecurityQuestion({
    @JsonKey(name: 'SecurityQuestionID') String? securityQuestionID,
    @JsonKey(name: 'QuestionStem') String? questionStem,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'ResponseType') String? responseType,
    @JsonKey(name: 'Active') @Default(false) bool? active,
  }) = _SecurityQuestion;

  factory SecurityQuestion.fromJson(Map<String, dynamic> json) =>
      _$SecurityQuestionFromJson(json);

  factory SecurityQuestion.initial() => SecurityQuestion(
        securityQuestionID: UNKNOWN,
        questionStem: UNKNOWN,
        description: UNKNOWN,
        responseType: UNKNOWN,
        active: false,
      );
}
