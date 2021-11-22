// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/infrastructure/connecitivity/mobile_connectivity_status.dart';

void main() {
  late Store<AppState> store;

  setUpAll(() {
    store = Store<AppState>(initialState: AppState.initial());
  });
  testWidgets('should MobileConnectivityStatus works correctly',
      (WidgetTester tester) async {
    final MobileConnectivityStatus mobileConnectivityStatus =
        MobileConnectivityStatus();
    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return SILPrimaryButton(
                  onPressed: () async {
                    await mobileConnectivityStatus.checkConnection();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SILPrimaryButton), findsOneWidget);
    await tester.tap(find.byType(SILPrimaryButton));
    await tester.pumpAndSettle();
  });
}
