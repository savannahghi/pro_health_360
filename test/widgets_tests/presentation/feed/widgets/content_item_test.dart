// Dart imports:
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/featured_media.dart';
import 'package:myafyahub/domain/core/entities/feed/gallery_image.dart';
import 'package:myafyahub/domain/core/entities/feed/hero_image.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/content/pages/content_details_page.dart';
import 'package:myafyahub/presentation/content/widgets/audio_content.dart';
import 'package:myafyahub/presentation/content/widgets/content_item.dart';
import 'package:myafyahub/presentation/content/widgets/gallery_image_widget.dart';

import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ContentItem', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });

    testWidgets('shows audio content', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      final Content mockContent = Content.fromJson(contentMock[1]);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: ContentItem(contentDetails: mockContent),
      );

      expect(find.byType(AudioContent), findsOneWidget);
    });

    testWidgets('shows pdf content', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      final Content mockContent = Content.fromJson(documentContentMock);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: ContentItem(contentDetails: mockContent),
      );

      expect(find.text(pdfText), findsOneWidget);
    });

    testWidgets('shows the play icon if a piece of content has a video',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      final Content contentWithVideo = mockVideoContent.copyWith(body: null);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: ContentItem(contentDetails: contentWithVideo),
      );

      expect(find.byKey(feedVideoPlayIconKey), findsOneWidget);
      await tester.tap(find.byKey(feedVideoPlayIconKey));
      expect(find.byType(ContentDetailPage), findsNothing);
    });

    testWidgets('should show hero image if present',
        (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
        galleryImages: <GalleryImage>[GalleryImage.fromJson(mockGalleryImage)],
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: ContentItem(contentDetails: content),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GalleryImageWidget), findsOneWidget);
    });

    testWidgets('should show AudioContent if present',
        (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
        contentType: ContentType.AUDIO_VIDEO,
        featuredMedia: <FeaturedMedia>[
          FeaturedMedia(
            featuredMediaType: FeaturedMediaType.audio,
            mediaUrl: '',
          )
        ],
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: ContentItem(contentDetails: content),
      );

      expect(find.byType(GalleryImageWidget), findsOneWidget);
      expect(find.byType(AudioContent), findsOneWidget);
    });

    testWidgets('should show true badge', (WidgetTester tester) async {
      final Content content = Content(heroImage: HeroImage(url: 'url'));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: ContentItem(
          contentDetails: content,
          isNew: true,
        ),
      );

      expect(find.byType(GalleryImageWidget), findsOneWidget);
      expect(find.text(newText), findsOneWidget);
    });
  });
}
