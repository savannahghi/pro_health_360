import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tool_menu_item.dart';
import 'package:myafyahub/presentation/home/widgets/survey_carousel.dart';
import 'package:myafyahub/presentation/surveys/surveys_page.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('SurveyCarousel', () {
    late Store<AppState> store;
    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
      'should navigate to violence assessment page and back',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: const SurveyCarousel(),
        );
        await tester.pumpAndSettle();

        expect(
          find.byType(HomePageCarouselItem, skipOffstage: false),
          findsOneWidget,
        );
        expect(find.byType(SurveyCarousel), findsOneWidget);
        await tester.tap(find.byKey(phq9surveyKey));

        await tester.pumpAndSettle();

        expect(find.byType(SurveysPage), findsOneWidget);
      },
    );
  });
}
