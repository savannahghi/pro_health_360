import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/assessment/pages/alcohol_substance_use_page.dart';
import 'package:myafyahub/presentation/assessment/pages/contraceptive_assessment_page.dart';
import 'package:myafyahub/presentation/assessment/pages/tuberculosis_assessment_page.dart';
import 'package:myafyahub/presentation/health_assessment/pages/health_assessment_page.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/screening_tools_list_page.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tools_banner.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  final MockGraphQlClient graphQlClient = MockGraphQlClient();
  group('Screening tools', () {
    testWidgets('Violence card navigates to violence page',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const ScreeningToolsListPage(),
      );

      expect(find.text(violenceTitle), findsOneWidget);
      await tester.tap(find.text(violenceTitle));
      await tester.pumpAndSettle();

      expect(find.text(violenceAssessmentTitle), findsOneWidget);
    });
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
        expect(find.byType(ScreeningToolsBanner), findsNWidgets(5));

        expect(find.text(violenceTitle), findsOneWidget);
        expect(find.text(contraceptiveTitle), findsOneWidget);
        expect(find.text(tuberculosisTitle), findsOneWidget);
        expect(find.text(healthTitle), findsOneWidget);
      },
    );

    testWidgets(
      'health assessment card navigates to health assessment page',
      (WidgetTester tester) async {
        final Store<AppState> store =
            Store<AppState>(initialState: AppState.initial());

        await buildTestWidget(
          tester: tester,
          store: store,
          client: graphQlClient,
          widget: const ScreeningToolsListPage(),
        );
        expect(find.text(healthTitle, skipOffstage: false), findsOneWidget);
        await tester.scrollUntilVisible(find.text(healthTitle), 300);
        await tester.tap(find.text(healthTitle, skipOffstage: false));
        await tester.pumpAndSettle();
        expect(find.byType(HealthAssessmentPage), findsOneWidget);
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
        expect(find.byType(ScreeningToolsBanner), findsNWidgets(5));

        expect(find.text(contraceptiveTitle), findsOneWidget);

        await tester.tap(find.text(tuberculosisTitle));
        await tester.pumpAndSettle();
        expect(find.byType(TuberculosisAssessmentPage), findsOneWidget);
      },
    );
  });

  testWidgets(
    'navigates to contraceptive assessment page',
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
      expect(find.byType(ScreeningToolsBanner), findsNWidgets(5));

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
      expect(find.byType(ScreeningToolsBanner), findsNWidgets(5));

      expect(find.text(contraceptiveTitle), findsOneWidget);

      await tester.tap(find.text(tuberculosisTitle));
      await tester.pumpAndSettle();
      expect(find.byType(TuberculosisAssessmentPage), findsOneWidget);
    },
  );

  testWidgets(
    'navigates to alcohol and substance use page',
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
      expect(find.byType(ScreeningToolsBanner), findsNWidgets(5));

      expect(find.text(alcoholSubstanceUseTitle), findsOneWidget);

      await tester.tap(find.text(alcoholSubstanceUseTitle));
      await tester.pumpAndSettle();
      expect(find.byType(AlcoholSubstanceUsePage), findsOneWidget);
    },
  );
}
