import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/request_reset_pin_action.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/logout_button.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/pin_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';
import '../../../../../test_utils.dart';

void main() {
  group('PinVerification', () {
    late Store<AppState> store;
    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

    testWidgets('should render ErrorAlertBox on invalid PIN',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch<AppState>(
                context, UpdatePinStatusAction(invalidPin: true));
            return const PinVerification();
          },
        ),
      );
      await tester.pump();

      await store.dispatch(UpdatePinStatusAction(invalidPin: true));

      await tester.tap(find.byKey(pinInputKey));
      await tester.enterText(find.byKey(pinInputKey), '1234');
      await tester.pumpAndSettle();

      expect(find.byType(ErrorAlertBox), findsOneWidget);
    });
    testWidgets('should show loader after inputting the code',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPinCodeTextField(
              key: pinVerificationInputKey,
              autoFocus: true,
              maxLength: 4,
              pinBoxWidth: 45,
              pinBoxHeight: 52,
              wrapAlignment: WrapAlignment.spaceAround,
              onDone: (dynamic value) {
                StoreProvider.dispatch(
                    context,
                    UpdatePinStatusAction(
                        pin: value.toString(), invalidPin: false));
              },
              onTextChanged: (dynamic value) {
                StoreProvider.dispatch(
                    context,
                    UpdatePinStatusAction(
                        pin: value.toString(), invalidPin: false));
              },
            );
          },
        ),
      );

      await tester.pump();
      final Finder pinVerificationInput = find.byType(SILPinCodeTextField);
      await tester.tap(pinVerificationInput);
      await tester.enterText(pinVerificationInput, '1234');
      await tester.pumpAndSettle();
    });
    testWidgets('page can be filled and submitted successfully',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      when(baseGraphQlClientMock.query(sampleQuery, <String, dynamic>{}))
          .thenAnswer((_) => Future<http.Response>.value(
                http.Response(
                  json.encode(<String, dynamic>{
                    'msg': 'credentials submitted successfully'
                  }),
                  200,
                ),
              ));

      when(baseGraphQlClientMock.toMap(any)).thenReturn(
        <String, dynamic>{
          'data': <String, dynamic>{'resumeWithPIN': false}
        },
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const PinVerification(),
      );

      await tester.pump();

      final Finder logoutButton = find.byType(LogoutButton);
      expect(logoutButton, findsOneWidget);
      final Finder pinResetButton = find.byKey(pinResetKey);
      expect(pinResetButton, findsOneWidget);
    });
    testWidgets('page can navigate to reset page successfully',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await StoreProvider.dispatch<AppState>(context,
                    RequestResetPinAction(context: context, flag: 'flag'));
              },
            );
          }));
      // verify(mockObserver.didPush(sampleRoute, any));
      await tester.pumpAndSettle();
    });

    testWidgets('should resume with pin', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch<AppState>(
              context,
              UpdateUserProfileAction(
                userBioData: BioData(
                    dateOfBirth: '12-12-12',
                    firstName: Name.withValue('Test'),
                    lastName: Name.withValue('Coverage'),
                    gender: Gender.male),
                profile: UserProfile(
                  primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
                ),
              ),
            );
            return const PinVerification();
          },
        ),
      );

      await tester.pump();

      await tester.pumpAndSettle();
      expect(find.byType(TextFormField), findsOneWidget);
      await tester.tap(find.byType(TextFormField));
      await tester.enterText(find.byType(TextFormField), '1234');
      await tester.pumpAndSettle();
      expect(find.byType(SILPlatformLoader), findsNothing);
      expect(find.byKey(phoneLoginSubmitButtonKey), findsOneWidget);

      await tester.tap(find.byKey(phoneLoginSubmitButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('should reset pin', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      when(baseGraphQlClientMock.callRESTAPI(
              endpoint:
                  'https://onboarding-testing.savannahghi.org/request_pin_reset',
              variables: <String, String>{'phoneNumber': '0710000000'},
              method: 'POST'))
          .thenAnswer(
        (_) => Future<http.Response>.value(
          http.Response(
            json.encode(resetPINMock()),
            200,
          ),
        ),
      );

      when(baseGraphQlClientMock.toMap(any)).thenReturn(resetPINMock());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject().contexts.add(testAppContexts);

            StoreProvider.dispatch<AppState>(
              context,
              UpdateUserProfileAction(
                profile: UserProfile(
                  primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
                ),
              ),
            );

            StoreProvider.dispatch<AppState>(
                context, UpdatePinStatusAction(forgotPIN: true));

            return const PinVerification();
          },
        ),
      );

      await tester.pump();

      expect(find.byKey(pinResetKey), findsOneWidget);
      await tester.tap(find.byKey(pinResetKey));

      // verify(mockObserver.didPush(sampleRoute, any));
    });

    testWidgets('changing PIN back button should navigate when pressed',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      store.dispatch(UpdatePinStatusAction(isChangingPin: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch<AppState>(
                context, UpdatePinStatusAction(isChangingPin: true));
            return const PinVerification();
          },
        ),
      );
      await tester.pump();

      expect(find.byKey(searchBackButtonKey), findsOneWidget);
      await tester.tap(find.byKey(searchBackButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(PinVerification), findsNothing);
    });

    testWidgets('should render SILPlatformLoader', (WidgetTester tester) async {
      BuildContext? ctx;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            ctx = context;
            toggleLoadingIndicator(context: context, flag: 'resume_with_pin');
            return const PinVerification();
          },
        ),
      );

      await tester.pumpAndSettle();
      toggleLoadingIndicator(context: ctx!, flag: 'resume_with_pin');
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
