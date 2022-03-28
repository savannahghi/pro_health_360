
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/assessment/pages/alcohol_substance_use_page.dart';
import 'package:myafyahub/presentation/assessment/pages/contraceptive_assessment_page.dart';
import 'package:myafyahub/presentation/assessment/pages/tuberculosis_assessment_page.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tool_menu_item.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tools_carousel.dart';
import 'package:myafyahub/presentation/violence_assessment/pages/violence_assessment_page.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('ScreeningToolsCarousel', () {
    late Store<AppState> store;
    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
      'should navigate to violence assessment page and back',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: const ScreeningToolsCarousel(),
        );

        expect(find.byType(ScreeningToolMenuItem), findsNWidgets(4));
        expect(find.byKey(violenceKey), findsOneWidget);

        // tap the violence menu item and go back
        await tester.tap(find.byKey(violenceKey));
        await tester.pumpAndSettle();
        expect(find.byType(ViolenceAssessmentPage), findsOneWidget);
        await tester.tap(find.byKey(appBarBackButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(ScreeningToolMenuItem), findsNWidgets(4));
      },
    );

    testWidgets(
      'should navigate to contraceptive assessment page and back',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: const ScreeningToolsCarousel(),
        );

        expect(find.byType(ScreeningToolMenuItem), findsNWidgets(4));
        expect(find.byKey(contraceptiveKey), findsOneWidget);

        // tap the contraceptive menu item and go back
        await tester.scrollUntilVisible(find.byKey(contraceptiveKey), 800);
        await tester.tap(find.byKey(contraceptiveKey));
        await tester.pumpAndSettle();
        expect(find.byType(ContraceptiveAssessmentPage), findsOneWidget);
        await tester.tap(find.byKey(appBarBackButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(ScreeningToolMenuItem), findsNWidgets(4));
      },
    );

    testWidgets(
      'should navigate to tuberculosis assessment page and back',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: const ScreeningToolsCarousel(),
        );

        expect(find.byType(ScreeningToolMenuItem), findsNWidgets(4));
        expect(find.byKey(tuberculosisKey), findsOneWidget);

        // tap the violence menu item and go back
        await tester.scrollUntilVisible(find.byKey(tuberculosisKey), 800);
        await tester.tap(find.byKey(tuberculosisKey));
        await tester.pumpAndSettle();
        expect(find.byType(TuberculosisAssessmentPage), findsOneWidget);
        await tester.tap(find.byKey(appBarBackButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(ScreeningToolMenuItem), findsNWidgets(4));
      },
    );

    testWidgets(
      'should navigate to alcohol assessment page and back',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: const ScreeningToolsCarousel(),
        );

        expect(find.byType(ScreeningToolMenuItem), findsNWidgets(4));
        expect(find.byKey(tuberculosisKey), findsOneWidget);

        // tap the violence menu item and go back
        await tester.scrollUntilVisible(find.byKey(alcoholUseKey), 800);
        await tester.tap(find.byKey(alcoholUseKey));
        await tester.pumpAndSettle();
        expect(find.byType(AlcoholSubstanceUsePage), findsOneWidget);
        await tester.tap(find.byKey(appBarBackButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(ScreeningToolMenuItem), findsNWidgets(4));
      },
    );
  });
}