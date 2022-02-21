// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/onboarding/set_new_pin/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/set_security_questions/security_questions_page.dart';
import 'package:shared_ui_components/inputs.dart';
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
          'recordSecurityQuestionResponses':
              mockRecordSecurityQuestionResponseData,
        },
      }),
      201,
    ),
  );

  const String firstQuestion = 'What are the last 4 digits of your CCC number?';
  const String secondQuestion = 'Which month did you start your treatment?';
  const String testResponse = 'Test';

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

    testWidgets('date picker textfield renders correctly',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalLargePhoneScreenSizePortrait;
      TestWidgetsFlutterBinding.ensureInitialized();
      // initializeDateFormatting();
      final DateTime now = DateTime.now();
      final int thisYear = now.year;
      final int currentMonth = now.month;
      final int currentDay = now.day;

      store.dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: <SecurityQuestion>[
            SecurityQuestion.initial(),
            SecurityQuestion.initial()
                .copyWith(responseType: SecurityQuestionResponseType.DATE),
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

      await tester.tap(find.text(secondQuestion));
      await tester.pumpAndSettle();

      final Finder datePickerField = find.byType(SILDatePickerField);
      expect(datePickerField, findsOneWidget);
      await tester.tap(datePickerField);
      await tester.pumpAndSettle();

      expect(find.text(thisYear.toString()), findsOneWidget);

      await tester.tap(find.text(thisYear.toString()));
      await tester.pumpAndSettle();

      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));

      expect(find.text('OK'), findsOneWidget);
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState?.securityQuestionResponses
            ?.elementAt(1)
            .response,
        formatSecurityQuestionDate(
          DateFormat(datePickerFormat)
              .format(DateTime(thisYear, currentMonth, currentDay)),
          format: 'dd-MM-yyyy',
        ),
      );
      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('Navigates to Create New Pin page',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateUserProfileAction(
          pinChangeRequired: true,
          termsAccepted: true,
          isPhoneVerified: true,
        ),
      );

      store.dispatch(UpdateCredentialsAction(isSignedIn: true));

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          securityQuestions: <SecurityQuestion>[
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
          ],
          securityQuestionsResponses: <SecurityQuestionResponse>[
            SecurityQuestionResponse.initial().copyWith(response: testResponse),
            SecurityQuestionResponse.initial().copyWith(response: testResponse),
            SecurityQuestionResponse.initial().copyWith(response: testResponse),
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

    testWidgets('should validate if all questions are answered',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: <SecurityQuestion>[
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
          ],
          securityQuestionsResponses: <SecurityQuestionResponse>[
            SecurityQuestionResponse.initial().copyWith(response: testResponse),
            SecurityQuestionResponse.initial().copyWith(response: ''),
            SecurityQuestionResponse.initial().copyWith(response: ''),
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

      await tester.tap(find.text(firstQuestion));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byType(MyAfyaHubPrimaryButton));

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(CreateNewPINPage), findsNothing);
    });

    testWidgets(
        'should not navigate to Create New Pin page if all questions not answered',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: <SecurityQuestion>[
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
          ],
          securityQuestionsResponses: <SecurityQuestionResponse>[
            SecurityQuestionResponse.initial().copyWith(response: testResponse),
            SecurityQuestionResponse.initial().copyWith(response: ''),
            SecurityQuestionResponse.initial().copyWith(response: ''),
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

      expect(find.byType(CreateNewPINPage), findsNothing);
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
