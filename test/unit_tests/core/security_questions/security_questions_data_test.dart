// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
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
