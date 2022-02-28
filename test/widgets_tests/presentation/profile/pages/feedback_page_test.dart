// Flutter imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:myafyahub/application/redux/states/app_state.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/profile/feedback/feedback_page.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  late Store<AppState> store;

  setUpAll(() {
    store = Store<AppState>(initialState: AppState.initial());
  });
  testWidgets('FeedbackPage should render correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      client: baseGraphQlClientMock,
      widget: const FeedbackPage(),
    );

    expect(find.byType(FeedbackPage), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets(
      'FeedbackPage navigates to successful feedback submission when sendFeedback is clicked',
      (WidgetTester tester) async {
    final MockShortSILGraphQlClient mockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'sendFeedback': true,
          },
        }),
        201,
      ),
    );
    await buildTestWidget(
      tester: tester,
      store: store,
      client: mockShortSILGraphQlClient,
      widget: const FeedbackPage(),
    );

    await tester.pumpAndSettle();
    final Finder textFormField = find.byKey(feedbackTextFieldKey);
    expect(textFormField, findsOneWidget);
    await tester.showKeyboard(textFormField);
    await tester.enterText(textFormField, 'text');
    await tester.pumpAndSettle();

    final Finder sendRequestButton = find.byKey(sendFeedbackButtonKey);

    await tester.ensureVisible(sendRequestButton);
    await tester.tap(sendRequestButton);
    await tester.pumpAndSettle();
    expect(find.byType(FeedbackPage), findsNothing);
  });

  testWidgets('should display errors if fetching data fails',
      (WidgetTester tester) async {
    final MockShortSILGraphQlClient mockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
        json.encode(<String, dynamic>{
          'errors': <Object>[
            <String, dynamic>{
              'message': '4: error',
            }
          ]
        }),
        401,
      ),
    );

    await buildTestWidget(
      tester: tester,
      store: store,
      client: mockShortSILGraphQlClient,
      widget: const FeedbackPage(),
    );

    await tester.pumpAndSettle();
    final Finder textFormField = find.byKey(feedbackTextFieldKey);
    expect(textFormField, findsOneWidget);
    await tester.showKeyboard(textFormField);
    await tester.enterText(textFormField, 'text');
    await tester.pumpAndSettle();

    final Finder sendRequestButton = find.byKey(sendFeedbackButtonKey);

    await tester.ensureVisible(sendRequestButton);
    await tester.tap(sendRequestButton);
    await tester.pumpAndSettle();
    expect(find.byType(FeedbackPage), findsOneWidget);
  });

  testWidgets('FeedbackPage pop when cancel is clicked',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      client: baseGraphQlClientMock,
      widget: const FeedbackPage(),
    );

    final Finder cancelRequestButton = find.byKey(cancelFeedbackButtonKey);

    expect(cancelRequestButton, findsOneWidget);

    await tester.ensureVisible(cancelRequestButton);
    await tester.tap(cancelRequestButton);
    await tester.pumpAndSettle();
    expect(find.byType(FeedbackPage), findsNothing);
  });

  testWidgets('FeedbackPage radio buttons are clickable ',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      client: baseGraphQlClientMock,
      widget: const FeedbackPage(),
    );

    final Finder yesRadioButton = find.byKey(yesRadioButtonKey);
    final Finder noRadioButton = find.byKey(noRadioButtonKey);
    final Finder yesButton = find.byKey(yesButtonKey);
    final Finder noButton = find.byKey(noButtonKey);

    expect(yesRadioButton, findsOneWidget);
    expect(noRadioButton, findsOneWidget);
    expect(yesButton, findsOneWidget);
    expect(noButton, findsOneWidget);

    await tester.tap(find.text(noString));
    await tester.pumpAndSettle();
    expect(
      (tester.firstWidget(noRadioButton) as Radio<FollowUpChoice>).value,
      FollowUpChoice.No,
    );

    await tester.tap(yesRadioButton);
    await tester.pumpAndSettle();
    expect(
      (tester.firstWidget(yesRadioButton) as Radio<FollowUpChoice>).value,
      FollowUpChoice.Yes,
    );

    await tester.tap(noRadioButton);
    await tester.pumpAndSettle();
    expect(
      (tester.firstWidget(noRadioButton) as Radio<FollowUpChoice>).value,
      FollowUpChoice.No,
    );

    await tester.tap(find.text(yesString));
    await tester.pumpAndSettle();
    expect(
      (tester.firstWidget(yesRadioButton) as Radio<FollowUpChoice>).value,
      FollowUpChoice.Yes,
    );
  });
}
