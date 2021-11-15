import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/pin_input_field_widget.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/verify_otp_widget.dart';
import 'package:myafyahub/presentation/onboarding/terms_and_conditions_page.dart';

import '../../../../../mocks.dart';

void main() {
  group('VerifyOtpWidget', () {
    bool testCallback({required String otp, required Function toggleLoading}) {
      return true;
    }

    testWidgets('should render VerifyPhoneOtp when otp is correct ',
        (WidgetTester tester) async {
      final Widget testWidget = MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: VerifyOtpWidget(
                client: MockGraphQlClient(),
                appWrapperContext: 'AppContext',
                loader: const CircularProgressIndicator(),
                otp: '1234',
                userID: 'some-user-id',
                phoneNo: '0712345678',
                successCallBack: testCallback,
              ),
            );
          },
        ),
      );
      await tester.pumpWidget(testWidget);

      await tester.pumpAndSettle();
      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '1234');
      await tester.pumpAndSettle();
      expect(find.byType(TermsAndConditionsPage), findsNothing);
    });

    testWidgets('should render resend otp ', (WidgetTester tester) async {
      await tester.runAsync(() async {
        final Widget testWidget = MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: VerifyOtpWidget(
                  appWrapperContext: 'AppContext',
                  client: MockGraphQlClient(),
                  loader: const CircularProgressIndicator(),
                  otp: '1234',
                  userID: 'some-user-id',
                  phoneNo: '0712345678',
                  successCallBack: testCallback,
                ),
              );
            },
          ),
        );
        await tester.pumpWidget(testWidget);

        await tester.pumpAndSettle();
        expect(find.byType(PINInputField), findsOneWidget);
        await tester.tap(find.byType(PINInputField));
        await tester.pumpAndSettle();

        expect(find.byKey(resendOtpButtonKey), findsOneWidget);
        await tester.tap(find.byKey(resendOtpButtonKey));
        await tester.pumpAndSettle();

        // get the state
        final State<StatefulWidget> testState = tester.allStates.singleWhere(
          (State<StatefulWidget> element) =>
              element.toString() == verifyOTPState,
        );

        // check if it is null
        expect(testState, isNotNull);

        // call the method
        final VerifyOtpWidgetState verifyPhoneOtpState =
            testState as VerifyOtpWidgetState;
        verifyPhoneOtpState.codeUpdated();

        // assert that is was called
        expect(() => verifyPhoneOtpState.codeUpdated(), returnsNormally);
      });
    });
  });
}
