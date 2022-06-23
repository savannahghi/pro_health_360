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
import 'package:pro_health_360/application/redux/actions/send_otp_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/contact.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('SendOTPAction', () {
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
            .call(otp: '1234', invalidOTP: false),
      );
    });

    testWidgets(
        'should fail to send an otp if the userID and phone number are '
        'UNKNOWN', (WidgetTester tester) async {
      store = Store<AppState>(initialState: AppState.initial());

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
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('update_contacts'),
              onPressed: () {
                StoreProvider.dispatch<AppState>(
                  context,
                  SendOTPAction(context: context, phoneNumber: UNKNOWN),
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState?.failedToSendOTP,
        true,
      );
    });

    testWidgets('should fail to send an OTP if there is an API error',
        (WidgetTester tester) async {
      expect(
        store.state.onboardingState?.failedToSendOTP,
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

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('update_contacts'),
              onPressed: () async {
                await store.dispatch(
                  SendOTPAction(context: context, phoneNumber: '+254712345678'),
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState?.failedToSendOTP,
        true,
      );
    });

    testWidgets('should display bottom modal sheet if there is a backend error',
        (WidgetTester tester) async {
      expect(
        store.state.onboardingState?.failedToSendOTP,
        false,
      );

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'data': 'some error'}),
          401,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('update_contacts'),
              onPressed: () async {
                await store.dispatch(
                  SendOTPAction(context: context, phoneNumber: '+254712345678'),
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState?.failedToSendOTP,
        true,
      );
    });
  });
}
