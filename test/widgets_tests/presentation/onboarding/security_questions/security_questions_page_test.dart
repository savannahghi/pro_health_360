// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/inputs.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/security_questions_page.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('SecurityQuestions', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalLargePhoneScreenSizePortrait;
      TestWidgetsFlutterBinding.ensureInitialized();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const SecurityQuestionsPage(),
      );

      expect(find.text(securityQuestionsDescriptionString), findsOneWidget);
      expect(find.text(setSecurityQuestionsString), findsOneWidget);
      expect(find.byType(ExpandableQuestion), findsWidgets);
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.text(whereWereYouBornString));
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
        widget: const SecurityQuestionsPage(),
      );

      expect(find.text(securityQuestionsDescriptionString), findsOneWidget);
      expect(find.text(setSecurityQuestionsString), findsOneWidget);
      expect(find.byType(ExpandableQuestion), findsWidgets);
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.text(whereWereYouBornString));
      await tester.pumpAndSettle();

      final Finder textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);
      await tester.showKeyboard(textFormField);
      await tester.enterText(textFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(whereWereYouBornString));
      await tester.pumpAndSettle();

      await tester.tap(find.text(whatsTheNameOfYourPetString));
      await tester.pumpAndSettle();

      final Finder petTextFormField = find.byType(TextFormField);
      expect(petTextFormField, findsOneWidget);
      await tester.showKeyboard(petTextFormField);
      await tester.enterText(petTextFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(whatsTheNameOfYourPetString));
      await tester.pumpAndSettle();

      await tester.tap(find.text(whatsYourFavouriteFoodString));
      await tester.pumpAndSettle();

      final Finder favouriteFoodTextFormField = find.byType(TextFormField);
      expect(favouriteFoodTextFormField, findsOneWidget);
      await tester.showKeyboard(favouriteFoodTextFormField);
      await tester.enterText(favouriteFoodTextFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(whatsYourFavouriteFoodString));
      await tester.pumpAndSettle();

      await tester.tap(find.text(whereDidYouFirstLiveString));
      await tester.pumpAndSettle();

      final Finder firstLivedTextFormField = find.byType(TextFormField);
      expect(firstLivedTextFormField, findsOneWidget);
      await tester.showKeyboard(firstLivedTextFormField);
      await tester.enterText(firstLivedTextFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(whereDidYouFirstLiveString));
      await tester.pumpAndSettle();

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('Navigates to Create New Pin page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const SecurityQuestionsPage(),
      );

      await tester.ensureVisible(find.byType(MyAfyaHubPrimaryButton));

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(CreateNewPINPage), findsOneWidget);
    });
  });
}
