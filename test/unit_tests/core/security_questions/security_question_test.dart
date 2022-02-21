// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
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
