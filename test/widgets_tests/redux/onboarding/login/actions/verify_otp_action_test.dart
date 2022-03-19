// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/verify_otp_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('VerifyOTPAction', () {
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
            .call(
              otp: '123456',
              invalidOTP: false,
              phoneNumber: '+254712345678',
            ),
      );
    });

    testWidgets('should fail to verify an OTP if there is an API error',
        (WidgetTester tester) async {
      expect(
        store.state.onboardingState!.failedToSendOTP,
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

      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('verify_otp'),
              onPressed: () async {
                try {
                  await store.dispatch(
                    VerifyOTPAction(
                      context: context,
                      otp: '123456',
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

      await tester.tap(find.byKey(const Key('verify_otp')));
      await tester.pumpAndSettle();

      expect(find.text(getErrorMessage()), findsOneWidget);

      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should be invalid if otp is wrong',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyOTP': false,
            }
          }),
          201,
        ),
      );
      late dynamic err;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('verify_otp'),
              onPressed: () async {
                try {
                  await store.dispatch(
                    VerifyOTPAction(
                      context: context,
                      otp: '123456',
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

      await tester.tap(find.byKey(const Key('verify_otp')));
      await tester.pumpAndSettle();

      expect(err, isA<Future<dynamic>>());
      expect(find.text(invalidCode), findsWidgets);
    });
  });
}
