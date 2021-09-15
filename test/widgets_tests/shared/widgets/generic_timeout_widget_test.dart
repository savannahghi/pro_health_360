import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';

import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../test_helpers.dart';

void main() {
  group('GenericTimeoutWidget test', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('GenericTimeoutWidget should render correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const GenericTimeoutWidget(
            action: 'fetching library',
          ));

      await tester.pumpAndSettle();

      final Finder listViewWidget = find.byKey(genericListViewKey);
      expect(listViewWidget, findsOneWidget);

      final Finder retryButton = find.byKey(genericRetryButtonKey);
      expect(retryButton, findsOneWidget);

      await tester.tap(retryButton);
      await tester.pumpAndSettle();
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets(
        'GenericTimeoutWidget should render correctly with recoverCallback',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: GenericTimeoutWidget(
            key: const Key('test-generic-timeout-widget-key'),
            action: 'fetching library',
            recoverCallback: () {},
          ));

      await tester.pumpAndSettle();

      final Finder listViewWidget = find.byKey(genericListViewKey);
      expect(listViewWidget, findsOneWidget);

      final Finder retryButton = find.byKey(genericRetryButtonKey);
      expect(retryButton, findsOneWidget);

      await tester.tap(retryButton);
      await tester.pumpAndSettle();
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('Retry button should navigate when pressed',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return const GenericTimeoutWidget(
            action: 'fetching library',
            route: BWRoutes.phoneLogin,
          );
        }),
      );

      await tester.pumpAndSettle();

      final Finder retryButton = find.byKey(genericRetryButtonKey);
      expect(retryButton, findsOneWidget);

      await tester.tap(retryButton);
      await tester.pumpAndSettle();
      expect(retryButton, findsNothing);
    });
  });
}
