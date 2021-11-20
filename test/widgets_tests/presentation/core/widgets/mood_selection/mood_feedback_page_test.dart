// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/engagement/home/mood_selection/mood_feedback_page.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('MoodFeedbackPage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return const MoodFeedbackPage(
              moodType: MoodType.Excited,
            );
          },
        ),
      );

      expect(find.byType(MoodFeedbackPage), findsWidgets);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('should pop when cancel button is clicked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return const MoodFeedbackPage(
              moodType: MoodType.Happy,
            );
          },
        ),
      );

      final Finder cancelButton = find.byKey(moodFeedbackGestureDetectorKey);

      await tester.ensureVisible(cancelButton);
      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsNothing);
    });

    testWidgets('should pop when save entry button is clicked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return const MoodFeedbackPage(moodType: MoodType.Excited);
          },
        ),
      );

      final Finder moodFeedbackButton = find.byKey(moodFeedbackButtonKey);

      await tester.ensureVisible(moodFeedbackButton);
      await tester.tap(moodFeedbackButton);
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsNothing);
    });

    testWidgets('renders correctly if patient isn\'t in a good mood',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return const MoodFeedbackPage(
              moodType: MoodType.Sad,
            );
          },
        ),
      );

      final Finder moodFeedbackButton = find.byKey(moodFeedbackButtonKey);

      await tester.ensureVisible(moodFeedbackButton);
      await tester.tap(moodFeedbackButton);
      await tester.pumpAndSettle();
      expect(find.byType(TextField), findsOneWidget);

      final Finder filterChip = find.text(iHaveNightSweatsString);
      await tester.tap(filterChip);
      await tester.pumpAndSettle();

      await tester.tap(moodFeedbackButton);
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsNothing);
    });
  });
}
