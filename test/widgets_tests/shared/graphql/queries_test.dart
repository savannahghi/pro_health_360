// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';

void main() {
  group('test queries.dart', () {
    test('should verify resumeWithPinQueryVariables returns correct map', () {
      // setup
      final Map<String, dynamic> expectedResumeWithPinQueryVariables =
          <String, dynamic>{'pin': '1234'};

      // call the actual function / method
      final Map<String, dynamic> actualResumeWithPinQueryVariables =
          resumeWithPinQueryVariables('1234');

      // verify functionality
      expect(actualResumeWithPinQueryVariables,
          expectedResumeWithPinQueryVariables);
    });
  });
}
