// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

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
