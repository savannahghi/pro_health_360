// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/faqs_content_state.dart';

import '../../../mocks.dart';

void main() {
  test('should convert from/to json', () {
    final FAQsContentState state = FAQsContentState.initial();
    final Map<String, dynamic> result = state.toJson();
    expect(result, isA<Map<String, dynamic>>());

    final FAQsContentState result2 =
        FAQsContentState.fromJson(<String, dynamic>{
      'profileFAQs': <dynamic>[
        mockFAQContent,
      ]
    });

    expect(result2.errorFetchingFAQs, isNull);
    expect(result2.timeoutFetchingFAQs, isNull);
    expect(result2.profileFAQs, isNotEmpty);
  });
}
