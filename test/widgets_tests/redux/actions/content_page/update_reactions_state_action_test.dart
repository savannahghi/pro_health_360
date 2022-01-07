// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/actions/update_content_state_action.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/content/update_reactions_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import '../../../../mocks.dart';
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
                    contentDisplayedType: ContentDisplayedType.UNKNOWN,
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
        store.state.contentState!.feedContentState!.contentItems!.length,
        0,
      );
    });

    testWidgets('return newState if content is found',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateContentStateAction(
          contentItems: <Content>[mockContent],
        ),
      );
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
                    contentID: 1,
                    contentDisplayedType: ContentDisplayedType.FEED,
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
        store.state.contentState!.feedContentState!.contentItems!.length,
        1,
      );
    });
  });
}
