// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:myafyahub/presentation/onboarding/terms_and_conditions_page.dart';
import '../../../test_helpers.dart';

void main() {
  group('TermsAndConditionsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const TermsAndConditionsPage(),
      );

      expect(find.text(portalTermsText), findsOneWidget);
      expect(find.text(readAndAcceptText), findsOneWidget);
      expect(find.text(acceptTermsText), findsOneWidget);
    });

    testWidgets('Checks whether terms have been selected',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const TermsAndConditionsPage(),
      );
      final Finder proceedButton = find.byType(MyAfyaHubPrimaryButton);
      await tester.tap(proceedButton);
      await tester.pumpAndSettle();

      expect(find.text(acceptTermsErrorMessage), findsOneWidget);
    });

    testWidgets('Navigates to set security questions page if checked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const TermsAndConditionsPage(),
      );
      final Finder checkBox = find.byType(Checkbox);
      final Finder proceedButton = find.byType(MyAfyaHubPrimaryButton);
      await tester.tap(checkBox);
      await tester.pumpAndSettle();
      await tester.tap(proceedButton);
      await tester.pumpAndSettle();

      expect(find.byType(SecurityQuestionsPage), findsOneWidget);
    });
  });
}
