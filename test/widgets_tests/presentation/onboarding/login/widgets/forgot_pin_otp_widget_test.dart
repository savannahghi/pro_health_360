import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:async_redux/async_redux.dart';

import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/forgot_pin_otp_widget.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:shared_ui_components/buttons.dart';

import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';
import '../../../../../test_utils.dart';

void main() {
  group('Forgot pin page', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
            firstName: Name.withValue('Test'),
            lastName: Name.withValue('Name'),
          ),
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
            primaryEmailAddress: EmailAddress.withValue('s@g.com'),
          ),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch(context,
                UpdatePinStatusAction(invalidPin: false, recoveryOtp: testOTP));
            EndPointsContextSubject().contexts.add(testAppContexts);
            return ForgotPinOtpWidget();
          },
        ),
      );

      await tester.pump();

      final Finder imageWidget = find.byType(SvgPicture);
      expect(imageWidget, findsOneWidget);
      final Finder silPinCodeTextField = find.byType(SILPinCodeTextField);
      expect(silPinCodeTextField, findsOneWidget);
    });

    testWidgets('VerifyPhoneOtp successCallBack works correctly',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
            firstName: Name.withValue(testFirstName),
            lastName: Name.withValue(testLastName),
          ),
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            primaryEmailAddress: EmailAddress.withValue(testEmail),
          ),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch(context,
                UpdatePinStatusAction(invalidPin: false, recoveryOtp: testOTP));
            EndPointsContextSubject().contexts.add(testAppContexts);
            return ForgotPinOtpWidget();
          },
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(SILPinCodeTextField), findsOneWidget);

      final Finder resendOtpFinder = find.text(' Send the code again ');
      expect(resendOtpFinder, findsOneWidget);
      await tester.tap(resendOtpFinder);
      await tester.pumpAndSettle();

      final Finder resendRadioFinder = find.text('via Text Message');
      expect(resendRadioFinder, findsOneWidget);
      await tester.tap(resendRadioFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(SILPinCodeTextField), testOTP);
      await tester.pumpAndSettle(const Duration(seconds: 10));
    });

    testWidgets('should navigate back', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
            firstName: Name.withValue(testFirstName),
            lastName: Name.withValue(testLastName),
          ),
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            primaryEmailAddress: EmailAddress.withValue(testEmail),
          ),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch(context,
                UpdatePinStatusAction(invalidPin: false, recoveryOtp: testOTP));
            EndPointsContextSubject().contexts.add(testAppContexts);
            return ForgotPinOtpWidget();
          },
        ),
      );

      await tester.pump();

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(SILPinCodeTextField), findsOneWidget);

      await tester.tap(find.byType(SILNoBorderButton));
      await tester.pumpAndSettle();
      expect(find.byType(ForgotPinOtpWidget), findsNothing);
    });

    testWidgets('should render ErrorAlertBox when PIN is invalid',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
            firstName: Name.withValue(testFirstName),
            lastName: Name.withValue(testLastName),
          ),
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            primaryEmailAddress: EmailAddress.withValue(testEmail),
          ),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch(context,
                UpdatePinStatusAction(invalidPin: true, recoveryOtp: testOTP));
            EndPointsContextSubject().contexts.add(testAppContexts);
            return ForgotPinOtpWidget();
          },
        ),
      );

      await tester.pump();

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(SILPinCodeTextField), findsOneWidget);
      expect(find.byType(ErrorAlertBox), findsOneWidget);
    });

    testWidgets('should render SILPlatformLoader', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
            firstName: Name.withValue(testFirstName),
            lastName: Name.withValue(testLastName),
          ),
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            primaryEmailAddress: EmailAddress.withValue(testEmail),
          ),
        ),
      );

      const String flag = 'forgot_pin_otp_widget';

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            toggleLoadingIndicator(context: context, flag: flag);
            StoreProvider.dispatch(context,
                UpdatePinStatusAction(invalidPin: false, recoveryOtp: testOTP));
            EndPointsContextSubject().contexts.add(testAppContexts);

            return ForgotPinOtpWidget();
          },
        ),
      );

      await tester.pump();

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(SILPinCodeTextField), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
