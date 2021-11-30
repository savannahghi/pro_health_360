// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/content/update_reactions_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import '../../../../test_helpers.dart';

void main() {
  group('UpdateReactionStatusAction', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('return state if content is not found',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await store.dispatch(
                  UpdateReactionStatusAction(
                    hasLiked: true,
                    contentID: 9,
                  ),
                );
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(
        store.state.contentState!.contentItems!.length,
        0,
      );
    });
  });
}
