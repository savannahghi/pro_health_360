// Dart imports:
import 'dart:convert';
import 'dart:ui';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/content/pages/content_details_page.dart';
import 'package:myafyahub/presentation/content/pages/feed_page.dart';
import 'package:myafyahub/presentation/content/widgets/content_item.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('FeedPage', () {
    final MockShortSILGraphQlClient mockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'getContent': <String, dynamic>{
              'items': <dynamic>[
                contentMock[0],
                contentMock[0],
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
          widget: const FeedPage(),
        );

        await tester.tap(find.text('All'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Recommended'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Exercise'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Diet'));
        await tester.pumpAndSettle();

        expect(find.byType(ContentItem), findsNWidgets(2));
      });
    });

    testWidgets('navigates to the detail view of a feed item',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const FeedPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ContentItem), findsNWidgets(2));
        expect(find.byKey(feedContentItemKey), findsNWidgets(2));

        await tester.tap(find.byKey(feedContentItemKey).first);
        await tester.pumpAndSettle();

        expect(find.byType(ContentDetailPage), findsOneWidget);

        final Finder cancelButton = find.byKey(cancelButtonKey);
        expect(cancelButton, findsOneWidget);
        await tester.ensureVisible(cancelButton);
        await tester.pumpAndSettle();
        await tester.tap(cancelButton);
        await tester.pumpAndSettle();
        expect(find.byType(ContentItem), findsNWidgets(2));
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
          widget: const FeedPage(),
        );

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

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: const FeedPage(),
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
          widget: const FeedPage(),
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
