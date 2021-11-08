// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/terms_and_conditions_page.dart';
import 'package:myafyahub/presentation/profile/pages/consent_page.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ConsentPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ConsentPage(),
      );

      expect(find.text(portalTermsText), findsOneWidget);
      expect(find.text(viewTermsText), findsOneWidget);
      expect(find.text(groupsText), findsOneWidget);
      expect(find.text(consentConfirmationText), findsOneWidget);
    });

    testWidgets('terms page navigates correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ConsentPage(),
      );

      final Finder termsTileFinder = find.byKey(termsAndConditionsKey);
      expect(termsTileFinder, findsOneWidget);

      await tester.tap(termsTileFinder);
      await tester.pumpAndSettle();

      expect(find.byType(TermsAndConditionsPage), findsOneWidget);
    });

    testWidgets('tapping switch calls onChanged method',
        (WidgetTester tester) async {
      int counter = 0;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: ConsentPage(
          onChanged: (bool value) {
            counter++;
          },
        ),
      );

      final Finder switchFinder = find.byType(Switch);
      expect(switchFinder, findsOneWidget);

      await tester.tap(switchFinder);
      expect(counter, 1);

      await tester.tap(switchFinder);
      expect(counter, 2);
    });
  });
}
