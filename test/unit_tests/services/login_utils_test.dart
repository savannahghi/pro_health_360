// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/login_utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import '../../mocks.dart';
import '../../test_helpers.dart';

void main() {
  final MockGraphQlClient GraphQlClient = MockGraphQlClient();

  testWidgets('should show bottomsheet when phone number is invalid',
      (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    await buildTestWidget(
      tester: tester,
      store: store,
      client: GraphQlClient,
      widget: Material(
        child: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(
                onPressed: () => signInUser(
                    context: context,
                    phoneNumber: '1w24osdfsohaoasdsad',
                    pin: '1111'));
          },
        ),
      ),
    );

    await tester.pump();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    expect(find.byKey(feedbackBottomSheet), findsOneWidget);
  });
}
