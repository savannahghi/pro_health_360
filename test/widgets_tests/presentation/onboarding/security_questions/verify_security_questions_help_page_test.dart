import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/forgot_pin/pages/verify_security_questions_help_page.dart';

import '../../../../test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  group('VerifySecurityQuestionsHelpPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: VerifySecurityQuestionsHelpPage(),
      );
      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
    });
    testWidgets('CCC number input validates correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: VerifySecurityQuestionsHelpPage(),
            );
          },
        ),
      );
      await tester.pumpAndSettle();

      final Finder tryAgainButton = find.byKey(tryAgainButtonKey);
      final Finder askForHelpButton = find.byKey(askForHelpButtonKey);
      final Finder cccInput = find.byKey(cccInputKey);
      expect(tryAgainButton, findsOneWidget);
      expect(askForHelpButton, findsOneWidget);
      expect(cccInput, findsOneWidget);
      
      await tester.tap(askForHelpButton);
      await tester.pumpAndSettle();
      expect(find.text('Your CCC number is required'), findsOneWidget);

      await tester.showKeyboard(cccInput);
      await tester.enterText(cccInput, '0123456789');
      await tester.pumpAndSettle();

      await tester.tap(askForHelpButton);
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
