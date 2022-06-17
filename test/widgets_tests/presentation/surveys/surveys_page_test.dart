import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/actions/update_misc_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/surveys/survey.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/surveys/custom_webview_page.dart';
import 'package:myafyahub/presentation/surveys/surveys_page.dart';
import 'package:myafyahub/presentation/surveys/widgets/survey_zero_state_widget.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('surveys assessment page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const SurveysPage(),
      );
      await tester.pumpAndSettle();

      expect(find.text(surveysTitle), findsOneWidget);
    });

    testWidgets('should open mental health survey correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const SurveysPage(),
      );
      await tester.pumpAndSettle();

      expect(find.text(surveysTitle), findsOneWidget);

      await tester.tap(find.byKey(const Key('phq9')));
      await tester.pumpAndSettle();

      expect(find.byType(CustomWebView), findsOneWidget);
    });

    testWidgets('renders zero state widget and re-fetches surveys successfully',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const SurveysPage(),
      );
      store.dispatch(UpdateMiscStateAction(availableSurveyList: <Survey>[]));

      await tester.pumpAndSettle();

      expect(find.byType(SurveyZeroStateWidget), findsOneWidget);
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.byType(SurveyZeroStateWidget), findsNothing);
    });
  });
}
