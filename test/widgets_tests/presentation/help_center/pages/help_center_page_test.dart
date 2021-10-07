// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/help_center/help_center_question_card.dart';
import 'package:myafyahub/presentation/help_center/pages/help_center_page.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('Help Center', () {
    late Store<AppState> store;
    final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: HelpCenterPage(),
      );

      await tester.pumpAndSettle();
      final Finder scrollViewWidget = find.byType(SingleChildScrollView);
      expect(scrollViewWidget, findsOneWidget);
    });

    testWidgets('back arrow should pop Help Center page when pressed',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: HelpCenterPage(),
      );

      await tester.pumpAndSettle();
      final Finder backWidget = find.byKey(backButtonToLanding);
      expect(backWidget, findsOneWidget);

      await tester.tap(backWidget);
      await tester.pumpAndSettle();
      expect(find.byType(HelpCenterPage), findsNothing);
    });

    testWidgets('call button should navigate when pressed',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: HelpCenterPage(),
      );

      await tester.pumpAndSettle();
      final Finder callWidget = find.byKey(helpCenterCallKey);
      expect(callWidget, findsOneWidget);

      await tester.tap(callWidget);
    });

    testWidgets('WhatsApp button should navigate when pressed',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: HelpCenterPage(),
      );

      await tester.pumpAndSettle();
      final Finder whatsAppWidget = find.byKey(helpCenterWhatsAppKey);
      expect(whatsAppWidget, findsOneWidget);

      await tester.tap(whatsAppWidget);
    });

    testWidgets('should render faqs', (WidgetTester tester) async {
      final MockGraphQlClient2 mockGraphQlClient2 =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(helpCenterFAQMock), 201),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient2,
        widget: Builder(builder: (BuildContext context) {
          return HelpCenterPage();
        }),
      );

      await tester.pumpAndSettle();
      expect(find.byType(HelpCenterQuestionCard), findsOneWidget);
    });
  });
}
