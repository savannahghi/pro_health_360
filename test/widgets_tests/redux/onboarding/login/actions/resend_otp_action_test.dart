// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/send_otp_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('ReSendOTPAction', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith
            .clientState!
            .user!
            .call(
              primaryContact: Contact(value: '+254717356476'),
              userId: 'user-id',
            )
            .copyWith
            .onboardingState!
            .verifyPhoneState!
            .call(otp: '123456', invalidOTP: false),
      );
    });

    testWidgets(
        'should fail to  resend an otp if the userID and phone number are '
        'UNKNOWN', (WidgetTester tester) async {
      store = Store<AppState>(initialState: AppState.initial());

      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              buttonKey: const Key('resend_otp'),
              onPressed: () async {
                await store.dispatch(
                  SendOTPAction(
                    context: context,
                    isResend: true,
                    callBackFunction: () {},
                  ),
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('resend_otp')));
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState!.verifyPhoneState!.failedToSendOTP,
        true,
      );
    });

    testWidgets('should fail to resend an OTP if there is an API error',
        (WidgetTester tester) async {
      expect(
        store.state.onboardingState!.verifyPhoneState!.failedToSendOTP,
        false,
      );

      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          403,
        ),
      );

      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              buttonKey: const Key('resend_otp'),
              onPressed: () async {
                try {
                  await store.dispatch(
                    SendOTPAction(
                      context: context,
                      isResend: true,
                      callBackFunction: () {},
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('resend_otp')));
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState!.verifyPhoneState!.failedToSendOTP,
        true,
      );

      expect(err, isA<Future<dynamic>>());
    });
  });
}
