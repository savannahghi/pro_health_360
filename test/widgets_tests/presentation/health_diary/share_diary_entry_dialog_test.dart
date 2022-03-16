import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/health_diary/widgets/share_diary_entry_dialog.dart';

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

      await buildTestWidget(
        tester: tester,
        store: store,
        client: graphQlClient,
        widget: ShareDiaryEntryDialog(diaryEntry: HealthDiaryEntry.initial()),
      );

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));

      await tester.tap(find.byKey(shareDiaryEntryKey));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
