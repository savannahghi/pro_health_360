// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
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

      expect(find.byType(GenericErrorWidget), findsOneWidget);
      await tester.tap(find.byKey(helpNoDataWidgetKey));
      await tester.pumpAndSettle();

      expect(find.byType(MedicalDataPage), findsNothing);
    });
  });
}
