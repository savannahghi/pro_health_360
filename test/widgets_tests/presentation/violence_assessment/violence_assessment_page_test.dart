import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/assessment/widgets/successful_assessment_submission_page.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:pro_health_360/presentation/violence_assessment/pages/violence_assessment_page.dart';
import 'package:pro_health_360/presentation/violence_assessment/widgets/screening_tools_question_widget.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('violence assessment page', () {
    late Store<AppState> store;

    setUp(() async {
      await setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const ViolenceAssessmentPage(),
      );
      await tester.pumpAndSettle();
      final Finder submitButtonFinder = find.byType(MyAfyaHubPrimaryButton);

      expect(
        find.byType(ScreeningToolQuestionWidget, skipOffstage: false),
        findsOneWidget,
      );

      await tester.tap(find.byType(MoodSymptomWidget).first);
      await tester.ensureVisible(submitButtonFinder);
      await tester.tap(submitButtonFinder);

      await tester.pumpAndSettle();
      expect(find.byType(SuccessfulAssessmentSubmissionPage), findsOneWidget);
    });

    testWidgets('shows snackbar to prompt user to answer all questions',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const ViolenceAssessmentPage(),
      );
      await tester.pumpAndSettle();
      final Finder submitButtonFinder = find.byType(MyAfyaHubPrimaryButton);

      expect(
        find.byType(ScreeningToolQuestionWidget, skipOffstage: false),
        findsOneWidget,
      );

      await tester.ensureVisible(submitButtonFinder);
      await tester.tap(submitButtonFinder);

      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
