// Dart imports:
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/feed/pages/feed_page.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/feed/pages/content_details_page.dart';
import 'package:myafyahub/presentation/feed/widgets/content_item.dart';
import 'package:myafyahub/presentation/feed/widgets/recent_feed_content.dart';
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
      const Size size = Size(640, 960);
      await tester.binding.setSurfaceSize(size);
      tester.binding.window.physicalSizeTestValue = size;
      tester.binding.window.devicePixelRatioTestValue = 1;

      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getContent': <String, dynamic>{
                'items': <dynamic>[
                  mockContent,
                  mockContent,
                ]
              }
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const RecentFeedContent(),
      );

      await tester.pumpAndSettle();

      // feed items renders correctly
      final Finder feedItem = find.byType(ContentItem);

      expect(feedItem, findsWidgets);
      await tester.ensureVisible(feedItem.first);
      await tester.tap(feedItem.first);
      await tester.pumpAndSettle();
      expect(find.byType(ContentDetailPage), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('View All should navigate to FeedPage',
        (WidgetTester tester) async {
      const Size size = Size(640, 960);
      await tester.binding.setSurfaceSize(size);
      tester.binding.window.physicalSizeTestValue = size;
      tester.binding.window.devicePixelRatioTestValue = 1;

      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getContent': <String, dynamic>{
                'items': <dynamic>[
                  mockContent,
                  mockContent,
                ]
              },
              'fetchSuggestedGroups': mockSuggestions
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const HomePage(),
      );

      await tester.pumpAndSettle();
      final Finder viewAllButton = find.byKey(viewAllButtonKey);

      await tester.ensureVisible(viewAllButton);
      await tester.pumpAndSettle();
      await tester.tap(viewAllButton);
      await tester.pumpAndSettle();
      expect(find.byType(FeedPage), findsOneWidget);
      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('shows a loading indicator when fetching data',
        (WidgetTester tester) async {
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
          widget: const RecentFeedContent(),
        );

        await tester.pump();

        expect(find.byType(SILPlatformLoader), findsOneWidget);
      });
    });

    testWidgets(
        'shows a generic timeout widget while fetching suggested groups',
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

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: const RecentFeedContent(),
        );

        await tester.pump();

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

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: const RecentFeedContent(),
        );

        await tester.pump();

        expect(find.byType(GenericNoData), findsOneWidget);

        await tester.tap(find.byKey(genericNoDataButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(GenericNoData), findsOneWidget);
      });
    });
  });
}
