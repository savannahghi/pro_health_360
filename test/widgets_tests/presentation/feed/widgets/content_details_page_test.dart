// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/update_content_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/pages/content_details_page.dart';
import 'package:myafyahub/presentation/content/widgets/like_content_widget.dart';

import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ContentDetailPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
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

    testWidgets('should like a content item', (WidgetTester tester) async {
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

    testWidgets('should share a content item', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
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

    testWidgets('should save a content item', (WidgetTester tester) async {
      store.dispatch(
        UpdateContentStateAction(
          contentItems: <Content>[mockContent.copyWith(contentID: 9)],
        ),
      );
      await tester.runAsync(() async {
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
            contentItems: <Content>[mockContent.copyWith(contentID: 1)],
          ),
        );

        await tester.ensureVisible(saveButton);
        await tester.pumpAndSettle();
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(find.text(saveString), findsNothing);
      });
    });

    testWidgets('should copy content link to the clipboard',
        (WidgetTester tester) async {
      final List<MethodCall> methodCallLog = <MethodCall>[];
      SystemChannels.platform
          .setMockMethodCallHandler((MethodCall methodCall) async {
        methodCallLog.add(methodCall);
      });

      store.dispatch(
        UpdateContentStateAction(
          contentItems: <Content>[
            mockContent.copyWith(
              contentID: 9,
              metadata: ContentMetadata.initial()
                  .copyWith
                  .call(publicLink: 'some-link.com'),
            )
          ],
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: ContentDetailPage(
          payload: ContentDetails(
            content: mockContent.copyWith(
              metadata: ContentMetadata.initial().copyWith.call(
                    publicLink: 'some-link.com',
                    createdAt: '',
                  ),
            ),
            contentDisplayedType: ContentDisplayedType.FEED,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder copyButton = find.byKey(copyButtonKey);

      expect(copyButton, findsOneWidget);

      await tester.ensureVisible(copyButton);
      await tester.pumpAndSettle();
      await tester.tap(copyButton);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(linkCopiedString), findsOneWidget);
      expect(methodCallLog.isEmpty, false);
      expect(methodCallLog.length, 2);
      expect(
        methodCallLog.last,
        isMethodCall(
          'Clipboard.setData',
          arguments: <String, dynamic>{
            'text': 'some-link.com',
          },
        ),
      );
    });

    testWidgets(
        'should show loading indicators while fetching like and save status',
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

      expect(find.byType(PlatformLoader), findsNWidgets(2));
    });
  });
}
