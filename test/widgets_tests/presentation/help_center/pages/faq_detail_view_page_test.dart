// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/help_center/pages/faq_detail_view_page.dart';
import 'package:myafyahub/presentation/help_center/widgets/html_wrapper.dart';
import '../../../../test_helpers.dart';

void main() {
  group('FAQDetailViewPage', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    testWidgets(
        'should render correctly when a question and an answer '
        'are passed into the component', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const FAQDetailViewPage(
          question: 'This is a Question',
          answer: 'This is the Answer',
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(HtmlWrapper), findsOneWidget);
      expect(find.text('This is a Question'), findsOneWidget);
    });
  });
}
