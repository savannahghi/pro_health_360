// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/app_review_obj.dart';

void main() {
  test('should convert from and to json', () {
    final AppReviewObj state = AppReviewObj();

    final AppReviewObj result = AppReviewObj.fromJson(<String, dynamic>{
      'launches': 0,
      'days': 0,
      'lastLaunchDate': '2020-08-23 08:48:24.731',
      'shouldRateApp': true,
    });

    expect(result.launches, equals(0));
    expect(result.days, equals(0));
    expect(result.lastLaunchDate, isNotNull);
    expect(result.shouldRateApp, true);
    final Map<String, dynamic> result2 = state.toJson();
    expect(result2, isA<Map<String, dynamic>>());
    expect(result2['shouldRateApp'], true);
  });
}
