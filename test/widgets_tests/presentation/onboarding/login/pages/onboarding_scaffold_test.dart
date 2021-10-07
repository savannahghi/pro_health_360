// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/onboarding_scaffold.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('Onboarding scaffold', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletPortrait;
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return OnboardingScaffold(
              child: Container(),
            );
          },
        ),
      );
      await tester.pump();

      expect(find.byType(CustomScrollView), findsOneWidget);
      expect(find.byType(SliverPersistentHeader), findsOneWidget);
      expect(find.byType(CustomScrollView), findsOneWidget);

      final ScrollController controller = primaryScrollController(tester);
      expect(controller.offset, 0.0);
      controller.jumpTo(-200.0);
      await tester.pump();

      // render 2nd time with different screen size
      // to trigger shouldRebuild method
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalPhoneScreenSizePortrait;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return OnboardingScaffold(
              child: Container(),
            );
          },
        ),
      );
      await tester.pump();

      controller.jumpTo(-200.0);
      await tester.pump();

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}

ScrollController primaryScrollController(WidgetTester tester) {
  return PrimaryScrollController.of(
      tester.element(find.byType(CustomScrollView)))!;
}
