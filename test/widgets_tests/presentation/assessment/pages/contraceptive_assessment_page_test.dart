// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/assessment/pages/contraceptive_assessment_page.dart';
import 'package:myafyahub/presentation/assessment/widgets/successful_assessment_submission_page.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';

import '../../../../test_helpers.dart';

void main() {
  group('ContraceptiveAssessmentPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ContraceptiveAssessmentPage(),
      );

      expect(find.text(contraceptiveAssessmentDescription), findsOneWidget);
      expect(find.text(areYouPregnantString), findsOneWidget);
      expect(find.text(areYouOnFamilyPlanningString), findsOneWidget);
      expect(find.text(wouldYouLikeToUseFamilyPlanningString), findsOneWidget);

      expect(find.byType(MoodSymptomWidget), findsWidgets);

      expect(find.byKey(thisMonthKey), findsOneWidget);
      await tester.tap(find.byKey(thisMonthKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(lastMonthKey), findsOneWidget);
      await tester.tap(find.byKey(lastMonthKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(notStartedYetKey), findsOneWidget);
      await tester.tap(find.byKey(notStartedYetKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(yesPregnantKey), findsOneWidget);
      await tester.tap(find.byKey(yesPregnantKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noPregnantKey), findsOneWidget);
      await tester.tap(find.byKey(noPregnantKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(yesOnFamilyPlanningKey), findsOneWidget);
      await tester.tap(find.byKey(yesOnFamilyPlanningKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noOnFamilyPlanningKey), findsOneWidget);
      await tester.tap(find.byKey(noOnFamilyPlanningKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(yesToUseFamilyPlanningKey), findsOneWidget);
      await tester.tap(find.byKey(yesToUseFamilyPlanningKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noToUseFamilyPlanningKey), findsOneWidget);
      await tester.tap(find.byKey(noToUseFamilyPlanningKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(
        find.byKey(contraceptiveAssessmentFeedbackButtonKey),
        findsOneWidget,
      );
      await tester.tap(find.byKey(contraceptiveAssessmentFeedbackButtonKey));

      await tester.pumpAndSettle();
      expect(find.byType(SuccessfulAssessmentSubmissionPage), findsWidgets);
    });
  });
}
