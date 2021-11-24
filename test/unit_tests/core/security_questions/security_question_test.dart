// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/security_questions/questions/security_question.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

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
          responseType: SecurityQuestionResponseType.UNKNOWN,
          active: true,
        ).toJson(),
        mockSecurityQuestion,
      );
    });
  });
}
