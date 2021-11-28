// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/profile/medical_data/medical_data_page.dart';
import '../../../../test_helpers.dart';

void main() {
  group('MedicalDataPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const MedicalDataPage(),
      );

      expect(find.text('TPT status'), findsOneWidget);
      expect(find.text('No info'), findsOneWidget);
      expect(find.text('Required'), findsOneWidget);
    });
  });
}
