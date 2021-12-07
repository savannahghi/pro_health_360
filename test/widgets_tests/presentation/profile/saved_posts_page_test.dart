// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_content_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_saved_content_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/pages/content_details_page.dart';
import 'package:myafyahub/presentation/content/widgets/content_item.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/profile/saved_posts/saved_posts_page.dart';
import 'package:myafyahub/presentation/profile/saved_posts/widgets/no_saved_content_widget.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('SavedPostsPage', () {
    final MockShortSILGraphQlClient mockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'getUserBookmarkedContent': <String, dynamic>{
              'items': <dynamic>[
                contentMock.first,
                contentMock.first,
              ]
            }
          }
        }),
        201,
      ),
    );
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should fetch feed items and display them correctly',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: SavedPostPage(),
        );
        await tester.pumpAndSettle();

        expect(find.byType(ContentItem), findsNWidgets(1));
      });
    });

    testWidgets('should display zero state widget',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getUserBookmarkedContent': <String, dynamic>{
                'items': <dynamic>[]
              }
            }
          }),
          201,
        ),
      );

      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: SavedPostPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(NoSavedContentWidget), findsOneWidget);
      });
    });

    testWidgets('should refresh feed display items correctly',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: SavedPostPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ContentItem), findsNWidgets(1));

        await tester.fling(
          find.byType(ContentItem).first,
          const Offset(0.0, 300.0),
          1000.0,
        );
        await tester.pumpAndSettle();
        expect(find.byType(ContentItem), findsNWidgets(1));
      });
    });

    testWidgets('navigates to the detail view of a feed item',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        store.dispatch(
          UpdateContentStateAction(
            contentItems: <Content>[
              Content.fromJson(
                contentMock.first,
              ),
            ],
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: SavedPostPage(),
        );

        await tester.pumpAndSettle();

        final Finder contentItem = find.byType(ContentItem);
        expect(contentItem, findsNWidgets(1));

        await tester.tap(contentItem.first);
        await tester.pumpAndSettle();

        expect(find.byType(ContentDetailPage), findsOneWidget);
      });
    });

    testWidgets('shows a loading indicator when fetching data',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        final MockShortSILGraphQlClient client =
            MockShortSILGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'loading': true}
            }),
            201,
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: SavedPostPage(),
        );
        store.dispatch(WaitAction<AppState>.add(fetchSavedContentFlag));
        await tester.pump();

        expect(find.byType(SILPlatformLoader), findsOneWidget);
      });
    });

    testWidgets('shows a generic timeout widget while fetching the feed',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockShortSILGraphQlClient client =
            MockShortSILGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'timeout'}),
            201,
          ),
        );
        store.dispatch(UpdateContentStateAction(timeoutFetchingContent: true));
        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: SavedPostPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(GenericTimeoutWidget), findsOneWidget);
      });
    });

    testWidgets(
        'shows a generic no data widget while fetching the feed '
        'and refresh the feed when prompted', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;

      mockNetworkImages(() async {
        final MockShortSILGraphQlClient client =
            MockShortSILGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'no data'}),
            201,
          ),
        );

        store.dispatch(
          UpdateSavedContentStateAction(errorFetchingContent: true),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: SavedPostPage(),
        );

        await tester.pump();

        expect(find.byType(GenericNoData), findsOneWidget);

        await tester.ensureVisible(find.byKey(genericNoDataButtonKey));
        await tester.tap(find.byKey(genericNoDataButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(GenericNoData), findsOneWidget);
      });
    });
  });
}
