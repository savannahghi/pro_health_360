// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/mood_selection/mood_feedback_page.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_mood_selection.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('MyAfyaHubMoodSelection', () {
    final Store<AppState> store = Store<AppState>(
      initialState: AppState.initial(),
    );

    final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

    testWidgets(
        'should navigate to mood feedback page when excited icon is clicked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const MyAfyaHubMoodSelection(),
      );

      expect(find.text(howAreYouFeelingTodayText('john')), findsOneWidget);

      await tester.tap(find.byKey(excitedMoodKey));
      await tester.pump();
      expect(find.byType(MoodFeedbackPage), findsNothing);
    });

    testWidgets(
        'should navigate to mood feedback page when happy icon is clicked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const MyAfyaHubMoodSelection(),
      );

      expect(find.text(howAreYouFeelingTodayText('john')), findsOneWidget);

      await tester.tap(find.byKey(happyMoodKey));
      await tester.pump();
      expect(find.byType(MoodFeedbackPage), findsNothing);
    });

    testWidgets(
        'should navigate to mood feedback page when meh icon is clicked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const MyAfyaHubMoodSelection(),
      );

      expect(find.text(howAreYouFeelingTodayText('john')), findsOneWidget);

      await tester.tap(find.byKey(mehMoodKey));
      await tester.pump();
      expect(find.byType(MoodFeedbackPage), findsNothing);
    });

    testWidgets(
        'should navigate to mood feedback page when sad icon is clicked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const MyAfyaHubMoodSelection(),
      );

      expect(find.text(howAreYouFeelingTodayText('john')), findsOneWidget);

      await tester.tap(find.byKey(sadMoodKey));
      await tester.pump();
      expect(find.byType(MoodFeedbackPage), findsNothing);
    });

    testWidgets(
        'should navigate to mood feedback page when very sad icon is clicked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const MyAfyaHubMoodSelection(),
      );

      expect(find.text(howAreYouFeelingTodayText('john')), findsOneWidget);

      await tester.tap(find.byKey(verySadMoodKey));
      await tester.pump();
      expect(find.byType(MoodFeedbackPage), findsNothing);
    });
  });
}
