// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/recent_content_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import '../../../mocks.dart';

void main() {
  test('RecentContentState fromJson', () {
    expect(
      RecentContentState.fromJson(<String, dynamic>{
        'items': <dynamic>[contentMock.first]
      }),
      isA<RecentContentState>(),
    );
  });

  test('RecentContentState initial is set', () {
    final RecentContentState initialRecentContentState =
        RecentContentState.initial();

    expect(
      initialRecentContentState,
      RecentContentState(
        contentItems: <Content>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
      ),
    );
  });
}
