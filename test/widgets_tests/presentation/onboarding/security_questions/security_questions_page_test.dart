// Flutter imports:
// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/inputs.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  Store<AppState> store = Store<AppState>(initialState: AppState.initial());

  final MockShortSILGraphQlClient mockShortSILGraphQlClient =
      MockShortSILGraphQlClient.withResponse(
    'idToken',
    'endpoint',
    http.Response(
      json.encode(<String, dynamic>{
        'data': <String, dynamic>{
          'getSecurityQuestions': securityQuestionsMock,
        },
      }),
      201,
    ),
  );

  const String firstQuestion = 'What are the last 4 digits of your CCC number?';

  group('SecurityQuestions', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalLargePhoneScreenSizePortrait;
      TestWidgetsFlutterBinding.ensureInitialized();

      store.dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: <SecurityQuestion>[
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
          ],
          securityQuestionsResponses: <SecurityQuestionResponse>[
            SecurityQuestionResponse.initial(),
            SecurityQuestionResponse.initial().copyWith(response: ''),
            SecurityQuestionResponse.initial(),
          ],
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const SecurityQuestionsPage(),
      );

      await tester.pumpAndSettle();

      expect(find.text(securityQuestionsDescriptionString), findsOneWidget);
      expect(find.text(setSecurityQuestionsString), findsOneWidget);
      expect(find.byType(ExpandableQuestion), findsWidgets);
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.text(firstQuestion));
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

    testWidgets('Navigates to Create New Pin page',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: <SecurityQuestion>[
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
          ],
          securityQuestionsResponses: <SecurityQuestionResponse>[
            SecurityQuestionResponse.initial(),
            SecurityQuestionResponse.initial(),
            SecurityQuestionResponse.initial(),
          ],
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const SecurityQuestionsPage(),
      );

      await tester.ensureVisible(find.byType(MyAfyaHubPrimaryButton));

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(CreateNewPINPage), findsOneWidget);
    });

    testWidgets('Shows loading indicator when fetching terms',
        (WidgetTester tester) async {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith(onboardingState: null),
      );

      store.dispatch(WaitAction<AppState>.add(getSecurityQuestionsFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const SecurityQuestionsPage(),
      );

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
