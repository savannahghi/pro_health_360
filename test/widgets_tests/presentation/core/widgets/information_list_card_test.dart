import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/core/widgets/information_list_card.dart';

import '../../../../test_helpers.dart';

void main() {
  group('TermsAndConditionsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const InformationListCard(title: Text('title')),
      );

      expect(find.text('title'), findsOneWidget);
    });

    testWidgets('should show Icon', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const InformationListCard(
          title: Text('title'),
          leadingIcon: Icons.access_alarm,
        ),
      );

      expect(find.text('title'), findsOneWidget);
      expect(find.byIcon(Icons.access_alarm), findsOneWidget);
    });
  });
}