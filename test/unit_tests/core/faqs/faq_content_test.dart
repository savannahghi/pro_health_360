import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/faqs/faq_content.dart';

import '../../../mocks.dart';

void main() {
  group('FAQContent', () {
    test('expects to convert FAQContent from json', () {
      final FAQContent mockResponse =
          FAQContent.fromJson(mockFAQContentResponse);
      expect(mockResponse, isA<FAQContent>());
    });

    test('FAQContent toJson', () {
      expect(
        FAQContent(
          title: 'title',
          body: 'body',
        ).toJson(),
        mockFAQContentResponse,
      );
    });
  });
}
