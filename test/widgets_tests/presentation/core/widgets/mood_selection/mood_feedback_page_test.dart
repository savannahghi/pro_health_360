// Flutter imports:
// Package imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_feedback_page.dart';
import 'package:myafyahub/presentation/home/pages/home_page.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('MoodFeedbackPage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    final MockShortSILGraphQlClient mockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'createHealthDiaryEntry': true,
          },
        }),
        201,
      ),
    );
    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return const MoodFeedbackPage(moodType: MoodType.VERY_HAPPY);
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
              moodType: MoodType.HAPPY,
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
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return const MoodFeedbackPage(moodType: MoodType.SAD);
          },
        ),
      );

      final Finder textFormField = find.byKey(moodFeedbackTextFieldKey);
      expect(textFormField, findsOneWidget);
      await tester.showKeyboard(textFormField);
      await tester.enterText(textFormField, 'text');
      await tester.pumpAndSettle();

      final Finder moodFeedbackButton = find.byKey(moodFeedbackButtonKey);

      await tester.ensureVisible(moodFeedbackButton);
      await tester.tap(moodFeedbackButton);
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsNothing);
    });
  });
}
