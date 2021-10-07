// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/help_center/help_center_question_card.dart';
import 'package:myafyahub/presentation/help_center/pages/faq_detail_view_page.dart';
import '../../../test_helpers.dart';

void main() {
  group('HelpCenterQuestionCard', () {
    Store<AppState> store;
    final AppState state = AppState.initial();
    store = Store<AppState>(initialState: state);
    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const HelpCenterQuestionCard(
            question: 'This is a Question',
            answer: 'This is the Answer',
          ));

      await tester.pumpAndSettle();
      final Finder containerWidget = find.byKey(helpCenterContainerKey);
      expect(containerWidget, findsOneWidget);

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets(
        'Should navigate to detail view when a FAQ is pressed, and back',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const HelpCenterQuestionCard(
            question: 'This is a Question',
            answer: 'This is the Answer',
          ));

      await tester.pumpAndSettle();
      final Finder containerWidget = find.byKey(helpCenterContainerKey);
      expect(containerWidget, findsOneWidget);

      expect(find.byType(GestureDetector), findsOneWidget);

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(FAQDetailViewPage), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(containerWidget, findsOneWidget);
    });
  });
}
