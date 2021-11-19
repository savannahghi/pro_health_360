import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_question.freezed.dart';
part 'security_question.g.dart';

@freezed
class SecurityQuestion with _$SecurityQuestion {
  factory SecurityQuestion({
    String? id,
    String? questionStem,
    String? description,
    String? responseType,
    String? flavour,
    @Default(false) bool? active,
    int? sequence,
  }) = _SecurityQuestion;

  factory SecurityQuestion.fromJson(Map<String, dynamic> json) =>
      _$SecurityQuestionFromJson(json);

  factory SecurityQuestion.initial() => SecurityQuestion(
        id: UNKNOWN,
        questionStem: UNKNOWN,
        description: UNKNOWN,
        responseType: UNKNOWN,
        flavour: UNKNOWN,
        active: false,
        sequence: 0,
      );
}
