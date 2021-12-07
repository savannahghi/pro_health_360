// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
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
            content: mockContent.copyWith(metadata: ContentMetadata.initial()),
          ),
        ),
      );

      expect(find.byKey(cancelButtonKey), findsOneWidget);
    });

    testWidgets('renders correctly with the correct video content data',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateContentStateAction(contentItems: <Content>[mockContent]),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: ContentDetailPage(
          payload: ContentDetails(content: mockVideoContent),
        ),
      );
      expect(find.byType(ChewieVideoPlayer), findsOneWidget);
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

      final Finder likeButton = find.byKey(likeButtonKey);

      expect(likeButton, findsOneWidget);

      await tester.tap(likeButton);
      await tester.pumpAndSettle();
      await tester.ensureVisible(likeButton);
      await tester.pumpAndSettle();
      expect(find.text('likes'), findsNothing);

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
        widget:
            ContentDetailPage(payload: ContentDetails(content: mockContent)),
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
        UpdateContentStateAction(contentItems: <Content>[mockContent]),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: ContentDetailPage(
          payload: ContentDetails(
            content:
                mockContent.copyWith(metadata: ContentMetadata(createdAt: '')),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder saveButton = find.byKey(saveButtonKey);

      expect(saveButton, findsOneWidget);

      await tester.tap(saveButton);
      await tester.pumpAndSettle();
      expect(find.text(saveString), findsOneWidget);
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
  });
}
