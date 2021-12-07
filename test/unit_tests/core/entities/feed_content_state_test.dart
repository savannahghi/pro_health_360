// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/feed_content_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';
import '../../../mocks.dart';

void main() {
  test('FeedContentState fromJson', () {
    expect(
      FeedContentState.fromJson(<String, dynamic>{
        'items': <dynamic>[contentMock.first]
      }),
      isA<FeedContentState>(),
    );
  });

  test('ContentState initial is set', () {
    final FeedContentState initialAddress = FeedContentState.initial();

    expect(
      initialAddress,
      FeedContentState(
        contentItems: <Content>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
        selectedCategory: ContentCategory.initial(),
      ),
    );
  });
}
