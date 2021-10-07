// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/verify_phone_otp.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/phone_signup_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/phone_number_login_page.dart';
import 'package:myafyahub/presentation/onboarding/signup/verify_signup_otp.dart';
import '../../../../test_helpers.dart';
import '../../../../test_utils.dart';

void main() {
  group('Forgot pin page', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            store.dispatch(PhoneSignUpStateAction(
                phoneNumber: testPhoneNumber, otp: testOTP));
            return VerifySignUpOTP();
          },
        ),
      );

      await tester.pump();

      final Finder imageWidget = find.byType(SvgPicture);
      expect(imageWidget, findsOneWidget);
      final Finder verifyPhoneOtp = find.byType(VerifyPhoneOtp);
      expect(verifyPhoneOtp, findsOneWidget);
      await tester.tap(find.byType(SILPinCodeTextField));
      await tester.enterText(find.byType(SILPinCodeTextField), '123456');
      await tester.pumpAndSettle(const Duration(seconds: 10));
    });

    testWidgets('back button should navigate to CreateAccountPage',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            store.dispatch(PhoneSignUpStateAction(
                phoneNumber: testPhoneNumber, otp: testOTP));
            return VerifySignUpOTP();
          },
        ),
      );

      await tester.pump();

      final Finder imageWidget = find.byType(SvgPicture);
      expect(imageWidget, findsOneWidget);
      final Finder verifyPhoneOtp = find.byType(VerifyPhoneOtp);
      expect(verifyPhoneOtp, findsOneWidget);
      await tester.tap(find.byType(SILNoBorderButton));

      await tester.pumpAndSettle();
      expect(find.byType(PhoneNumberLoginPage), findsOneWidget);
    });

    testWidgets('changeNumberCallback should work correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            store.dispatch(PhoneSignUpStateAction(
                phoneNumber: testPhoneNumber, otp: testOTP));
            return VerifySignUpOTP();
          },
        ),
      );

      await tester.pump();

      final Finder imageWidget = find.byType(SvgPicture);
      expect(imageWidget, findsOneWidget);
      final Finder verifyPhoneOtp = find.byType(VerifyPhoneOtp);
      expect(verifyPhoneOtp, findsOneWidget);

      expect(find.text('Change number'), findsOneWidget);
      await tester.tap(find.text('Change number'));

      await tester.pumpAndSettle();
      expect(find.byType(PhoneNumberLoginPage), findsOneWidget);
    });

    testWidgets('VerifyPhoneOtp successCallBack works correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            store.dispatch(PhoneSignUpStateAction(
                phoneNumber: testPhoneNumber, otp: testOTP));
            return VerifySignUpOTP();
          },
        ),
      );

      await tester.pump();

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(SILPinCodeTextField), findsOneWidget);

      await tester.tap(find.byType(SILPinCodeTextField));
      await tester.pumpAndSettle();

      final Finder resendOtpFinder = find.text(' Send the code again ');
      expect(resendOtpFinder, findsOneWidget);
      await tester.tap(resendOtpFinder);
      await tester.pumpAndSettle();

      final Finder resendRadioFinder = find.text('via Text Message');
      expect(resendRadioFinder, findsOneWidget);
      await tester.tap(resendRadioFinder);
      await tester.pumpAndSettle();
    });
  });
}
