// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/login/verify_security_questions_state.dart';

void main() {
  test('should convert from/to json', () {
    final VerifySecurityQuestionsState state =
        VerifySecurityQuestionsState.initial();
    final Map<String, dynamic> result = state.toJson();
    expect(result, isA<Map<String, dynamic>>());

    final VerifySecurityQuestionsState result2 =
        VerifySecurityQuestionsState.fromJson(<String, dynamic>{
      'hasVerifiedSecurityQuestions': true,
    });

    expect(result2.hasVerifiedSecurityQuestions, true);
  });
}
