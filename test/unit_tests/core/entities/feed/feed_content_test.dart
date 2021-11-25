// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/feed_content.dart';

import '../../../../mocks.dart';

void main() {
  test('FeedContent fromJson', () {
    expect(
      FeedContent.fromJson(mockFeedContent),
      isA<FeedContent>(),
    );
  });
}
