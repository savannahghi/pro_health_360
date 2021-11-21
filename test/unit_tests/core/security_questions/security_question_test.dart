// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/security_questions/security_question.dart';

import '../../../mocks.dart';

void main() {
  group('SecurityQuestion', () {
    test('expects to convert SecurityQuestion from json', () {
      final SecurityQuestion mockQuestion =
          SecurityQuestion.fromJson(mockSecurityQuestion);
      expect(mockQuestion, isA<SecurityQuestion>());
    });

    test('SecurityQuestion toJson', () {
      expect(
        SecurityQuestion(
          securityQuestionID: 'id',
          questionStem: 'question_stem',
          description: 'description',
          responseType: 'response_type',
          active: true,
        ).toJson(),
        mockSecurityQuestion,
      );
    });
  });
}
