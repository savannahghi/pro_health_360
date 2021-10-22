// Flutter imports:
import 'dart:io';

import 'package:async_redux/async_redux.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

// Project imports:
import 'package:myafyahub/presentation/core/widgets/new_content.dart';
import 'package:myafyahub/domain/core/entities/feed/feed_details.dart';
import 'package:myafyahub/presentation/feed/feed_item_widget.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('NewContent', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });
    testWidgets('should render feed items', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      final List<FeedDetails> mockListFeed = <FeedDetails>[];

      for (final Map<String, dynamic> element in mockFeed) {
        mockListFeed.add(FeedDetails.fromJson(element));
      }

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: NewContent(
          feedItems: mockListFeed,
        ),
      );

      // feed items renders correctly
      final Finder feedItem = find.byType(FeedItem);
      expect(feedItem, findsWidgets);
      await tester.ensureVisible(feedItem.first);
      await tester.tap(feedItem.first);
      await tester.pumpAndSettle();
      expect(feedItem, findsNothing);
    });
  });
}
