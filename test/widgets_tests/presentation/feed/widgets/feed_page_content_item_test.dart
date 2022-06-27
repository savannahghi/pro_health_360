import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/content/widgets/feed_page_content_item.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  late Store<AppState> store;

  setUp(() async {
    store = Store<AppState>(initialState: AppState.initial());
    await setupFirebaseAnalyticsMocks();
    await Firebase.initializeApp();
  });

  testWidgets('should display audio content if it is present',
      (WidgetTester tester) async {
    final Content content = Content(
      contentType: ContentType.AUDIO_VIDEO,
      featuredMedia: <FeaturedMedia>[
        FeaturedMedia(
          featuredMediaType: FeaturedMediaType.audio,
          mediaUrl: '',
        )
      ],
      galleryImages: <GalleryImage>[
        GalleryImage.fromJson(mockGalleryImage),
        GalleryImage.fromJson(mockGalleryImage),
        GalleryImage.fromJson(mockGalleryImage),
      ],
    );

    await buildTestWidget(
      tester: tester,
      store: store,
      client: MockGraphQlClient(),
      widget: SizedBox(
        height: 200,
        child: FeedPageContentItem(
          content: content,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(AudioContent), findsOneWidget);
  });

  testWidgets('should display video content if it is present',
      (WidgetTester tester) async {
    final Content content = Content(
      contentType: ContentType.AUDIO_VIDEO,
      featuredMedia: <FeaturedMedia>[
        FeaturedMedia(
          featuredMediaType: FeaturedMediaType.video,
          mediaUrl: '',
        )
      ],
      galleryImages: <GalleryImage>[
        GalleryImage.fromJson(mockGalleryImage),
        GalleryImage.fromJson(mockGalleryImage),
        GalleryImage.fromJson(mockGalleryImage),
      ],
    );

    await buildTestWidget(
      tester: tester,
      store: store,
      client: MockGraphQlClient(),
      widget: SizedBox(
        height: 200,
        child: FeedPageContentItem(
          content: content,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(feedVideoPlayIconKey), findsOneWidget);
  });

  testWidgets('should navigate to content details page',
      (WidgetTester tester) async {
    int pushed = 0;

    final TestNavigatorObserver observer = TestNavigatorObserver(
      onPush: (Route<dynamic>? route, Route<dynamic>? previousRoute) =>
          pushed++,
    );

    await buildTestWidget(
      tester: tester,
      store: store,
      client: MockGraphQlClient(),
      widget: SizedBox(
        height: 200,
        child: FeedPageContentItem(
          content: mockVideoContent,
        ),
      ),
      navigatorObservers: <NavigatorObserver>[observer],
    );
    await tester.pumpAndSettle();

    final Finder contentItemFinder = find.byKey(feedContentItemKey);
    expect(contentItemFinder, findsOneWidget);

    await tester.ensureVisible(contentItemFinder);
    await tester.tap(contentItemFinder);

    await tester.pump(const Duration(seconds: 1));
    expect(pushed, 2);
  });
}
