// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/domain/core/entities/feed/gallery_image.dart';
import 'package:myafyahub/domain/core/entities/feed/hero_image.dart';
import 'package:myafyahub/presentation/content/pages/gallery_images_page.dart';
import 'package:myafyahub/presentation/content/widgets/gallery_image_widget.dart';
import 'package:myafyahub/application/redux/actions/update_saved_content_state_action.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/content/widgets/like_content_widget.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_content_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_details.dart';
import 'package:myafyahub/domain/core/entities/feed/content_metadata.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/pages/content_details_page.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';
import 'package:myafyahub/presentation/video_player/chewie_video_player.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ContentDetailPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });

    final MockShortSILGraphQlClient mockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'checkIfUserHasLikedContent': false,
            'checkIfUserBookmarkedContent': false,
            'bookmarkContent': true,
            'likeContent': true,
            'unlikeContent': true,
          }
        }),
        201,
      ),
    );
    testWidgets('renders correctly with the correct content data',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateContentStateAction(
          contentItems: <Content>[mockContent],
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: ContentDetailPage(
          payload: ContentDetails(
            content: mockContent.copyWith(
              metadata: ContentMetadata.initial(),
            ),
          ),
        ),
      );

      await tester.tap(find.byKey(likeButtonKey));
      await tester.pumpAndSettle();

      expect(find.byKey(cancelButtonKey), findsOneWidget);
      expect(find.text('Like'), findsNothing);
    });

    testWidgets('renders correctly with the correct video content data',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateSavedContentStateAction(
          savedContentItems: <Content>[mockContent],
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: ContentDetailPage(
          payload: ContentDetails(
            content: mockVideoContent,
            contentDisplayedType: ContentDisplayedType.BOOKMARK,
          ),
        ),
      );

      final Finder likeButton = find.byKey(likeButtonKey);
      expect(find.byType(ChewieVideoPlayer), findsOneWidget);
      expect(likeButton, findsOneWidget);

      await tester.tap(likeButton);
      expect(find.text('Like'), findsNothing);
    });

    testWidgets(
        'renders an empty data widget if the body of a piece of content '
        'is empty', (WidgetTester tester) async {
      final Content contentWithoutBody = mockContent.copyWith.call(body: null);
      store.dispatch(
        UpdateContentStateAction(contentItems: <Content>[contentWithoutBody]),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: ContentDetailPage(
          payload: ContentDetails(content: contentWithoutBody),
        ),
      );
      expect(find.byType(GenericEmptyData), findsOneWidget);
    });

    testWidgets('Like button is tappable', (WidgetTester tester) async {
      store.dispatch(
        UpdateContentStateAction(contentItems: <Content>[mockContent]),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget:
            ContentDetailPage(payload: ContentDetails(content: mockContent)),
      );
      await tester.pumpAndSettle();

      final Finder likeButton = find.byType(LikeContentWidget);

      expect(likeButton, findsOneWidget);

      await tester.ensureVisible(likeButton);
      await tester.pumpAndSettle();
      await tester.tap(likeButton);
      await tester.pumpAndSettle();

      expect(find.text('Like'), findsNothing);

      await tester.tap(likeButton);
      await tester.pumpAndSettle();
      expect(find.text('Like'), findsNothing);
    });

    testWidgets('Share button is tappable', (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'checkIfUserHasLikedContent': false,
              'checkIfUserBookmarkedContent': true,
              'bookmarkContent': true,
              'likeContent': true,
              'unlikeContent': true,
            }
          }),
          201,
        ),
      );
      store.dispatch(
        UpdateContentStateAction(contentItems: <Content>[mockContent]),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: ContentDetailPage(
          payload: ContentDetails(content: mockContent.copyWith(contentID: 9)),
        ),
      );
      await tester.pumpAndSettle();
      final Finder shareButton = find.byKey(shareButtonKey);

      expect(shareButton, findsOneWidget);

      await tester.tap(shareButton);
      await tester.pumpAndSettle();
      expect(find.text('Share'), findsOneWidget);
    });
    testWidgets('Save button is tappable', (WidgetTester tester) async {
      store.dispatch(
        UpdateContentStateAction(
          contentItems: <Content>[mockContent.copyWith(contentID: 9)],
        ),
      );
      await tester.runAsync(() async {
        TestWidgetsFlutterBinding.ensureInitialized();
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: ContentDetailPage(
            payload: ContentDetails(
              content: mockContent.copyWith(
                metadata: ContentMetadata(createdAt: ''),
              ),
              contentDisplayedType: ContentDisplayedType.FEED,
            ),
          ),
        );
        await tester.pumpAndSettle();
        final Finder saveButton = find.byKey(saveButtonKey);

        expect(saveButton, findsOneWidget);

        await tester.ensureVisible(saveButton);
        await tester.pumpAndSettle();
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(find.text(savedString), findsNothing);

        store.dispatch(
          UpdateContentStateAction(
              contentItems: <Content>[mockContent.copyWith(contentID: 1)],),
        );

        await tester.ensureVisible(saveButton);
        await tester.pumpAndSettle();
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(find.text(saveString), findsNothing);
      });
    });

    testWidgets('show loading indicators while fetching like and save status',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateContentStateAction(contentItems: <Content>[mockContent]),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget:
            ContentDetailPage(payload: ContentDetails(content: mockContent)),
      );
      store.dispatch(WaitAction<AppState>.add(fetchLikeStatusFlag));
      store.dispatch(WaitAction<AppState>.add(fetchBookmarkStatusFlag));
      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsNWidgets(2));
    });

    testWidgets('should show gallery image if present',
        (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
        galleryImages: <GalleryImage>[
          GalleryImage.fromJson(mockGalleryImage),
        ],
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: ContentDetailPage(payload: ContentDetails(content: content)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GalleryImageWidget), findsOneWidget);
    });

    testWidgets('should show two gallery images if present',
        (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
        galleryImages: <GalleryImage>[
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
        ],
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: ContentDetailPage(payload: ContentDetails(content: content)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GalleryImageWidget), findsNWidgets(2));
    });

    testWidgets('should show three gallery images if present',
        (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
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
        widget: ContentDetailPage(payload: ContentDetails(content: content)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GalleryImageWidget), findsNWidgets(3));
    });

    testWidgets(
        'if gallery images are more than 3 should navigate to gallery '
        'images page', (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
        galleryImages: <GalleryImage>[
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
        ],
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: ContentDetailPage(payload: ContentDetails(content: content)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GalleryImageWidget), findsNWidgets(3));

      final Finder galleryImagesKey = find.byKey(galleryImagePageKey);
      expect(galleryImagesKey, findsOneWidget);

      await tester.tap(galleryImagesKey);
      await tester.pumpAndSettle();
      expect(find.byType(GalleryImagesPage), findsOneWidget);
    });

    testWidgets(
        'if gallery images are more than 3 should navigate to gallery '
        'images page', (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
        galleryImages: <GalleryImage>[
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
        ],
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: ContentDetailPage(payload: ContentDetails(content: content)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GalleryImageWidget), findsNWidgets(3));

      final Finder galleryImagesKey = find.byKey(galleryImagePageKey);
      expect(galleryImagesKey, findsOneWidget);

      await tester.tap(galleryImagesKey);
      await tester.pumpAndSettle();
      expect(find.byType(GalleryImagesPage), findsOneWidget);
    });
  });
}
