import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/share_diary_entry_dialog.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/successful_diary_entry_page.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('ShareDiaryEntryDialog', () {
    final MockGraphQlClient graphQlClient = MockGraphQlClient();

    testWidgets('renders correctly', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: ShareDiaryEntryDialog(diaryEntry: HealthDiaryEntry.initial()),
      );

      expect(find.byKey(yesShareEntireEntryKey), findsOneWidget);
      expect(find.byKey(noShareEntireEntryKey), findsOneWidget);

      await tester.tap(find.byKey(yesShareEntireEntryKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(noShareEntireEntryKey));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
    });

    testWidgets('cancel button functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              text: 'tap',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ShareDiaryEntryDialog(
                      diaryEntry: HealthDiaryEntry.initial(),
                    );
                  },
                );
              },
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

      await tester.tap(find.byKey(cancelShareDiaryEntryKey));
      await tester.pumpAndSettle();

      expect(find.text('tap'), findsOneWidget);
    });

    testWidgets('share button functions correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              text: 'Tap',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ShareDiaryEntryDialog(
                      diaryEntry: HealthDiaryEntry.initial(),
                    );
                  },
                );
              },
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
      expect(
        find.byType(MyAfyaHubPrimaryButton, skipOffstage: false),
        findsNWidgets(3),
      );

      await tester.tap(find.byKey(shareDiaryEntryKey));
      await tester.pumpAndSettle();

      expect(find.byType(SuccessfulDiaryEntryPage), findsOneWidget);
    });

    testWidgets('share displays error snackbar correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'shareHealthDiaryEntry': false,
            }
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              text: 'Tap',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ShareDiaryEntryDialog(
                      diaryEntry: HealthDiaryEntry.initial(),
                    );
                  },
                );
              },
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
      expect(
        find.byType(MyAfyaHubPrimaryButton, skipOffstage: false),
        findsNWidgets(3),
      );

      await tester.tap(find.byKey(shareDiaryEntryKey));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
