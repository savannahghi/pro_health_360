// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/help_center/widgets/circular_background_icons.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('HelpCenter should', () {
    late Store<AppState> store;
    final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('render Circular Icon Widget correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const CircularBackGroundIcons(
            backgroundColor: AppColors.primaryColor,
            iconBackgroundPadding: 24,
            loadIcon: UniconsLine.phone,
          );
        }),
      );

      expect(find.byType(CircularBackGroundIcons), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });
}
