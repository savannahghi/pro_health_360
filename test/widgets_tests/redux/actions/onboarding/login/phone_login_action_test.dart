// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/redux/actions/onboarding/phone_login_action.dart';
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_content_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_home_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_response.dart';
import 'package:myafyahub/presentation/home/pages/home_page.dart';
import '../../../../../mock_utils.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';
import '../../../../shared/services/onboarding_utils_2_test.mocks.dart';

void main() {
  // initial set up
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('PhoneLoginAction', () {
    late Store<AppState> store;

    final MockRefreshTokenManger refreshTimer = MockRefreshTokenManger();

    final DateTimeParser dateTimeParser = DateTimeParser(
      useCustomDateTime: true,
      customDateTime: DateTime.parse('2021-05-18'),
    );

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should dispatch action and catch pin_too_short error',
        (WidgetTester tester) async {
      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                try {
                  await store.dispatch(
                    PhoneLoginAction(
                      context: context,
                      flag: 'phone_login',
                      tokenManger: refreshTimer,
                      dateTimeParser: dateTimeParser,
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

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should dispatch action and catch error',
        (WidgetTester tester) async {
      const String errMsg = 'No user account found';

      when(baseGraphQlClientMock.parseError(<String, dynamic>{'error': errMsg}))
          .thenReturn(errMsg);

      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await StoreProvider.dispatch(
                  context,
                  PhoneLoginStateAction(
                    pinCode: '1234',
                    phoneNumber: '+254728101710',
                  ),
                );
                try {
                  await StoreProvider.dispatch(
                    context,
                    PhoneLoginAction(
                      context: context,
                      flag: 'phone_login',
                      tokenManger: refreshTimer,
                      dateTimeParser: dateTimeParser,
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

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets(
        'should navigate to home and update state if login request is '
        'successful and user is verified', (WidgetTester tester) async {
      const Size size = Size(640, 960);
      await tester.binding.setSurfaceSize(size);
      tester.binding.window.physicalSizeTestValue = size;
      tester.binding.window.devicePixelRatioTestValue = 1;

      final PhoneLoginResponse phoneLoginResponse =
          PhoneLoginResponse.fromJson(mockLoginResponse);

      when(refreshTimer.updateExpireTime(any)).thenReturn(refreshTimer);

      when(refreshTimer.reset()).thenReturn(null);

      store.dispatch(UpdateUserProfileAction(isPhoneVerified: true));

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
          hasSetNickName: true,
        ),
      );

      store.dispatch(
        UpdateHomeStateAction(
          canRecordMood: true,
        ),
      );
      store.dispatch(
        UpdateContentStateAction(contentItems: <Content>[mockContent]),
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                onPressed: () async {
                  await StoreProvider.dispatch(
                    context,
                    PhoneLoginStateAction(
                      pinCode: '1234',
                      phoneNumber: '+254728101710',
                    ),
                  );
                  await StoreProvider.dispatch(
                    context,
                    PhoneLoginAction(
                      context: context,
                      flag: 'phone_login',
                      tokenManger: refreshTimer,
                      dateTimeParser: dateTimeParser,
                    ),
                  );
                },
              );
            },
          ),
        );

        await tester.pump();
        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);

        expect(
          store.state.clientState?.user,
          phoneLoginResponse.clientState?.user,
        );

        final AuthCredentials? credentials = store.state.credentials;

        expect(credentials?.expiresIn, '3600');
        expect(credentials?.isSignedIn, true);
        expect(
          credentials?.refreshToken,
          phoneLoginResponse.credentials?.refreshToken,
        );

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });
    });
  });
}
