import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

      expect(find.text('11'), findsOneWidget);
      expect(find.text('-'), findsOneWidget);
      expect(find.text('20'), findsOneWidget);
    });
  });
}
