// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/actions/resend_otp_action.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('ReSendOTPAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
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
            .call(otp: '123456', invalidOTP: false),
      );
    });

    testWidgets(
        'should fail to  resend an otp if the userID and phone number are '
        'UNKNOWN', (WidgetTester tester) async {
      storeTester = StoreTester<AppState>(initialState: AppState.initial());

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('resend_otp'),
              onPressed: () async {
                await storeTester.dispatch(
                  ResendOTPAction(
                    context: context,
                    afterCallback: () {},
                    phoneNumber: UNKNOWN,
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
        storeTester.state.onboardingState!.failedToSendOTP,
        true,
      );
    });

    testWidgets('should fail to resend an OTP if there is an API error',
        (WidgetTester tester) async {
      expect(
        storeTester.state.onboardingState!.failedToSendOTP,
        false,
      );

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          403,
        ),
      );

      late MyAfyaException err;

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('resend_otp'),
              onPressed: () async {
                try {
                  await storeTester.dispatch(
                    ResendOTPAction(
                      context: context,
                      afterCallback: () {},
                      phoneNumber: '+254712345678',
                    ),
                  );
                } catch (e) {
                  err = e as MyAfyaException;
                }
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('resend_otp')));
      await tester.pumpAndSettle();

      expect(
        storeTester.state.onboardingState!.failedToSendOTP,
        true,
      );

      expect(err.cause, 'resend_otp_error');
    });
  });
}
