import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/onboarding_behavior_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/onboarding_page_header.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:misc_utilities/number_constants.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('OnboardingPageHeader', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletPortrait;
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: CustomScrollView(slivers: <Widget>[
          SliverPersistentHeader(
            //          floating: true,
            // pinned: true,
            delegate: OnboardingPageHeader(
                maxExtent: number200,
                minExtent: number100,
                showBackArrow: true),
          ),
        ]),
      );
      await tester.pump();

      expect(find.byKey(onboardingScaffoldBackButton), findsOneWidget);
      expect(find.text(OnboardingAppBarValuesSubject().title.valueOrNull!),
          findsOneWidget);
      expect(
          find.text(OnboardingAppBarValuesSubject().description.valueOrNull!),
          findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should navigate back', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletPortrait;
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: CustomScrollView(slivers: <Widget>[
          SliverPersistentHeader(
            delegate: OnboardingPageHeader(
                maxExtent: number200,
                minExtent: number100,
                showBackArrow: true,
                backRoute: BWRoutes.landing),
          ),
        ]),
      );
      await tester.pump();

      expect(find.byKey(onboardingScaffoldBackButton), findsOneWidget);
      expect(find.text(OnboardingAppBarValuesSubject().title.valueOrNull!),
          findsOneWidget);
      expect(
          find.text(OnboardingAppBarValuesSubject().description.valueOrNull!),
          findsOneWidget);

      await tester.tap(find.byKey(onboardingScaffoldBackButton));
      await tester.pumpAndSettle();

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
