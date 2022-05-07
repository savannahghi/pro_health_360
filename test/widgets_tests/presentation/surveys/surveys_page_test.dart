import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/surveys/surveys_page.dart';

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

      await tester.tap(find.byKey(healthSurveyKey));
      await tester.pumpAndSettle();
    });
  });
}
