// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_app_error_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

void main() {
  late Store<AppState> store;

  setUpAll(() {
    store = Store<AppState>(initialState: AppState.initial());
  });
  testWidgets('MobileConnectivityStatus should work correctly',
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
                      UpdateAppErrorStateAction(
                        errorMessage: 'error',
                        errorType: AppErrorType.UserFeedError,
                        isError: true,
                        isTimeout: false,
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
  });
}
