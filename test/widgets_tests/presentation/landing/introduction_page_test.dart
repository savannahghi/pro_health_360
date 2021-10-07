// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_screen/introduction_screen.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/onboarding/introduction/introduction_page.dart';
import '../../../test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('IntroductionPage', () {
    testWidgets('IntroductionPage Should render correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: IntroductionPage());
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.byType(IntroductionScreen), findsOneWidget);

      final Finder skipBtn = find.text('Skip');
      expect(skipBtn, findsOneWidget);
      await tester.tap(skipBtn);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Done'));

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
