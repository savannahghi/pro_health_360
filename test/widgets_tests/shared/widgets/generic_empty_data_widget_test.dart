// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';
import '../../../test_helpers.dart';

void main() {
  group('GenericEmptyData test', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('GenericEmptyData should render correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const GenericEmptyData(item: 'FAQ'),
      );

      await tester.pumpAndSettle();

      final Finder containerWidget = find.byKey(genericContainerKey);
      expect(containerWidget, findsOneWidget);
    });
  });
}
