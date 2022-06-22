import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/next_refill_response.dart';

import '../../../../../mocks.dart';

void main() {
  group('NextRefillResponse', () {
    test('expects to convert NextRefillResponse from json', () {
      expect(NextRefillResponse.initial(), isA<NextRefillResponse>());
      final NextRefillResponse nextRefillDataMock =
          NextRefillResponse.fromJson(mockNextRefillDataResponse);
      expect(nextRefillDataMock, isA<NextRefillResponse>());
    });
  });
}
