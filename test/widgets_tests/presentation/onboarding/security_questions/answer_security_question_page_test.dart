// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/onboarding/set_security_questions/answer_security_question_page.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('AnswerSecurityQuestion', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalLargePhoneScreenSizePortrait;
      TestWidgetsFlutterBinding.ensureInitialized();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const AnswerSecurityQuestionPage(),
      );

      expect(find.text(answerSecurityQuestionString), findsOneWidget);
      expect(find.text(answerCorrectlyToGainAccessString), findsOneWidget);
      expect(find.byType(ExpandableQuestion), findsOneWidget);
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
  });
}
