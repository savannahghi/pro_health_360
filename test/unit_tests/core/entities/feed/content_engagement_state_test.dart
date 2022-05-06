// Package imports:

import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/content_engagement_state.dart';
import '../../../../mocks.dart';

void main() {
  test('ContentEngagementState fromJson', () {
    final ContentEngagementState contentEngagementState =
        ContentEngagementState.fromJson(contentEngagementMock);
    expect(contentEngagementState.contentId, 'some_id');
  });
}
