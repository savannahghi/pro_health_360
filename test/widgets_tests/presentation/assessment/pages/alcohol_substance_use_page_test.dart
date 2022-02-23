// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/assessment/pages/alcohol_substance_use_page.dart';
import 'package:myafyahub/presentation/assessment/widgets/successful_assessment_submission_page.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';

import '../../../../test_helpers.dart';

void main() {
  group('AlcoholSubstanceUsePage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const AlcoholSubstanceUsePage(),
      );

      expect(find.text(alcoholSubstanceUseTitle), findsOneWidget);
      expect(find.text(alcoholSubstanceUseDescription), findsOneWidget);
      expect(find.text(alcoholSubstanceUseQuestionOne), findsOneWidget);
      expect(find.text(alcoholSubstanceUseQuestionTwo), findsOneWidget);
      expect(find.text(alcoholSubstanceUseQuestionThree), findsOneWidget);
      expect(find.text(alcoholSubstanceUseQuestionFour), findsOneWidget);
      expect(find.text(alcoholSubstanceUseQuestionFive), findsOneWidget);

      expect(find.byType(MoodSymptomWidget), findsWidgets);

      expect(find.byKey(yesQuestionOneKey), findsOneWidget);
      await tester.tap(find.byKey(yesQuestionOneKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noQuestionOneKey), findsOneWidget);
      await tester.tap(find.byKey(noQuestionOneKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(yesQuestionTwoKey), findsOneWidget);
      await tester.tap(find.byKey(yesQuestionTwoKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noQuestionTwoKey), findsOneWidget);
      await tester.tap(find.byKey(noQuestionTwoKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(yesQuestionThreeKey), findsOneWidget);
      await tester.tap(find.byKey(yesQuestionThreeKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noQuestionThreeKey), findsOneWidget);
      await tester.tap(find.byKey(noQuestionThreeKey));
      // todo: (paul) add assertion when onTap is implemented

      await tester.scrollUntilVisible(
        find.text(alcoholSubstanceUseQuestionFive, skipOffstage: false),
        100,
      );

      expect(find.byKey(yesQuestionFourKey), findsOneWidget);
      await tester.tap(find.byKey(yesQuestionFourKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noQuestionFourKey), findsOneWidget);
      await tester.tap(find.byKey(noQuestionFourKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(yesQuestionFiveKey), findsOneWidget);
      await tester.tap(find.byKey(yesQuestionFiveKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noQuestionFiveKey), findsOneWidget);
      await tester.tap(find.byKey(noQuestionFiveKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(
        find.byKey(alcoholSubstanceFeedbackButtonKey),
        findsOneWidget,
      );
      await tester.tap(find.byKey(alcoholSubstanceFeedbackButtonKey));

      await tester.pumpAndSettle();
      expect(find.byType(SuccessfulAssessmentSubmissionPage), findsWidgets);
    });
  });
}
