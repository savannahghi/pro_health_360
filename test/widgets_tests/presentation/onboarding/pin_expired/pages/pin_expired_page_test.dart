import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import '../../../../../test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  group('PinExpiredPage', () {
    testWidgets('renders correctly and navigates to login page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const PinExpiredPage(),
      );

      expect(find.byType(PinExpiredPage), findsOneWidget);
      expect(find.byKey(changeMyPinButtonKey), findsOneWidget);

      await tester.tap(find.byKey(changeMyPinButtonKey));
      await tester.pumpAndSettle();

      expect(find.byKey(changeMyPinButtonKey), findsNothing);
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
