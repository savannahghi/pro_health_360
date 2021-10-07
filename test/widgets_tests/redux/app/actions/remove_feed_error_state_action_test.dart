// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/remove_feed_error_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

void main() {
  late Store<AppState> store;

  setUpAll(() {
    store = Store<AppState>(initialState: AppState.initial());
  });
  testWidgets('should clear error state correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          home: Scaffold(body: Builder(builder: (BuildContext context) {
            return SILPrimaryButton(onPressed: () async {
              StoreProvider.dispatch(context, RemoveFeedErrorStateAction());
            });
          })),
        ),
      ),
    );
    await tester.tap(find.byType(SILPrimaryButton));
    await tester.pumpAndSettle();

    expect(store.state.miscState!.appErrorState!.isEmpty, true);
  });
}
