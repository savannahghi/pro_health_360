// Dart imports:
import 'dart:convert';
import 'dart:ui';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:pro_health_360/application/redux/actions/update_connectivity_action.dart';
import 'package:pro_health_360/application/redux/actions/update_content_categories_action.dart';

// Project imports:
import 'package:pro_health_360/application/redux/actions/update_content_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/content/pages/content_details_page.dart';
import 'package:pro_health_360/presentation/content/pages/feed_page.dart';
import 'package:pro_health_360/presentation/content/pages/gallery_images_page.dart';
import 'package:pro_health_360/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:pro_health_360/presentation/core/widgets/generic_zero_state_widget.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('FeedPage', () {
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'listContentCategories': categoriesMock,
            'getContent': <String, dynamic>{
              'items': <dynamic>[
                contentMock.first,
                contentMock.first,
                documentContentMock
              ]
            }
          }
        }),
        201,
      ),
    );

    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateContentCategoriesAction(
          contentCategories: ListContentCategory.fromJson(<String, dynamic>{
            'listContentCategories': categoriesMock,
          }).contentCategories,
        ),
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('should fetch feed items and display them correctly',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const FeedPage(),
        );

        await tester.pumpAndSettle(const Duration(seconds: 10));

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

    testWidgets('should display zero state widget',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listContentCategories': categoriesMock,
              'getContent': <String, dynamic>{'items': <dynamic>[]}
            }
          }),
          201,
        ),
      );

      mockNetworkImages(() async {
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const FeedPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(GenericZeroStateWidget), findsOneWidget);

        await tester.tap(find.byType(MyAfyaHubPrimaryButton));
        expect(find.byType(GenericZeroStateWidget), findsOneWidget);
      });

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should refresh feed display items correctly',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const FeedPage(),
        );
        await tester.pumpAndSettle();

        expect(find.byType(ContentItem), findsNWidgets(2));

        await tester.fling(
          find.byType(ContentItem).first,
          const Offset(0.0, 300.0),
          1000.0,
        );
        await tester.pumpAndSettle();
        expect(find.byType(ContentItem), findsNWidgets(2));
      });
    });

    testWidgets('navigates to the detail view of a feed item',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

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
    testWidgets('navigates to the detail view of a feed item and document page',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listContentCategories': categoriesMock,
              'getContent': <String, dynamic>{
                'items': <dynamic>[documentContentMock]
              }
            }
          }),
          201,
        ),
      );
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockSILGraphQlClient,
          widget: const FeedPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ContentItem), findsOneWidget);

        await tester.tap(find.byKey(feedContentItemKey));
      });
    });
    testWidgets('if gallery images are more than 3 should navigate to gallery ',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listContentCategories': categoriesMock,
              'getContent': <String, dynamic>{
                'items': <dynamic>[contentMock.last]
              }
            }
          }),
          201,
        ),
      );
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockSILGraphQlClient,
          widget: const FeedPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ContentItem), findsOneWidget);

        await tester.tap(find.byKey(feedContentItemKey));
        await tester.pumpAndSettle();

        expect(find.byType(ContentDetailPage), findsOneWidget);

        await tester.tap(find.byKey(const Key('gallery_image_page_key')));
        await tester.pumpAndSettle();
        expect(find.byType(GalleryImagesPage), findsOneWidget);
      });
    });

    testWidgets('shows a loading indicator when fetching data',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
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
        store.dispatch(WaitAction<AppState>.add(fetchContentCategoriesFlag));
        await tester.pump();

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
    });
    testWidgets('shows a loading indicator when fetching content',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
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
        store.dispatch(WaitAction<AppState>.add(fetchContentFlag));
        await tester.pump();

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
    });

    testWidgets('shows a generic timeout widget while fetching the feed',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
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
          widget: const FeedPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(GenericTimeoutWidget), findsOneWidget);
      });
    });
    testWidgets('shows a generic timeout widget while fetching categories',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'timeout'}),
            201,
          ),
        );
        store.dispatch(
          UpdateContentCategoriesAction(timeoutFetchingContentCategories: true),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: const FeedPage(),
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
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'no data'}),
            201,
          ),
        );

        store.dispatch(UpdateContentStateAction(errorFetchingContent: true));

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: const FeedPage(),
        );

        await tester.pump();

        await tester.ensureVisible(find.byKey(helpNoDataWidgetKey));
        await tester.tap(find.byKey(helpNoDataWidgetKey));
        await tester.pumpAndSettle();

        expect(find.byType(GenericErrorWidget), findsOneWidget);
      });
    });
  });
}
