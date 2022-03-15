// Package imports:

import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_security_questions_state.freezed.dart';
part 'verify_security_questions_state.g.dart';

@freezed
class VerifySecurityQuestionsState with _$VerifySecurityQuestionsState {
  factory VerifySecurityQuestionsState({
    @Default(false) bool hasVerifiedSecurityQuestions,
  }) = _VerifySecurityQuestionsState;

  factory VerifySecurityQuestionsState.fromJson(Map<String, dynamic> json) =>
      _$VerifySecurityQuestionsStateFromJson(json);

  factory VerifySecurityQuestionsState.initial() =>
      VerifySecurityQuestionsState(
        hasVerifiedSecurityQuestions: false,
      );
}
