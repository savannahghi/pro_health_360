import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/onboarding/forgot_pin/pages/pending_pin_request_page.dart';

import '../../../../test_helpers.dart';

void main() {
  group('PINRequestScaffold', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('PINRequestScaffold renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return const PendingPINRequestPage();
          },
        ),
      );
      await tester.pumpAndSettle();
      final Finder button = find.byKey(signInWithAnotherNumberButtonKey);

      expect(button, findsOneWidget);

      await tester.tap(button);
      await tester.pumpAndSettle();
      expect(find.byType(PendingPINRequestPage), findsNothing);
    });
  });
}
