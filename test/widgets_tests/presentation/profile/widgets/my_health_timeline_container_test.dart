import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/actions/health_timeline/update_health_timeline_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/profile/health_timeline/my_health_timeline_container.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('MyHealthTimelineContainer', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('back button works', (WidgetTester tester) async {
      store.dispatch(UpdateHealthTimelineAction(offset: 10, count: 30));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const MyHealthTimelineContainer(),
      );

      final Finder backArrow = find.byIcon(Icons.arrow_back_ios);

      expect(backArrow, findsOneWidget);
      await tester.tap(backArrow);
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('-'), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('forward button works', (WidgetTester tester) async {
      store.dispatch(UpdateHealthTimelineAction(offset: 10, count: 30));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const MyHealthTimelineContainer(),
      );

      final Finder forwardArrow = find.byIcon(Icons.arrow_forward_ios);

      expect(forwardArrow, findsOneWidget);
      await tester.tap(forwardArrow);
      await tester.pumpAndSettle();

      expect(find.text('21'), findsOneWidget);
      expect(find.text('-'), findsOneWidget);
      expect(find.text('30'), findsOneWidget);
    });

    testWidgets('should work with provided client',
        (WidgetTester tester) async {
      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'data': mockHealthTimelineItems}),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: MyHealthTimelineContainer(
          graphQlClient: client,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyHealthTimelineContainer), findsOneWidget);
    });
  });
}
