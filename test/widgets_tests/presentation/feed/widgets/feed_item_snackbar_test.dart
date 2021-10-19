// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/engagement/feed/widgets/feed_item_snackbar.dart';
import '../../../../test_helpers.dart';

void main() {
  Store<AppState> store;
  final AppState state = AppState.initial();
  store = Store<AppState>(initialState: state);
  testWidgets('should get feed item action snackbar',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      client: baseGraphQlClientMock,
      widget: Builder(
        builder: (BuildContext context) => SILPrimaryButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              getFeedItemActionSnackbar(UniconsLine.cog, 'Resolving...', 1),
            );
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byType(SILPrimaryButton));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.byIcon(UniconsLine.cog), findsOneWidget);
    expect(find.text('Resolving...'), findsOneWidget);
  });
}
