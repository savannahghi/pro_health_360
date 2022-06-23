import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/onboarding/forgot_pin/pages/pin_request_sent_page.dart';
import 'package:pro_health_360/presentation/onboarding/login/pages/login_page.dart';

import '../../../../test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  group('PinRequestSentPage', () {
    testWidgets('renders correctly and navigates to homepage on dismissal',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const PinRequestSentPage(),
      );

      expect(find.byType(PinRequestSentPage), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
