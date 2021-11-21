// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../../../mocks.dart';
import '../../../../../test_utils.dart';

void main() {
  late Store<AppState> store;

  setUpAll(() {
    store = Store<AppState>(initialState: AppState.initial());
  });

  testWidgets('should UpdatePinStatusAction works correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return SILPrimaryButton(
                  onPressed: () async {
                    StoreProvider.dispatch(
                      context,
                      UpdatePinStatusAction(invalidPin: false, pin: testPin),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byType(SILPrimaryButton));
    await tester.pumpAndSettle();
    expect(store.state.miscState!.userPin!.pin, testPin);
  });

  testWidgets('should clear controller', (WidgetTester tester) async {
    final MockTextEditingController controller = MockTextEditingController();
    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return SILPrimaryButton(
                  onPressed: () async {
                    StoreProvider.dispatch(
                      context,
                      UpdatePinStatusAction(
                        invalidPin: true,
                        pin: testPin,
                        controller: controller,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byType(SILPrimaryButton));
    await tester.pumpAndSettle();
    expect(store.state.miscState!.userPin!.pin, testPin);
  });
}
