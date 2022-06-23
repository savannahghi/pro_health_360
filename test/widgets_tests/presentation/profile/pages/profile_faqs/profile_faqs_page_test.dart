// Package imports:
import 'dart:convert';
import 'dart:ui';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:pro_health_360/application/redux/actions/FAQS/update_faqs_content_action.dart';
import 'package:pro_health_360/application/redux/actions/update_content_categories_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/content/pages/content_details_page.dart';
import 'package:pro_health_360/presentation/core/widgets/generic_zero_state_widget.dart';
import 'package:pro_health_360/presentation/profile/faqs/profile_faqs_page.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  final MockShortGraphQlClient mockShortSILGraphQlClient =
      MockShortGraphQlClient.withResponse(
    'idToken',
    'endpoint',
    http.Response(
      json.encode(<String, dynamic>{
        'data': <String, dynamic>{
          'getContent': <String, dynamic>{
            'items': <dynamic>[
              contentMock.first,
            ]
          },
          'listContentCategories': categoriesMock,
        },
      }),
      201,
    ),
  );
  late Store<AppState> store;

  setUp(() async {
    await setupFirebaseAnalyticsMocks();
    await Firebase.initializeApp();
    store = Store<AppState>(initialState: AppState.initial());
    store.dispatch(
      UpdateContentCategoriesAction(
        contentCategories: <ContentCategory>[
          ContentCategory(id: 10002, name: 'consumer-faqs', icon: 'test')
        ],
      ),
    );
  });

  group('ProfileFaqsPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: ProfileFaqsPage(),
        );

        await tester.pumpAndSettle();

        expect(find.text(faqsText), findsOneWidget);
        expect(find.byKey(appBarBackButtonKey), findsOneWidget);
        expect(find.byType(ContentItem), findsOneWidget);

        await tester.tap(find.text('Tips on how to keep yourself healthy'));
        await tester.pumpAndSettle();

        expect(find.byType(ContentDetailPage), findsWidgets);
      });
    });

    testWidgets('Shows loading indicator when fetching FAQs',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(fetchContentCategoriesFlag));
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
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
        widget: ProfileFaqsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
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
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockSILGraphQlClient,
          widget: ProfileFaqsPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ContentItem), findsOneWidget);

        await tester.tap(find.byKey(feedContentItemKey));
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
              'getContent': <String, dynamic>{'items': <dynamic>[]},
            },
          }),
          201,
        ),
      );

      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: ProfileFaqsPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(GenericZeroStateWidget), findsOneWidget);

        await tester.tap(find.byType(MyAfyaHubPrimaryButton));
        expect(find.byType(GenericZeroStateWidget), findsOneWidget);
      });
    });
    testWidgets('should refresh FAQs correctly', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;

      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: ProfileFaqsPage(),
        );
        final Finder contentItem = find.byType(ContentItem);
        await tester.pumpAndSettle();

        expect(contentItem, findsOneWidget);

        await tester.fling(
          contentItem,
          const Offset(0.0, 300.0),
          1000.0,
        );
        await tester.pumpAndSettle();
        expect(contentItem, findsOneWidget);
      });
    });

    testWidgets('shows a GenericErrorWidget while fetching the feed',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
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
          widget: ProfileFaqsPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(GenericErrorWidget), findsNWidgets(1));
        await tester.ensureVisible(find.byKey(helpNoDataWidgetKey));
        await tester.tap(find.byKey(helpNoDataWidgetKey));
        await tester.pumpAndSettle();

        expect(find.byType(GenericErrorWidget), findsOneWidget);
      });
    });

    testWidgets(
        'shows a generic no data widget while fetching the FAQs '
        'and refresh the feed when prompted', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;

      mockNetworkImages(() async {
        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'no data'}),
            201,
          ),
        );

        store.dispatch(UpdateFAQsContentAction(errorFetchingFAQs: true));

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: ProfileFaqsPage(),
        );

        await tester.pump();

        await tester.ensureVisible(find.byKey(helpNoDataWidgetKey));
        await tester.tap(find.byKey(helpNoDataWidgetKey));
        await tester.pumpAndSettle();

        expect(find.byType(GenericErrorWidget), findsOneWidget);
      });
    });

    testWidgets(
        'shows a generic no data widget while fetching the FAQs '
        'and there is id', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      store.dispatch(
        UpdateContentCategoriesAction(
          contentCategories: <ContentCategory>[
            ContentCategory(id: 0, name: 'test', icon: 'test')
          ],
        ),
      );
      mockNetworkImages(() async {
        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'no data'}),
            201,
          ),
        );

        store.dispatch(UpdateFAQsContentAction(errorFetchingFAQs: true));

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: ProfileFaqsPage(),
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
