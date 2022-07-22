// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/random_quote_widget.dart';
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
                'getHealthDiaryQuote': <dynamic>[
                  <String, dynamic>{
                    'quote': 'Health at your fingerprints',
                    'author': 'myAfyaHub'
                  },
                  <String, dynamic>{
                    'quote': 'Health is good',
                    'author': 'myAfyaHub'
                  },
                  <String, dynamic>{
                    'quote': 'Health at home',
                    'author': 'myAfyaHub'
                  },
                ]
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
        expect(find.text('myAfyaHub'), findsNWidgets(2));
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
        expect(find.byType(SizedBox), findsOneWidget);
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
        expect(find.byType(SizedBox), findsOneWidget);
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
        store.dispatch(WaitAction<AppState>.add(fetchHealthDiaryQuoteFlag));
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const RandomQuoteWidget(),
        );

        store.dispatch(WaitAction<AppState>.add(fetchHealthDiaryQuoteFlag));

        await tester.pump();

        expect(find.byType(PlatformLoader), findsOneWidget);
      },
    );
  });
}
