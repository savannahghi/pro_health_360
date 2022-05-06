// Flutter imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/profile/health_timeline/my_health_timeline.dart';

// Project imports:
import 'package:myafyahub/presentation/profile/health_timeline/timeline_indicator.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('MyHealthTimeline', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
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
        store: Store<AppState>(initialState: AppState.initial()),
        client: client,
        widget: MyHealthTimeline(graphQlClient: client),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyHealthTimeline), findsOneWidget);
      expect(find.text('My Health Timeline'), findsNWidgets(2));
      expect(find.byType(TimelineIndicator), findsWidgets);
    });

    testWidgets('works with custom client', (WidgetTester tester) async {
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
        store: Store<AppState>(initialState: AppState.initial()),
        client: client,
        widget: const MyHealthTimeline(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyHealthTimeline), findsOneWidget);
    });
  });
}
