// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/core/widgets/sil_progress_dialog.dart';
import '../../../test_helpers.dart';

void main() {
  group('Sil progress dialog tests', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets(
        'should test initProgressDialog renderers correctly with a message',
        (WidgetTester tester) async {
      BuildContext? ctx;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              ctx = context;
              await showDialog(
                context: context,
                builder: (BuildContext context) => const SILProgressDialog(
                  message: Text('Loading...'),
                ),
              );
            },
          );
        }),
      );

      await tester.pump();
      final Finder silPrimaryButton = find.byType(SILPrimaryButton);
      await tester.tap(silPrimaryButton);
      await tester.pump();
      expect(find.text('Loading...'), findsOneWidget);
      hideProgressDialog(ctx!);
      await tester.pumpAndSettle();
      expect(find.text('Loading...'), findsNothing);
    });
    testWidgets(
        'should test circularProgressDialog renderers correctly without a message',
        (WidgetTester tester) async {
      BuildContext? ctx;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              ctx = context;
              await showDialog(
                context: context,
                builder: (BuildContext context) => const SILProgressDialog(
                  progress: Text('Please wait...'),
                  decoration: BoxDecoration(color: Colors.red),
                ),
              );
            },
          );
        }),
      );
      await tester.pump();

      final Finder silPrimaryButton = find.byType(SILPrimaryButton);
      await tester.tap(silPrimaryButton);

      await tester.pump();
      expect(find.text('Please wait...'), findsOneWidget);
      hideProgressDialog(ctx!);
      await tester.pumpAndSettle();
      expect(find.text('Please wait...'), findsNothing);
    });
  });
}
