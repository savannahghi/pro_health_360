// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/health_diary/widgets/successful_diary_entry_page.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('SuccessfulDiaryEntryPage', () {
    testWidgets('should display successfully', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      int popped = 0;

      final TestNavigatorObserver observer = TestNavigatorObserver(
        onPop: (Route<dynamic>? route, Route<dynamic>? previousRoute) =>
            popped++,
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const SuccessfulDiaryEntryPage(),
        navigatorObservers: <NavigatorObserver>[observer],
      );
      await tester.pump();

      expect(find.byType(SuccessfulDiaryEntryPage), findsOneWidget);

      final Finder button = find.byType(MyAfyaHubPrimaryButton);
      expect(button, findsOneWidget);

      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(popped, 1);
    });
  });
}
