import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_feed/user_feed.dart';

part 'security_question.freezed.dart';
part 'security_question.g.dart';

@freezed
class SecurityQuestion with _$SecurityQuestion {
  factory SecurityQuestion({
    @JsonKey(name: 'securityQuestionID') required String securityQuestionID,
    @JsonKey(name: 'active') required bool active,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'flavour') required Flavour flavour,
    @JsonKey(name: 'questionStem') required String questionStem,
    @JsonKey(name: 'responseType') required String responseType,
  }) = _SecurityQuestion;

  factory SecurityQuestion.fromJson(Map<String, dynamic> json) =>
      _$SecurityQuestionFromJson(json);
}
