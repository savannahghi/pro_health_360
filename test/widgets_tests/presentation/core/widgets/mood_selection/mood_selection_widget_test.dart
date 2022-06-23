// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/mood_checker.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/mood_selection/mood_feedback_page.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('MyAfyaHubMoodSelection', () {
    final Store<AppState> store = Store<AppState>(
      initialState: AppState.initial(),
    );

    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'canRecordMood': true,
          },
        }),
        201,
      ),
    );

    testWidgets(
        'should navigate to mood feedback page when excited icon is clicked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const MoodChecker(),
      );

      await tester.pumpAndSettle();
      expect(find.text(howAreYouFeelingTodayText(UNKNOWN)), findsOneWidget);

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
        client: mockShortSILGraphQlClient,
        widget: const MoodChecker(),
      );
      await tester.pumpAndSettle();
      expect(find.text(howAreYouFeelingTodayText(UNKNOWN)), findsOneWidget);

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
        client: mockShortSILGraphQlClient,
        widget: const MoodChecker(),
      );

      expect(find.text(howAreYouFeelingTodayText(UNKNOWN)), findsOneWidget);

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
        client: mockShortSILGraphQlClient,
        widget: const MoodChecker(),
      );

      expect(find.text(howAreYouFeelingTodayText(UNKNOWN)), findsOneWidget);

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
        client: mockShortSILGraphQlClient,
        widget: const MoodChecker(),
      );

      expect(find.text(howAreYouFeelingTodayText(UNKNOWN)), findsOneWidget);

      await tester.tap(find.byKey(verySadMoodKey));
      await tester.pump();
      expect(find.byType(MoodFeedbackPage), findsNothing);
    });

    testWidgets('Shows loading indicator when fetching terms',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(canRecordMoodFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const MoodChecker(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
