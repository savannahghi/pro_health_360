// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/assessment/tuberculosis_assessment_page.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';

import '../../../test_helpers.dart';

void main() {
  group('TuberculosisAssessmentPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const TuberculosisAssessmentPage(),
      );

      expect(find.text(tuberculosisAssessmentDescription), findsOneWidget);
      expect(find.text(experiencedACoughString), findsOneWidget);
      expect(find.text(doYouHaveFeverString), findsOneWidget);
      expect(find.text(noticedAnyWeighLossString), findsOneWidget);
      expect(find.text(experienceNightSweatsString), findsOneWidget);

      expect(find.byType(MoodSymptomWidget), findsWidgets);

      expect(find.byKey(yesExperienceCoughKey), findsOneWidget);
      await tester.tap(find.byKey(yesExperienceCoughKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noExperienceCoughKey), findsOneWidget);
      await tester.tap(find.byKey(noExperienceCoughKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(yesHaveAFeverCoughKey), findsOneWidget);
      await tester.tap(find.byKey(yesHaveAFeverCoughKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noHaveAFeverCoughKey), findsOneWidget);
      await tester.tap(find.byKey(noHaveAFeverCoughKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(yesWeightLossKey), findsOneWidget);
      await tester.tap(find.byKey(yesWeightLossKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noWeightLossKey), findsOneWidget);
      await tester.tap(find.byKey(noWeightLossKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(yesNightSweatsKey), findsOneWidget);
      await tester.tap(find.byKey(yesNightSweatsKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(find.byKey(noNightSweatsKey), findsOneWidget);
      await tester.tap(find.byKey(noNightSweatsKey));
      // todo: (paul) add assertion when onTap is implemented

      expect(
        find.byKey(tuberculosisAssessmentFeedbackButtonKey),
        findsOneWidget,
      );
      await tester.tap(find.byKey(tuberculosisAssessmentFeedbackButtonKey));
      // todo: (paul) add assertion when onTap is implemented
    });
  });
}
