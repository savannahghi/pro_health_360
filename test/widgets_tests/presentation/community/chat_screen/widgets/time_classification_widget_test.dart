// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/time_classification_widget.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('TimeClassificationWidget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const TimeClassificationWidget(
          time: 'Today',
        ),
      );

      expect(find.text('Today'), findsOneWidget);
    });
  });
}
