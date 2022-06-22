import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import 'package:pro_health_360/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('PinExpiredPage', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    setUp(() async {
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

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
      expect(find.byType(VerifyPhonePage), findsOneWidget);
    });
  });
}
