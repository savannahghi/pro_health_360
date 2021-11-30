import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/content/widgets/save_feed_item_widget.dart';

import '../../../../test_helpers.dart';

void main() {
  group('SaveFeedItemWidget', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('updates state when tapped', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return const SaveFeedItemWidget(
                  contentID: 29,
                );
              },
            ),
          ),
        ),
      );
      await tester.tap(find.byType(SaveFeedItemWidget));
      await tester.pump(const Duration(seconds: 2));
      expect(find.text(contentSavedSuccessfully), findsOneWidget);
    });
  });
}
