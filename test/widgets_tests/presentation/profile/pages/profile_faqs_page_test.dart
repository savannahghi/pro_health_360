// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/profile/pages/profile_faqs_page.dart';
import 'package:myafyahub/presentation/profile/widgets/expandable_content.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('ProfileFaqsPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalLargePhoneScreenSizePortrait;
      TestWidgetsFlutterBinding.ensureInitialized();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ProfileFaqsPage(),
      );

      expect(find.text(frequentlyAskedQuestions), findsOneWidget);
      expect(find.text(faqsText), findsOneWidget);
      expect(find.byKey(appBarBackButtonKey), findsOneWidget);
      expect(find.byType(ExpandableContent), findsWidgets);

      await tester.tap(find.text(howDoIUpdateMyProfileText));
      await tester.pumpAndSettle();

      final Finder text = find.text(loremIpsumText);
      expect(text, findsOneWidget);
      await tester.tap(text);
      await tester.pumpAndSettle();

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
