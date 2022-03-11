// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/health_diary/widgets/random_quote_widget.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('RandomQuoteWidget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
      'should show a random quote from the backend',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortSILGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getHealthDiaryQuote': <String, dynamic>{
                  'quote': 'Health at your fingerprints',
                  'author': 'myAfyaHub'
                },
              }
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const RandomQuoteWidget(),
        );

        await tester.pumpAndSettle();

        expect(find.text('Health at your fingerprints'), findsOneWidget);
        expect(find.text('myAfyaHub'), findsOneWidget);
      },
    );

    testWidgets(
      'should show an error widget when fetching a quote',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortSILGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'some error occurred'}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const RandomQuoteWidget(),
        );

        await tester.pumpAndSettle();

        /// Refresh and expect the same thing
        await tester.tap(find.byKey(helpNoDataWidgetKey));

        await tester.pumpAndSettle();
        expect(find.byType(GenericErrorWidget), findsOneWidget);
      },
    );

    testWidgets(
      'should show a timeout widget when fetching a quote',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortSILGraphQlClient =
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
          client: mockShortSILGraphQlClient,
          widget: const RandomQuoteWidget(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(GenericTimeoutWidget), findsOneWidget);
      },
    );

    testWidgets(
      'should show a loading indicator when fetching a quote',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortSILGraphQlClient =
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
          client: mockShortSILGraphQlClient,
          widget: const RandomQuoteWidget(),
        );

        await tester.pump();
        expect(find.byType(PlatformLoader), findsOneWidget);
      },
    );
  });
}
