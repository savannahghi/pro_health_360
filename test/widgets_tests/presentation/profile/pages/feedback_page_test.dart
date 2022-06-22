// Flutter imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/profile/feedback/feedback_page.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  late Store<AppState> store;

  setUpAll(() {
    store = Store<AppState>(initialState: AppState.initial());
  });
  testWidgets('FeedbackPage should render correctly for general feedback',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      client: baseGraphQlClientMock,
      widget: const FeedbackPage(),
    );

    expect(find.byType(FeedbackPage), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);

    await tester.tap(find.byType(SelectOptionField));
    await tester.pumpAndSettle();

    expect(find.text(servicesOffered), findsNWidgets(2));
    await tester.tap(find.text(generalFeedBack).last);

    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(feedbackTextFieldKey));
    expect(find.byType(TextField, skipOffstage: false), findsOneWidget);
  });

  testWidgets('FeedbackPage should render correctly for services feedback',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      client: baseGraphQlClientMock,
      widget: const FeedbackPage(),
    );
    await tester.pumpAndSettle();

    expect(find.byType(FeedbackPage), findsOneWidget);
    expect(find.byType(SelectOptionField), findsOneWidget);

    await tester.tap(find.byType(SelectOptionField));
    await tester.pumpAndSettle();

    expect(find.text(servicesOffered), findsNWidgets(2));
    await tester.tap(find.text(servicesOffered).last);

    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(feedbackTextFieldKey));
    expect(find.byType(TextField, skipOffstage: false), findsNWidgets(2));
  });

  testWidgets(
      'FeedbackPage navigates to successful feedback submission when send services Feedback is clicked',
      (WidgetTester tester) async {
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
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
    await tester.tap(find.byType(SelectOptionField));
    await tester.pumpAndSettle();

    expect(find.text(servicesOffered), findsNWidgets(2));
    await tester.tap(find.text(servicesOffered).last);
    await tester.pumpAndSettle();

    final Finder feedBackFieldFinder = find.byKey(feedbackTextFieldKey);
    final Finder serviceFieldFinder = find.byKey(serviceTextFieldKey);

    expect(feedBackFieldFinder, findsOneWidget);
    expect(serviceFieldFinder, findsOneWidget);
    await tester.enterText(feedBackFieldFinder, 'text');
    await tester.enterText(serviceFieldFinder, 'text');

    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byKey(oneRatingButtonKey));

    expect(find.byKey(oneRatingButtonKey), findsOneWidget);
    await tester.tap(find.byKey(oneRatingButtonKey));

    await tester.pumpAndSettle();

    final Finder sendRequestButton = find.byKey(sendFeedbackButtonKey);

    await tester.ensureVisible(sendRequestButton);
    await tester.tap(sendRequestButton);
    await tester.pumpAndSettle();
    expect(find.byType(FeedbackPage), findsNothing);
  });

  testWidgets(
      'FeedbackPage navigates to successful feedback submission when send general Feedback is clicked',
      (WidgetTester tester) async {
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
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

    expect(find.byKey(yesFeedbackKey), findsOneWidget);
    expect(find.byKey(noFeedbackKey), findsOneWidget);

    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byKey(oneRatingButtonKey));

    expect(find.byKey(oneRatingButtonKey), findsOneWidget);
    await tester.tap(find.byKey(oneRatingButtonKey));

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(yesFeedbackKey));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(noFeedbackKey));

    await tester.pumpAndSettle();
    final Finder sendRequestButton = find.byKey(sendFeedbackButtonKey);

    await tester.ensureVisible(sendRequestButton);
    await tester.tap(sendRequestButton);
    await tester.pumpAndSettle();
    expect(find.byType(FeedbackPage), findsNothing);
  });

  testWidgets('should display errors if fetching data fails',
      (WidgetTester tester) async {
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
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
  testWidgets('should display error snackbar if fetching data fails',
      (WidgetTester tester) async {
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{'sendFeedback': false}
          },
        ),
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

    expect(find.byKey(yesFeedbackKey), findsOneWidget);
    expect(find.byKey(noFeedbackKey), findsOneWidget);

    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byKey(oneRatingButtonKey));

    expect(find.byKey(oneRatingButtonKey), findsOneWidget);
    await tester.tap(find.byKey(oneRatingButtonKey));

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(yesFeedbackKey));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(noFeedbackKey));

    await tester.pumpAndSettle();
    final Finder sendRequestButton = find.byKey(sendFeedbackButtonKey);

    await tester.ensureVisible(sendRequestButton);
    await tester.tap(sendRequestButton);
    await tester.pumpAndSettle();
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
