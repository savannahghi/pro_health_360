// Flutter imports:
import 'dart:io';

import 'package:async_redux/async_redux.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

// Project imports:
import 'package:myafyahub/presentation/feed/recent_feed_content.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/presentation/feed/content_item.dart';
import 'package:myafyahub/presentation/feed/content_details_page.dart';
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
      final List<Content> mockListFeed = <Content>[];

      for (final Map<String, dynamic> element in mockFeed) {
        mockListFeed.add(Content.fromJson(element));
      }

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const RecentFeedContent(),
      );

      // feed items renders correctly
      final Finder feedItem = find.byType(ContentItem);

      expect(feedItem, findsWidgets);
      await tester.ensureVisible(feedItem.first);
      await tester.tap(feedItem.first);
      await tester.pumpAndSettle();
      expect(find.byType(ContentDetailPage), findsOneWidget);
    });
    testWidgets('View All should navigate to FeedPage',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const HomePage(),
      );

      final Finder viewAllButton = find.byKey(viewAllButtonKey);

      await tester.ensureVisible(viewAllButton);
      await tester.pumpAndSettle();
      await tester.tap(viewAllButton);
      await tester.pumpAndSettle();
      expect(viewAllButton, findsWidgets);
    });

    testWidgets('navigates to feed page when view all is clicked',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      final List<Content> mockListFeed = <Content>[];

      for (final Map<String, dynamic> element in mockFeed) {
        mockListFeed.add(Content.fromJson(element));
      }

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const RecentFeedContent(),
      );

      // click view all
      await tester.tap(find.text(viewAllText));
      await tester.pumpAndSettle();
      expect(store.state.miscState!.bottomNavObj!.currentBottomNavIndex, 1);
    });
  });
}
