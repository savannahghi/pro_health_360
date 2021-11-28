// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/verify_phone_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/infrastructure/endpoints.dart';
import 'package:myafyahub/presentation/core/widgets/pin_input_field_widget.dart';
import 'package:myafyahub/presentation/onboarding/verify_phone/widgets/verify_otp_widget.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('VerifyOtpWidget', () {
    late Store<AppState> store;

    setUp(() {
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
            .verifyPhoneState!
            .call(otp: '123456', invalidOTP: false),
      );
    });

    testWidgets('should render resend otp button ',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        final MockGraphQlClient mockClient = MockGraphQlClient();

        final Response resendOtpResponse = Response(
          '123456',
          200,
        );

        when(
          baseGraphQlClientMock.callRESTAPI(
            endpoint: kTestRetryResendOtpEndpoint,
            method: httpPOST,
            variables: <String, dynamic>{
              'phoneNumber': '+254712345678',
              'flavour': Flavour.CONSUMER.name,
            },
          ),
        ).thenAnswer((_) async => Future<Response>.value(resendOtpResponse));

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockClient,
          widget: StoreConnector<AppState, VerifyPhoneViewModel>(
            converter: (Store<AppState> store) {
              return VerifyPhoneViewModel.fromStore(store);
            },
            builder: (BuildContext context, VerifyPhoneViewModel vm) {
              return VerifyOtpWidget(
                verifyPhoneViewModel: vm,
                loader: const CircularProgressIndicator(),
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

    testWidgets('should show a loading indicator when verifying an OTP',
        (WidgetTester tester) async {
      final MockGraphQlClient mockClient = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockClient,
        widget: StoreConnector<AppState, VerifyPhoneViewModel>(
          converter: (Store<AppState> store) {
            return VerifyPhoneViewModel.fromStore(store);
          },
          builder: (BuildContext context, VerifyPhoneViewModel vm) {
            return VerifyOtpWidget(
              verifyPhoneViewModel: vm,
              loader: const CircularProgressIndicator(),
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
