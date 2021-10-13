// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:afya_moja_core/inputs.dart';
import 'package:afya_moja_core/buttons.dart';
import 'package:myafyahub/presentation/profile/pages/profile_faqs_page.dart';
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
      expect(find.byType(ExpandableQuestion), findsWidgets);
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.text(howDoIUpdateMyProfileText));
      await tester.pumpAndSettle();

      final Finder textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);
      await tester.showKeyboard(textFormField);
      await tester.enterText(textFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('ExpandableQuestion TextFormField allow input correctly',
        (WidgetTester tester) async {
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

      expect(find.text(faqsText), findsOneWidget);
      expect(find.text(frequentlyAskedQuestions), findsOneWidget);
      expect(find.byType(ExpandableQuestion), findsWidgets);
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.text(howDoIUpdateMyProfileText));
      await tester.pumpAndSettle();

      final Finder textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);
      await tester.showKeyboard(textFormField);
      await tester.enterText(textFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(howDoIUpdateMyProfileText));
      await tester.pumpAndSettle();

      await tester.tap(find.text(howDoICheckMyMedicalInfoText));
      await tester.pumpAndSettle();

      final Finder petTextFormField = find.byType(TextFormField);
      expect(petTextFormField, findsOneWidget);
      await tester.showKeyboard(petTextFormField);
      await tester.enterText(petTextFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(howDoICheckMyMedicalInfoText));
      await tester.pumpAndSettle();

      await tester.tap(find.text(howDoIUpdateMyNicknameText));
      await tester.pumpAndSettle();

      final Finder favouriteFoodTextFormField = find.byType(TextFormField);
      expect(favouriteFoodTextFormField, findsOneWidget);
      await tester.showKeyboard(favouriteFoodTextFormField);
      await tester.enterText(favouriteFoodTextFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(howDoIUpdateMyNicknameText));
      await tester.pumpAndSettle();

      await tester.tap(find.text(howDoIRescheduleAnAppointmentText));
      await tester.pumpAndSettle();

      final Finder firstLivedTextFormField = find.byType(TextFormField);
      expect(firstLivedTextFormField, findsOneWidget);
      await tester.showKeyboard(firstLivedTextFormField);
      await tester.enterText(firstLivedTextFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(howDoIRescheduleAnAppointmentText));
      await tester.pumpAndSettle();

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
