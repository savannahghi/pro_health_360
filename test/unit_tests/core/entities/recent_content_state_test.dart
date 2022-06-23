// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/core/recent_content_state.dart';
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
