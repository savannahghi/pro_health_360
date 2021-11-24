import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/security_questions/questions/security_questions_data.dart';

import '../../../mocks.dart';

void main() {
  group('SecurityQuestionsData', () {
    test('expects to convert SecurityQuestionsData from json', () {
      final SecurityQuestionsData securityQuestionsData =
          SecurityQuestionsData.fromJson(mockSecurityQuestionsData);
      expect(securityQuestionsData, isA<SecurityQuestionsData>());
    });
  });
}
