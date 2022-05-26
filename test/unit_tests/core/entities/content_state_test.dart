// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/content_state.dart';
import 'package:myafyahub/domain/core/entities/core/feed_content_state.dart';
import 'package:myafyahub/domain/core/entities/core/recent_content_state.dart';
import 'package:myafyahub/domain/core/entities/core/saved_content_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content_engagement_state.dart';

void main() {
  test('should convert from/to json', () {
    final ContentState state = ContentState.initial();
    final Map<String, dynamic> result = state.toJson();
    expect(result, isA<Map<String, dynamic>>());

    final ContentState result2 = ContentState.fromJson(<String, dynamic>{
      'savedContentState': <String, dynamic>{
        'items': <Map<String, dynamic>>[
          <String, dynamic>{'ID': 1}
        ]
      }
    });

    expect(result2.feedContentState, isNull);
    expect(result2.savedContentState, isNotNull);
  });

  test('ContentState initial is set', () {
    final ContentState initialContentState = ContentState.initial();

    expect(
      initialContentState,
      ContentState(
        feedContentState: FeedContentState.initial(),
        savedContentState: SavedContentState.initial(),
        recentContentState: RecentContentState.initial(),
        contentEngagementState: ContentEngagementState.initial(),
        categoriesList: ListContentCategory.initial(),
      ),
    );
  });
}
