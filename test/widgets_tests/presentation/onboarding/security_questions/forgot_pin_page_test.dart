// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/forgot_pin/pages/forgot_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ForgotPinPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const ForgotPINPage(), 
      client: baseGraphQlClientMock,
      );

      final Finder resetPINButton = find.byKey(resetPINButtonKey);

      expect(resetPINButton, findsOneWidget);

      await tester.tap(resetPINButton);
      await tester.pumpAndSettle();

      expect(find.byType(VerifyPhonePage), findsOneWidget);
    });
  });
}
