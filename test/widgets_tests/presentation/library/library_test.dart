// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/engagement/library/library.dart';
import 'package:myafyahub/presentation/engagement/library/pages/library_page_content.dart';
import '../../../mock_image_httpclient.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('Library', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = BWTestHttpOverrides();
    });

    final MockGraphQlClient GraphQlClient = MockGraphQlClient();

    testWidgets('should render SILPlatformLoader', (WidgetTester tester) async {
      final MockGraphQlClient2 mockGraphQlClient =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'loading': true}
            }),
            201),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            toggleLoadingIndicator(context: context, flag: 'flag');
            return Library();
          },
        ),
      );

      await tester.pump();
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
    testWidgets('should render correctly with timeout error',
        (WidgetTester tester) async {
      final MockGraphQlClient2 mockGraphQlClient =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 401),
      );

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: AppWrapper(
            appName: 'appName',
            graphQLClient: mockGraphQlClient,
            appContexts: testAppContexts,
            child: MaterialApp(
              home: Library(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(GenericTimeoutWidget), findsOneWidget);
    });

    testWidgets('should render correctly with no data error',
        (WidgetTester tester) async {
      final MockGraphQlClient2 mockGraphQlClient =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'error': ''}), 401),
      );

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: AppWrapper(
            appName: 'appName',
            graphQLClient: mockGraphQlClient,
            appContexts: testAppContexts,
            child: MaterialApp(
              home: Library(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(GenericNoData), findsOneWidget);

      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();
      expect(find.byType(GenericNoData), findsOneWidget);

      await tester.tap(find.byKey(genericNoDataButtonKey));
      await tester.pump();

      expect(find.byType(GenericNoData), findsOneWidget);
    });

    testWidgets('Should retry to fetch library after encountering an error',
        (WidgetTester tester) async {
      final MockGraphQlClient2 mockGraphQlClient =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 401),
      );

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: AppWrapper(
            appName: 'appName',
            graphQLClient: mockGraphQlClient,
            appContexts: testAppContexts,
            child: MaterialApp(
              home: Library(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(libraryErrorWidgetKey), findsOneWidget);

      await tester.tap(find.byKey(genericRetryButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(libraryErrorWidgetKey), findsOneWidget);
    });

    testWidgets('Should retry to fetch library after getting an empty list',
        (WidgetTester tester) async {
      final MockGraphQlClient2 mockGraphQlClient =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'getLibraryContent': null}
            }),
            201),
      );

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: AppWrapper(
            appName: 'appName',
            graphQLClient: mockGraphQlClient,
            appContexts: testAppContexts,
            child: MaterialApp(
              home: Library(),
            ),
          ),
        ),
      );
      expect(find.byKey(libraryNullWidgetKey), findsOneWidget);
      await tester.tap(find.byKey(genericNoDataButtonKey));
      await tester.pump();
    });

    testWidgets('should render when libContent is null',
        (WidgetTester tester) async {
      final MockGraphQlClient2 mockGraphQlClient =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'getLibraryContent': null}
            }),
            201),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Library(),
      );

      await tester.pump();
    });

    testWidgets('should render correctly with data',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: GraphQlClient,
        widget: Library(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(LibraryPageContent), findsWidgets);
    });
  });
}
