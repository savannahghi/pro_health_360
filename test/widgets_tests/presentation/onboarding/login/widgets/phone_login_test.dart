// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:myafyahub/presentation/core/widgets/inputs/my_afya_hub_phone_input_field.dart';
import 'package:afya_moja_core/buttons.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/my_afya_hub_phone_login_page.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../mock_utils.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';
import '../../../../../test_utils.dart';

void main() {
  group('Phone Login Page', () {
    // initial set up
    setupFirebaseAuthMocks();

    setUpAll(() async {
      await Firebase.initializeApp();
    });

    late Store<AppState> store;
    final MockShortGraphQlClient mockShortGraphQlClient =
        MockShortGraphQlClient();
    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
        'should not show an error alert box since state is reset upon mounting PhoneLogin',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch(
              context,
              PhoneLoginStateAction(),
            );
            return Scaffold(
              body: AppWrapper(
                appName: 'test',
                appContexts: testAppContexts,
                graphQLClient: mockShortGraphQlClient,
                child: MyAfyaHubPhoneLoginPage(),
              ),
            );
          },
        ),
      );

      await tester.pump();

      final Finder phoneInput = find.byType(CustomTextField);

      expect(find.byType(Form), findsOneWidget);
      expect(phoneInput, findsOneWidget);

      // check that the error box is shown
      expect(find.byKey(errorAlertBoxKey), findsNothing);
    });

    testWidgets(
      'form displays invalid credentials banner if invalidCredentials is true',
      (WidgetTester tester) async {
        EndPointsContextSubject().contexts.add(testAppContexts);

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(builder: (BuildContext context) {
            store.dispatch(
              PhoneSignUpStateAction(
                invalidCredentials: true,
              ),
            );

            return MyAfyaHubPhoneLoginPage();
          }),
        );

        await tester.pump();

        final Finder phoneInput = find.byType(MyAfyaHubPhoneInput);
        final Finder pinInput = find
            .byWidgetPredicate((Widget widget) => widget.key == pinInputKey);

        expect(find.byType(Form), findsOneWidget);
        expect(phoneInput, findsOneWidget);
        expect(pinInput, findsOneWidget);

        await tester.tap(phoneInput);
        await tester.enterText(phoneInput, testPhoneNumber);

        await tester.tap(pinInput);
        await tester.enterText(pinInput, '123');

        expect(store.state.miscState!.phoneSignUp!.invalidCredentials, true);
        expect(find.byType(ErrorAlertBox), findsOneWidget);
      },
    );

    testWidgets(
      'form can be filled and submitted correctly',
      (WidgetTester tester) async {
        when(baseGraphQlClientMock.callRESTAPI(
                endpoint:
                    'https://onboarding-testing.savannahghi.org/login_by_phone',
                variables: <String, dynamic>{
                  'phoneNumber': '+254710000000',
                  'pin': '1234',
                  'flavour': 'CONSUMER',
                  'appVersion': APPVERSION,
                },
                method: httpPOST))
            .thenAnswer(
          (_) => Future<http.Response>.value(
            http.Response(
              json.encode(createUserMock()),
              200,
            ),
          ),
        );

        when(baseGraphQlClientMock.toMap(any)).thenReturn(
          <String, dynamic>{
            'data': <String, dynamic>{
              'phoneNumber': '+254710000000',
              'pin': '1234',
              'flavour': 'CONSUMER'
            }
          },
        );
        await buildTestWidget(
            tester: tester,
            store: store,
            client: baseGraphQlClientMock,
            widget: Builder(builder: (BuildContext context) {
              EndPointsContextSubject().contexts.add(testAppContexts);
              return MyAfyaHubPhoneLoginPage();
            }));
        await tester.pumpAndSettle();

        final Finder phoneInput = find.byType(MyAfyaHubPhoneInput);
        final Finder submitButton = find.byKey(phoneLoginContinueButtonKey);

        expect(find.byType(Form), findsOneWidget);
        expect(phoneInput, findsOneWidget);
        expect(submitButton, findsOneWidget);

        await tester.enterText(phoneInput, testPhoneNumber);
        await tester.pumpAndSettle();

        await tester.enterText(find.byKey(pinInputKey), testOTP);
        await tester.pumpAndSettle();

        expect(find.text(testPhoneNumber), findsOneWidget);

        await tester.tap(submitButton);
        await tester.pumpAndSettle();
      },
    );
  });
  group('Phone Login', () {
    // initial set up
    setupFirebaseAuthMocks();

    setUpAll(() async {
      await Firebase.initializeApp();
    });

    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
      'should login user',
      (WidgetTester tester) async {
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        tester.binding.window.physicalSizeTestValue = tabletLandscape;
        final http.Response response = http.Response(
          json.encode(createUserMock()),
          200,
        );
        when(baseGraphQlClientMock.callRESTAPI(
                endpoint:
                    'https://onboarding-testing.savannahghi.org/login_by_phone',
                variables: <String, dynamic>{
                  'phoneNumber': '+254710000000',
                  'pin': '1234',
                  'flavour': 'CONSUMER',
                  'appVersion': APPVERSION,
                },
                method: 'POST'))
            .thenAnswer(
          (_) => Future<http.Response>.value(response),
        );

        when(baseGraphQlClientMock.toMap(any)).thenReturn(
          <String, dynamic>{
            'data': <String, dynamic>{
              'phoneNumber': '+254710000000',
              'pin': '1234',
              'flavour': 'CONSUMER'
            }
          },
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              EndPointsContextSubject().contexts.add(testAppContexts);

              return MyAfyaHubPhoneLoginPage();
            },
          ),
        );

        await tester.pump();

        expect(find.byType(MyAfyaHubPhoneInput), findsOneWidget);
        await tester.tap(find.byType(MyAfyaHubPhoneInput));
        await tester.enterText(
            find.byType(MyAfyaHubPhoneInput), testPhoneNumber);

        final Finder finder = find
            .byWidgetPredicate((Widget widget) => widget.key == pinInputKey);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.enterText(finder, testPin);

        final Finder completeButton = find.byType(MyAfyaHubPrimaryButton);

        expect(completeButton, findsOneWidget);
        await tester.ensureVisible(completeButton);
        await tester.tap(completeButton);

        await tester.pump(const Duration(minutes: 35));

        // verify(mockObserver.didPush(sampleRoute, any));
        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      },
    );

    testWidgets('should show no internet snackbar',
        (WidgetTester tester) async {
      InternetConnectivitySubject().connectivitySubject.add(false);
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject().contexts.add(testAppContexts);

            return MyAfyaHubPhoneLoginPage();
          },
        ),
      );

      final Finder logInButton = find.byType(MyAfyaHubPrimaryButton);

      tester.ensureVisible(logInButton);
      expect(logInButton, findsOneWidget);
      await tester.tap(logInButton);

      await tester.pump(const Duration(minutes: 35));
      expect(find.text(noInternetConnection), findsOneWidget);
    });

    testWidgets(
      'should  update invalid credentials state',
      (WidgetTester tester) async {
        await buildTestWidget(
            tester: tester,
            store: store,
            client: baseGraphQlClientMock,
            widget: Builder(
              builder: (BuildContext context) {
                EndPointsContextSubject().contexts.add(testAppContexts);

                StoreProvider.dispatch(
                  context,
                  PhoneLoginStateAction(invalidCredentials: true),
                );

                return MyAfyaHubPhoneLoginPage();
              },
            ));

        await tester.pump();

        final Finder finder = find
            .byWidgetPredicate((Widget widget) => widget.key == pinInputKey);

        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.enterText(finder, testPin);

        expect(store.state.miscState!.phoneLogin!.invalidCredentials, false);
      },
    );

    testWidgets(
      'should show loader',
      (WidgetTester tester) async {
        const String flag = 'phone_login';

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              toggleLoadingIndicator(context: context, flag: flag);

              EndPointsContextSubject().contexts.add(testAppContexts);

              return MyAfyaHubPhoneLoginPage();
            },
          ),
        );

        await tester.pump();

        expect(find.byType(SILPlatformLoader), findsNothing);
      },
    );
  });

//   testWidgets(
//     'should requestMessagingPerm for iOS',
//     (WidgetTester tester) async {
//       final Store<AppState> store =
//           Store<AppState>(initialState: AppState.initial());
//       debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

//       when(baseGraphQlClientMock.callRESTAPI(
//               endpoint:
//                   'https://onboarding-testing.savannahghi.org/login_by_phone',
//               variables: <String, dynamic>{
//                 'phoneNumber': '+254710000000',
//                 'pin': '1234',
//                 'flavour': 'CONSUMER',
//                 'appVersion': APPVERSION,
//               },
//               method: httpPOST))
//           .thenAnswer(
//         (_) => Future<http.Response>.value(
//           http.Response(
//             json.encode(createUserMock()),
//             200,
//           ),
//         ),
//       );

//       when(baseGraphQlClientMock.toMap(any)).thenReturn(
//         <String, dynamic>{
//           'data': <String, dynamic>{
//             'phoneNumber': '+254710000000',
//             'pin': '1234',
//             'flavour': 'CONSUMER'
//           }
//         },
//       );
//       await buildTestWidget(
//           tester: tester,
//           store: store,
//           client: baseGraphQlClientMock,
//           widget: Builder(builder: (BuildContext context) {
//             EndPointsContextSubject().contexts.add(testAppContexts);
//             return MyAfyaHubPhoneLoginPage();
//           }));
//       await tester.pumpAndSettle();

//       final Finder phoneInput = find.byType(MyAfyaHubPhoneInput);
//       final Finder submitButton = find.byKey(phoneLoginSubmitButtonKey);

//       expect(find.byType(Form), findsOneWidget);
//       expect(phoneInput, findsOneWidget);
//       expect(submitButton, findsOneWidget);

//       await tester.enterText(phoneInput, testPhoneNumber);
//       await tester.pumpAndSettle();

//       await tester.enterText(find.byKey(pinInputKey), testOTP);
//       await tester.pumpAndSettle();

//       expect(find.text(testPhoneNumber), findsOneWidget);

//       await tester.tap(submitButton);
//       await tester.pumpAndSettle();
//       await tester.pumpAndSettle();

//       debugDefaultTargetPlatformOverride = null;
//     },
//   );
}
