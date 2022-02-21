import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/assesstment/contraceptive_assessment_page.dart';
import 'package:myafyahub/presentation/assesstment/tuberculosis_assessment_page.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/screening_tools_list_page.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tools_banner.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  final MockGraphQlClient graphQlClient = MockGraphQlClient();

  testWidgets(
    'should show screening tools list page and show snackbars for all '
    'unimplemented banners',
    (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const ScreeningToolsListPage(),
      );

      await tester.scrollUntilVisible(find.text(healthTitle), 300);
      expect(find.byType(ScreeningToolsBanner), findsNWidgets(4));

      expect(find.text(violenceTitle), findsOneWidget);
      expect(find.text(contraceptiveTitle), findsOneWidget);
      expect(find.text(tuberculosisTitle), findsOneWidget);
      expect(find.text(healthTitle), findsOneWidget);

      await tester.tap(find.text(violenceTitle));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);

      // This is sometimes hidden by the snackbar covering the screen
      // so we have to scroll before tapping it
      await tester.scrollUntilVisible(find.text(healthTitle), 300);
      await tester.tap(find.text(healthTitle));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    },
  );

  testWidgets(
    'navigates to contaceptive assessment page',
    (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const ScreeningToolsListPage(),
      );

      await tester.scrollUntilVisible(find.text(healthTitle), 300);
      expect(find.byType(ScreeningToolsBanner), findsNWidgets(4));

      expect(find.text(contraceptiveTitle), findsOneWidget);

      await tester.tap(find.text(contraceptiveTitle));
      await tester.pumpAndSettle();
      expect(find.byType(ContraceptiveAssessmentPage), findsOneWidget);
    },
  );

  testWidgets(
    'navigates to tuberculosis assessment page',
    (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const ScreeningToolsListPage(),
      );

      await tester.scrollUntilVisible(find.text(healthTitle), 300);
      expect(find.byType(ScreeningToolsBanner), findsNWidgets(4));

      expect(find.text(contraceptiveTitle), findsOneWidget);

      await tester.tap(find.text(tuberculosisTitle));
      await tester.pumpAndSettle();
      expect(find.byType(TuberculosisAssessmentPage), findsOneWidget);
    },
  );
}
