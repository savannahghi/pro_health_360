import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_page.dart';

import '../../../test_helpers.dart';

void main() {
  group('MyHealthPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MyHealthPage(),
      );

      expect(find.byType(MyHealthPage), findsOneWidget);
      expect(find.text(myHealthPageHealthDiary), findsOneWidget);
    });
  });
}
