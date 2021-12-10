// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/faqs/faq_content.dart';

import '../../../mocks.dart';

void main() {
  group('FAQContent', () {
    test('expects to convert FAQContent from json', () {
      final FAQContent mockResponse = FAQContent.fromJson(mockFAQContent);
      expect(mockResponse, isA<FAQContent>());
    });
  });
}
