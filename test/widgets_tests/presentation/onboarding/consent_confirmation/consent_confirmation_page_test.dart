import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/consent_confirmation/consent_confirmation_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import '../../../../test_helpers.dart';

void main() {
  group('ConsentConfirmation Page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    final Finder continueButtonKeyFinder = find.byKey(continueConsentButtonKey);
    final Finder abortButtonKeyFinder = find.byKey(abortConsentButtonKey);

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ConsentConfirmationPage(),
      );

      await tester.pumpAndSettle();
      expect(find.text(optOutOfMyCareHub), findsOneWidget);
      expect(continueButtonKeyFinder, findsOneWidget);
      expect(abortButtonKeyFinder, findsOneWidget);
    });
    testWidgets('continue button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ConsentConfirmationPage(),
      );

      await tester.pumpAndSettle();
      expect(continueButtonKeyFinder, findsOneWidget);

      await tester.tap(continueButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
    });

    testWidgets('abort button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              child: MyAfyaHubPrimaryButton(
                text: 'tap',
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.consentConfirmationPage);
                },
              ),
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('tap'));

      await tester.pumpAndSettle();
      expect(abortButtonKeyFinder, findsOneWidget);

      await tester.tap(abortButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.text('tap'), findsOneWidget);
    });
  });
}
