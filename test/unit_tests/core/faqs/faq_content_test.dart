// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import '../../../mocks.dart';

void main() {
  group('FAQContent', () {
    test('expects to convert FAQContent from json', () {
      final FAQContent mockResponse = FAQContent.fromJson(mockFAQContent);
      expect(mockResponse, isA<FAQContent>());
    });
  });
}
