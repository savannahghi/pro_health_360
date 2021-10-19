// Dart imports:
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/library/library_content_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/library/widgets/featured_content.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../test_helpers.dart';
import '../../../../test_utils.dart';

void main() {
  group('Featured Content Widget', () {
    late Store<AppState> store;

    const String image =
        'https://images.unsplash.com/photo-1525466760727-1d8be8721154?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ';
    const String readTime = '2 mins';
    const String bodyText = 'Exercise for a healthy life';
    const String contentTags = 'Health Tips';

    final LibraryContentItemData libraryContentItem = LibraryContentItemData(
      image,
      readTime,
      bodyText,
      contentTags,
      libraryContentPublishDate: '1969-07-20 20:18:04Z',
      libraryContentTitle: 'Exercise',
    );

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: FeaturedContent(
          featuredContentImagePath: libraryContentItem.libraryContentImageUrl,
          featuredContentTitle: libraryContentItem.libraryContentTitle,
          featuredContentReadTime: libraryContentItem.libraryContentReadTime,
          featuredContentPublishDate:
              libraryContentItem.libraryContentPublishDate,
          libContent: libListItems,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(libraryFeaturedContentKey), findsOneWidget);
    });

    testWidgets('should navigate to the featured content detail view',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: FeaturedContent(
          featuredContentImagePath: libraryContentItem.libraryContentImageUrl,
          featuredContentTitle: libraryContentItem.libraryContentTitle,
          featuredContentReadTime: libraryContentItem.libraryContentReadTime,
          featuredContentPublishDate:
              libraryContentItem.libraryContentPublishDate,
          libContent: libListItems,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(libraryFeaturedContentKey), findsOneWidget);
      await tester.tap(find.byKey(libraryFeaturedContentKey));
    });
  });
}
