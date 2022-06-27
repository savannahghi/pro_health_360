import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/health_diary/screening_tools/widgets/screening_tool_menu_item.dart';
import 'package:pro_health_360/presentation/home/widgets/survey_carousel.dart';
import 'package:pro_health_360/presentation/surveys/custom_webview_page.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('SurveyCarousel', () {
    late Store<AppState> store;
    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      await setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets(
      'should navigate to survey web view',
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

        expect(find.byType(CustomWebView), findsOneWidget);
        final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
        // ignore: avoid_dynamic_calls
        await widgetsAppState.didPopRoute();
        await tester.pump();
        expect(find.byType(SurveyCarousel), findsOneWidget);
      },
    );

    testWidgets(
      'should navigate back from survey web view',
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

        expect(find.byType(CustomWebView), findsOneWidget);
        await tester.tap(find.byKey(appBarBackButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(SurveyCarousel), findsOneWidget);
      },
    );
  });
}
