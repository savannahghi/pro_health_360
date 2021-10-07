// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:myafyahub/presentation/core/widgets/pin_input_field_widget.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/verify_phone_page.dart';
import '../../../test_helpers.dart';

void main() {
  group('VerifyPhonePage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render error text if OTP is invalid',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const VerifyPhonePage(
            otp: 1234,
          ));

      await tester.pumpAndSettle();
      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '5555');
      await tester.pumpAndSettle();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));

      expect(find.text(invalidOTPString), findsOneWidget);
    });

    testWidgets('confirmOTP button is clickable if input is valid',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const VerifyPhonePage(
            otp: 1234,
          ));

      await tester.pumpAndSettle();
      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '1234');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));

      expect(find.text(invalidOTPString), findsNothing);
    });
  });
}
