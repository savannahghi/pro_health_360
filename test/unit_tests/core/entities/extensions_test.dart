// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/extensions.dart';
import '../../../mock_feed_response.dart';

void main() {
  test('should use extenstion to determine feed validity', () {
    final FeedResponsePayload payload =
        FeedResponsePayload.fromJson(mockFeedResponse());
    expect(payload.isValid(), true);
  });
}
