import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/user_feed.dart';

void main() {
  group('test queries.dart', () {
    const String status = 'ACTIVE';

    test('should verify getFeedQueryVariables returns correct map', () {
      // setup
      final Map<String, dynamic> expectedGetFeedQueryVariables =
          <String, dynamic>{
        'isAnonymous': false,
        'status': status,
        'flavour': Flavour.CONSUMER.name,
        'persistent': 'BOTH',
        'visibility': 'SHOW'
      };

      // call the actual function / method
      final Map<String, dynamic> actualGetFeedQueryVariables =
          getFeedQueryVariables(status: status, isAnonymous: false);

      // verify functionality
      expect(actualGetFeedQueryVariables, expectedGetFeedQueryVariables);
    });

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
