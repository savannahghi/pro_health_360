import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/violence_assessment/pages/violence_assessment_page.dart';

import '../../../test_helpers.dart';

void main() {
  group('violence assessment page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ViolenceAssessmentPage(),
      );

      expect(find.text(violenceAssessmentSubtitle), findsOneWidget);
      expect(find.text(emotionalViolence), findsOneWidget);
      expect(find.text(emotionalViolenceQuestion), findsOneWidget);
    });

    testWidgets('emotional violence yes button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ViolenceAssessmentPage(),
      );

      expect(find.byKey(yesEmotionalAssessmentKey), findsOneWidget);
      await tester.tap(find.byKey(yesEmotionalAssessmentKey));
      // todo: (byron) add assertion when onTap is implemented
    });
    testWidgets('emotional violence no button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ViolenceAssessmentPage(),
      );

      expect(find.byKey(noEmotionalAssessmentKey), findsOneWidget);
      await tester.tap(find.byKey(noEmotionalAssessmentKey));
      // todo: (byron) add assertion when onTap is implemented
    });

    testWidgets('physical violence yes button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ViolenceAssessmentPage(),
      );

      expect(find.byKey(yesPhysicalAssessmentKey), findsOneWidget);
      await tester.tap(find.byKey(yesPhysicalAssessmentKey));
      // todo: (byron) add assertion when onTap is implemented
    });
    testWidgets('physical violence no button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ViolenceAssessmentPage(),
      );

      expect(find.byKey(noPhysicalAssessmentKey), findsOneWidget);
      await tester.tap(find.byKey(noPhysicalAssessmentKey));
      // todo: (byron) add assertion when onTap is implemented
    });

    testWidgets('sexual violence yes button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ViolenceAssessmentPage(),
      );

      expect(find.byKey(yesSexualAssessmentKey), findsOneWidget);
      await tester.tap(find.byKey(yesSexualAssessmentKey));
      // todo: (byron) add assertion when onTap is implemented
    });
    testWidgets('sexual violence no button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ViolenceAssessmentPage(),
      );

      expect(find.byKey(noSexualAssessmentKey), findsOneWidget);
      await tester.tap(find.byKey(noSexualAssessmentKey));
      // todo: (byron) add assertion when onTap is implemented
    });

    testWidgets('intimate partner violence yes button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ViolenceAssessmentPage(),
      );

      expect(
        find.byKey(yesIntimateAssessmentKey, skipOffstage: false),
        findsOneWidget,
      );
      await tester.ensureVisible(find.byKey(yesIntimateAssessmentKey));
      await tester.tap(find.byKey(yesIntimateAssessmentKey));
      await tester.pumpAndSettle();
      // todo: (byron) add assertion when onTap is implemented
    });
    testWidgets('intimate partner violence no button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ViolenceAssessmentPage(),
      );

      await tester.ensureVisible(find.byKey(yesIntimateAssessmentKey));
      expect(find.byKey(noIntimateAssessmentKey), findsOneWidget);
      await tester
          .tap(find.byKey(noIntimateAssessmentKey, skipOffstage: false));
      await tester.pumpAndSettle();

      // todo: (byron) add assertion when onTap is implemented
    });
    testWidgets('submit violence assessment button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ViolenceAssessmentPage(),
      );
      await tester.ensureVisible(find.byKey(submitViolenceAssessmentKey));

      expect(find.byKey(submitViolenceAssessmentKey), findsOneWidget);
      await tester.tap(find.byKey(submitViolenceAssessmentKey));
      await tester.pumpAndSettle();

      // todo: (byron) add assertion when onTap is implemented
    });
  });
}
