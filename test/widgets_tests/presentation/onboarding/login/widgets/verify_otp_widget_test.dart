// Flutter imports:

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
// Flutter imports:

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/resend_otp_action.dart';
import 'package:pro_health_360/application/redux/actions/send_otp_action.dart';
// Project imports:
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/actions/verify_otp_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/verify_phone_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/contact.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/onboarding/verify_phone/pages/verify_phone_widget.dart';
import 'package:pro_health_360/presentation/onboarding/verify_phone/widgets/verify_otp_widget.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('VerifyOtpWidget', () {
    late Store<AppState> store;

    setUp(() async {
      await setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith
            .clientState!
            .user!
            .call(
              primaryContact: Contact(value: '+254712345678'),
              userId: 'user-id',
            )
            .copyWith
            .onboardingState!
            .call(otp: '123456', invalidOTP: false),
      );
    });

    testWidgets('should render resend otp button ',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        final MockShortGraphQlClient mockShortSILGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'sendOTP': '123456',
                'sendRetryOTP': '123456',
              }
            }),
            201,
          ),
        );

        store.dispatch(
          UpdateOnboardingStateAction(canResendOTP: true),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: StoreConnector<AppState, VerifyPhoneViewModel>(
            converter: (Store<AppState> store) {
              return VerifyPhoneViewModel.fromStore(store.state);
            },
            builder: (BuildContext context, VerifyPhoneViewModel vm) {
              return VerifyPhoneWidget(
                vm: vm,
                sendOTPFunction: () async {
                  StoreProvider.dispatch<AppState>(
                    context,
                    SendOTPAction(context: context, phoneNumber: phoneNumber),
                  );
                },
                canResendOTPFunction: () async {
                  StoreProvider.dispatch<AppState>(
                    context,
                    UpdateOnboardingStateAction(canResendOTP: true),
                  );
                },
                cantResendOTPFunction: () async {
                  StoreProvider.dispatch<AppState>(
                    context,
                    UpdateOnboardingStateAction(canResendOTP: false),
                  );
                },
                onDone: (String enteredCode) {
                  if (enteredCode == vm.otp) {
                    StoreProvider.dispatch<AppState>(
                      context,
                      VerifyOTPAction(otp: enteredCode, context: context),
                    );
                  } else {
                    showFeedbackBottomSheet(
                      context: context,
                      modalContent: invalidCode,
                      imageAssetPath: errorIconUrl,
                    );
                  }
                },
                resendOTPFunction: () async {
                  StoreProvider.dispatch<AppState>(
                    context,
                    ResendOTPAction(context: context, phoneNumber: phoneNumber),
                  );
                },
              );
            },
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(PINInputField), findsOneWidget);
        await tester.tap(find.byType(PINInputField));
        await tester.pumpAndSettle();

        expect(find.byKey(resendOtpButtonKey), findsOneWidget);
        await tester.tap(find.byKey(resendOtpButtonKey));
        await tester.pump(const Duration(seconds: 60));

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

    testWidgets('should show a loading indicator when verifying an OTP',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'sendOTP': '123456',
              'sendRetryOTP': '123456',
            }
          }),
          201,
        ),
      );
      store.dispatch(
        UpdateOnboardingStateAction(
          canResendOTP: true,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: StoreConnector<AppState, VerifyPhoneViewModel>(
          converter: (Store<AppState> store) {
            return VerifyPhoneViewModel.fromStore(store.state);
          },
          builder: (BuildContext context, VerifyPhoneViewModel vm) {
            return VerifyPhoneWidget(
              vm: vm,
              sendOTPFunction: () async {
                StoreProvider.dispatch<AppState>(
                  context,
                  SendOTPAction(
                    context: context,
                    phoneNumber: phoneNumber,
                  ),
                );
              },
              canResendOTPFunction: () async {
                StoreProvider.dispatch<AppState>(
                  context,
                  UpdateOnboardingStateAction(canResendOTP: true),
                );
              },
              cantResendOTPFunction: () async {
                StoreProvider.dispatch<AppState>(
                  context,
                  UpdateOnboardingStateAction(canResendOTP: false),
                );
              },
              onDone: (String enteredCode) {
                if (enteredCode == vm.otp) {
                  StoreProvider.dispatch<AppState>(
                    context,
                    VerifyOTPAction(otp: enteredCode, context: context),
                  );
                } else {
                  showFeedbackBottomSheet(
                    context: context,
                    modalContent: invalidCode,
                    imageAssetPath: errorIconUrl,
                  );
                }
              },
              resendOTPFunction: () async {
                StoreProvider.dispatch<AppState>(
                  context,
                  ResendOTPAction(context: context, phoneNumber: phoneNumber),
                );
              },
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(PINInputField), findsOneWidget);

      await tester.tap(find.byType(PINInputField));
      await tester.pumpAndSettle();

      expect(find.byKey(resendOtpButtonKey), findsOneWidget);
      await store.dispatch(WaitAction<AppState>.add(resendOTPFlag));

      await tester.pump();

      expect(find.byKey(resendOtpButtonKey), findsNothing);
    });
  });
}
