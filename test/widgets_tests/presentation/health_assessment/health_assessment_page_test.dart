import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/assessment/widgets/successful_assessment_submission_page.dart';
import 'package:myafyahub/presentation/health_assessment/pages/health_assessment_page.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  final MockGraphQlClient graphQlClient = MockGraphQlClient();
  group('health assessment page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );

      expect(find.text(healthAssessmentSubtitle), findsOneWidget);
      expect(find.text(healthAssessmentDescription), findsOneWidget);
    });

    testWidgets('question one buttons functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );

      expect(find.byKey(questionOneNotAtAllDaysKey), findsOneWidget);
      expect(find.byKey(questionOneSeveralDaysKey), findsOneWidget);
      expect(find.byKey(questionOneMoreThanHalfKey), findsOneWidget);
      expect(find.byKey(questionOneNearlyEverydayKey), findsOneWidget);

      await tester.tap(find.byKey(questionOneNotAtAllDaysKey));
      await tester.tap(find.byKey(questionOneSeveralDaysKey));
      await tester.tap(find.byKey(questionOneMoreThanHalfKey));
      await tester.tap(find.byKey(questionOneNearlyEverydayKey));
      // todo(byron): add assertions when implementation is done
    });

    testWidgets('question two buttons functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );

      expect(find.byKey(questionTwoNotAtAllDaysKey), findsOneWidget);
      expect(find.byKey(questionTwoSeveralDaysKey), findsOneWidget);
      expect(find.byKey(questionTwoMoreThanHalfKey), findsOneWidget);
      expect(find.byKey(questionTwoNearlyEverydayKey), findsOneWidget);

      await tester.tap(find.byKey(questionTwoNotAtAllDaysKey));
      await tester.tap(find.byKey(questionTwoSeveralDaysKey));
      await tester.tap(find.byKey(questionTwoMoreThanHalfKey));
      await tester.tap(find.byKey(questionTwoNearlyEverydayKey));
      // todo(byron): add assertions when implementation is done
    });

    testWidgets('question Three buttons functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );

      expect(find.byKey(questionThreeNotAtAllDaysKey), findsOneWidget);
      expect(find.byKey(questionThreeSeveralDaysKey), findsOneWidget);
      expect(find.byKey(questionThreeMoreThanHalfKey), findsOneWidget);
      expect(find.byKey(questionThreeNearlyEverydayKey), findsOneWidget);

      await tester.tap(find.byKey(questionThreeNotAtAllDaysKey));
      await tester.tap(find.byKey(questionThreeSeveralDaysKey));
      await tester.tap(find.byKey(questionThreeMoreThanHalfKey));
      await tester.tap(find.byKey(questionThreeNearlyEverydayKey));
      // todo(byron): add assertions when implementation is done
    });

    testWidgets('question Four buttons functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );

      expect(find.byKey(questionFourNotAtAllDaysKey), findsOneWidget);
      expect(find.byKey(questionFourSeveralDaysKey), findsOneWidget);
      expect(find.byKey(questionFourMoreThanHalfKey), findsOneWidget);
      expect(find.byKey(questionFourNearlyEverydayKey), findsOneWidget);

      await tester.tap(find.byKey(questionFourNotAtAllDaysKey));
      await tester.tap(find.byKey(questionFourSeveralDaysKey));
      await tester.tap(find.byKey(questionFourMoreThanHalfKey));
      await tester.tap(find.byKey(questionFourNearlyEverydayKey));
      // todo(byron): add assertions when implementation is done
    });

    testWidgets('question Five buttons functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );
      await tester.scrollUntilVisible(
        find.byKey(questionFiveNotAtAllDaysKey, skipOffstage: false),
        100,
      );
      await tester.pumpAndSettle();

      expect(find.byKey(questionFiveNotAtAllDaysKey), findsOneWidget);
      expect(find.byKey(questionFiveSeveralDaysKey), findsOneWidget);
      expect(find.byKey(questionFiveMoreThanHalfKey), findsOneWidget);
      expect(find.byKey(questionFiveNearlyEverydayKey), findsOneWidget);

      await tester.tap(find.byKey(questionFiveNotAtAllDaysKey));
      await tester.tap(find.byKey(questionFiveSeveralDaysKey));
      await tester.tap(find.byKey(questionFiveMoreThanHalfKey));
      await tester.tap(find.byKey(questionFiveNearlyEverydayKey));
      // todo(byron): add assertions when implementation is done
    });

    testWidgets('question Six buttons functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );
      await tester.scrollUntilVisible(
        find.byKey(questionSixNotAtAllDaysKey, skipOffstage: false),
        100,
      );
      await tester.pumpAndSettle();

      expect(find.byKey(questionSixNotAtAllDaysKey), findsOneWidget);
      expect(find.byKey(questionSixSeveralDaysKey), findsOneWidget);
      expect(find.byKey(questionSixMoreThanHalfKey), findsOneWidget);
      expect(find.byKey(questionSixNearlyEverydayKey), findsOneWidget);

      await tester.tap(find.byKey(questionSixNotAtAllDaysKey));
      await tester.tap(find.byKey(questionSixSeveralDaysKey));
      await tester.tap(find.byKey(questionSixMoreThanHalfKey));
      await tester.tap(find.byKey(questionSixNearlyEverydayKey));
      // todo(byron): add assertions when implementation is done
    });

    testWidgets('question Seven buttons functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );
      await tester.scrollUntilVisible(
        find.byKey(questionSevenNotAtAllDaysKey, skipOffstage: false),
        100,
      );
      await tester.pumpAndSettle();

      expect(find.byKey(questionSevenNotAtAllDaysKey), findsOneWidget);
      expect(find.byKey(questionSevenSeveralDaysKey), findsOneWidget);
      expect(find.byKey(questionSevenMoreThanHalfKey), findsOneWidget);
      expect(find.byKey(questionSevenNearlyEverydayKey), findsOneWidget);

      await tester.tap(find.byKey(questionSevenNotAtAllDaysKey));
      await tester.tap(find.byKey(questionSevenSeveralDaysKey));
      await tester.tap(find.byKey(questionSevenMoreThanHalfKey));
      await tester.tap(find.byKey(questionSevenNearlyEverydayKey));
      // todo(byron): add assertions when implementation is done
    });

    testWidgets('question Eight buttons functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );
      await tester.scrollUntilVisible(
        find.byKey(questionEightNotAtAllDaysKey, skipOffstage: false),
        100,
      );
      await tester.pumpAndSettle();

      expect(find.byKey(questionEightNotAtAllDaysKey), findsOneWidget);
      expect(find.byKey(questionEightSeveralDaysKey), findsOneWidget);
      expect(find.byKey(questionEightMoreThanHalfKey), findsOneWidget);
      expect(find.byKey(questionEightNearlyEverydayKey), findsOneWidget);

      await tester.tap(find.byKey(questionEightNotAtAllDaysKey));
      await tester.tap(find.byKey(questionEightSeveralDaysKey));
      await tester.tap(find.byKey(questionEightMoreThanHalfKey));
      await tester.tap(find.byKey(questionEightNearlyEverydayKey));
      // todo(byron): add assertions when implementation is done
    });

    testWidgets('question Nine buttons functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );
      await tester.scrollUntilVisible(
        find.byKey(questionNineNotAtAllDaysKey, skipOffstage: false),
        100,
      );
      await tester.pumpAndSettle();

      expect(find.byKey(questionNineNotAtAllDaysKey), findsOneWidget);
      expect(find.byKey(questionNineSeveralDaysKey), findsOneWidget);
      expect(find.byKey(questionNineMoreThanHalfKey), findsOneWidget);
      expect(find.byKey(questionNineNearlyEverydayKey), findsOneWidget);

      await tester.tap(find.byKey(questionNineNotAtAllDaysKey));
      await tester.tap(find.byKey(questionNineSeveralDaysKey));
      await tester.tap(find.byKey(questionNineMoreThanHalfKey));
      await tester.tap(find.byKey(questionNineNearlyEverydayKey));
      // todo(byron): add assertions when implementation is done
    });

    testWidgets('question Ten buttons functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );
      await tester.scrollUntilVisible(
        find.byKey(questionTenNotAtAllDaysKey, skipOffstage: false),
        100,
      );
      await tester.pumpAndSettle();

      expect(find.byKey(questionTenNotAtAllDaysKey), findsOneWidget);
      expect(find.byKey(questionTenSeveralDaysKey), findsOneWidget);
      expect(find.byKey(questionTenMoreThanHalfKey), findsOneWidget);
      expect(find.byKey(questionTenNearlyEverydayKey), findsOneWidget);

      await tester.tap(find.byKey(questionTenNotAtAllDaysKey));
      await tester.tap(find.byKey(questionTenSeveralDaysKey));
      await tester.tap(find.byKey(questionTenMoreThanHalfKey));
      await tester.tap(find.byKey(questionTenNearlyEverydayKey));
      // todo(byron): add assertions when implementation is done
    });

    testWidgets('submit button functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: const HealthAssessmentPage(),
      );
      await tester.scrollUntilVisible(
        find.byKey(submitHealthAssessmentKey, skipOffstage: false),
        100,
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(submitHealthAssessmentKey));

      await tester.pumpAndSettle();
      expect(find.byType(SuccessfulAssessmentSubmissionPage), findsOneWidget);
    });
  });
}
