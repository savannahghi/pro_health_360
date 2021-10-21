// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/redux/actions/update_bio_data_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/entities/login/basic_details_model.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/basic_details_page.dart';
import '../../../../../mock_image_http_client.dart';
import '../../../../../mock_utils.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';
import '../../../../../test_utils.dart';

void main() {
  group('UpdateBioDataAction', () {
    late Store<AppState> store;
    // initial set up
    setupFirebaseAuthMocks();

    setUpAll(() async {
      await Firebase.initializeApp();
    });

    setUp(
      () {
        final String dir = Directory.current.path;
        store = Store<AppState>(initialState: AppState.initial());
        HttpOverrides.global = TestHttpOverrides();
        store.dispatch(
          UpdateUserProfileAction(
            profile: UserProfile(
              photoUploadID: '$dir/test/tests_resources/test_file.png',
            ),
          ),
        );
      },
    );
    testWidgets('should dispatch action correctly',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      final UserBasicDetails userBasicDetails = UserBasicDetails();
      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
          ),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject()
                .contexts
                .add(<AppContext>[AppContext.BewellCONSUMER]);
            userBasicDetails.firstName.add(Name.withValue(testFirstName));
            userBasicDetails.lastName.add(Name.withValue(testLastName));
            userBasicDetails.gender.add(Gender.male);
            userBasicDetails.dateOfBirth.add('3 May 2021');

            return SILPrimaryButton(
              onPressed: () async => store.dispatch(
                UpdateBioDataAction(
                  flag: updateBasicDetailsFlag,
                  context: context,
                  userBasicDetails: userBasicDetails,
                ),
              ),
            );
          },
        ),
      );
      try {
        await tester.pumpAndSettle();
        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();
        expect(
          store.state.userProfileState!.userProfile!.userBioData!.gender,
          Gender.male,
        );
      } catch (e) {
        expect(e, isA<TypeError>());
      }
    });

    testWidgets('should have an account already created',
        (WidgetTester tester) async {
      final UserBasicDetails userBasicDetails = UserBasicDetails();
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
          ),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject()
                .contexts
                .add(<AppContext>[AppContext.BewellCONSUMER]);
            userBasicDetails.firstName.add(Name.withValue(testFirstName));
            userBasicDetails.lastName.add(Name.withValue(testLastName));
            userBasicDetails.gender.add(Gender.unknown);
            userBasicDetails.dateOfBirth.add('3 May 2021');
            StoreProvider.dispatch(
              context,
              PhoneSignUpStateAction(accountCreated: true),
            );

            return SILPrimaryButton(
              onPressed: () async => StoreProvider.dispatch(
                context,
                UpdateBioDataAction(
                  flag: updateBasicDetailsFlag,
                  context: context,
                  userBasicDetails: userBasicDetails,
                ),
              ),
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump(const Duration(seconds: 60));
      await tester.pumpAndSettle();
      expect(
        store.state.userProfileState!.userProfile!.userBioData!.firstName!
            .getValue(),
        testFirstName,
      );
    });

    testWidgets(
        'should return state an account not created and navigate to HomePage',
        (WidgetTester tester) async {
      final UserBasicDetails userBasicDetails = UserBasicDetails();
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
          ),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject()
                .contexts
                .add(<AppContext>[AppContext.BewellCONSUMER]);
            userBasicDetails.firstName.add(Name.withValue(testFirstName));
            userBasicDetails.lastName.add(Name.withValue(testLastName));
            userBasicDetails.gender.add(Gender.unknown);
            userBasicDetails.dateOfBirth.add('3 May 2021');
            StoreProvider.dispatch(
              context,
              PhoneSignUpStateAction(accountCreated: false),
            );

            return SILPrimaryButton(
              onPressed: () async => StoreProvider.dispatch(
                context,
                UpdateBioDataAction(
                  flag: updateBasicDetailsFlag,
                  context: context,
                  userBasicDetails: userBasicDetails,
                ),
              ),
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(store.state.miscState?.phoneSignUp!.accountCreated, false);
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets(
        'should return state an account not created and navigate to BasicDetailsPage',
        (WidgetTester tester) async {
      final UserBasicDetails userBasicDetails = UserBasicDetails();
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject()
                .contexts
                .add(<AppContext>[AppContext.BewellCONSUMER]);

            userBasicDetails.firstName.add(Name.withValue(UNKNOWN));
            userBasicDetails.lastName.add(Name.withValue(UNKNOWN));
            userBasicDetails.gender.add(Gender.unknown);
            userBasicDetails.dateOfBirth.add('3 May 2021');

            StoreProvider.dispatch(
              context,
              PhoneSignUpStateAction(accountCreated: false),
            );

            return SILPrimaryButton(
              onPressed: () async => StoreProvider.dispatch(
                context,
                UpdateBioDataAction(
                  flag: updateBasicDetailsFlag,
                  context: context,
                  userBasicDetails: userBasicDetails,
                ),
              ),
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(store.state.miscState?.phoneSignUp!.accountCreated, false);
      expect(find.byType(BasicDetailsPage), findsOneWidget);
    });

    testWidgets('should test getUserProfileVariables routine works',
        (WidgetTester tester) async {
      final UserBasicDetails userBasicDetails = UserBasicDetails();
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      Map<String, dynamic>? actualUserProfileInfo;
      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
          ),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject()
                .contexts
                .add(<AppContext>[AppContext.BewellCONSUMER]);
            userBasicDetails.firstName.add(Name.withValue(testFirstName));
            userBasicDetails.lastName.add(Name.withValue(testLastName));
            userBasicDetails.gender.add(Gender.unknown);
            userBasicDetails.dateOfBirth.add('3 May 2021');
            StoreProvider.dispatch(
              context,
              PhoneSignUpStateAction(accountCreated: true),
            );
            actualUserProfileInfo = userBasicDetails.getUserProfileVariables();
            return SILPrimaryButton(
              onPressed: () async => StoreProvider.dispatch(
                context,
                UpdateBioDataAction(
                  flag: updateBasicDetailsFlag,
                  context: context,
                  userBasicDetails: userBasicDetails,
                ),
              ),
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump(const Duration(seconds: 60));
      await tester.pumpAndSettle();
      final Map<String, String> expectedUserProfileInfo = <String, String>{
        'firstName': testFirstName,
        'lastName': testLastName,
        'dateOfBirth': '2021-05-03',
        'gender': 'unknown',
      };
      expect(actualUserProfileInfo, expectedUserProfileInfo);
    });

    testWidgets('should dispatch action and catch error when body is null',
        (WidgetTester tester) async {
      final UserBasicDetails userBasicDetails = UserBasicDetails();

      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'statusCode': 408}),
        500,
      );

      queryWhenThenAnswer(
        queryString: updateUserProfileMutation,
        variables: <String, dynamic>{
          'input': <String, dynamic>{
            'firstName': testFirstName,
            'lastName': testLastName,
            'dateOfBirth': '1996-01-11',
            'gender': 'unknown',
          }
        },
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(
        baseGraphQlClientMock
            .parseError(json.decode(response.body) as Map<String, dynamic>),
      ).thenReturn(null);

      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject()
                .contexts
                .add(<AppContext>[AppContext.BewellCONSUMER]);
            userBasicDetails.firstName.add(Name.withValue(testFirstName));
            userBasicDetails.lastName.add(Name.withValue(testLastName));
            userBasicDetails.gender.add(Gender.unknown);
            userBasicDetails.dateOfBirth.add('11 Jan 1996');
            StoreProvider.dispatch(
              context,
              PhoneSignUpStateAction(accountCreated: true),
            );

            return SILPrimaryButton(
              onPressed: () async {
                try {
                  await store.dispatch(
                    UpdateBioDataAction(
                      flag: updateBasicDetailsFlag,
                      context: context,
                      userBasicDetails: userBasicDetails,
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

      await tester.pumpAndSettle();

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should dispatch action and catch error when error is null',
        (WidgetTester tester) async {
      final UserBasicDetails userBasicDetails = UserBasicDetails();

      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'statusCode': 408}),
        500,
      );

      queryWhenThenAnswer(
        queryString: updateUserProfileMutation,
        variables: <String, dynamic>{
          'input': <String, dynamic>{
            'firstName': testFirstName,
            'lastName': testLastName,
            'dateOfBirth': '1996-01-11',
            'gender': 'unknown',
          }
        },
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(
        baseGraphQlClientMock
            .parseError(json.decode(response.body) as Map<String, dynamic>),
      ).thenReturn('Some error');

      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject()
                .contexts
                .add(<AppContext>[AppContext.BewellCONSUMER]);
            userBasicDetails.firstName.add(Name.withValue(testFirstName));
            userBasicDetails.lastName.add(Name.withValue(testLastName));
            userBasicDetails.gender.add(Gender.unknown);
            userBasicDetails.dateOfBirth.add('11 Jan 1996');
            StoreProvider.dispatch(
              context,
              PhoneSignUpStateAction(accountCreated: true),
            );

            return SILPrimaryButton(
              onPressed: () async {
                try {
                  await store.dispatch(
                    UpdateBioDataAction(
                      flag: updateBasicDetailsFlag,
                      context: context,
                      userBasicDetails: userBasicDetails,
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

      await tester.pumpAndSettle();

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should throw error on parseError',
        (WidgetTester tester) async {
      final UserBasicDetails userBasicDetails = UserBasicDetails();

      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'data': null}),
        200,
      );

      queryWhenThenAnswer(
        queryString: updateUserProfileMutation,
        variables: <String, dynamic>{
          'input': <String, dynamic>{
            'firstName': testFirstName,
            'lastName': testLastName,
            'dateOfBirth': '1996-01-11',
            'gender': 'unknown',
          }
        },
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(
        baseGraphQlClientMock
            .parseError(json.decode(response.body) as Map<String, dynamic>),
      ).thenReturn('Some error');

      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject()
                .contexts
                .add(<AppContext>[AppContext.BewellCONSUMER]);
            userBasicDetails.firstName.add(Name.withValue(testFirstName));
            userBasicDetails.lastName.add(Name.withValue(testLastName));
            userBasicDetails.gender.add(Gender.unknown);
            userBasicDetails.dateOfBirth.add('11 Jan 1996');
            StoreProvider.dispatch(
              context,
              PhoneSignUpStateAction(accountCreated: true),
            );

            return SILPrimaryButton(
              onPressed: () async {
                try {
                  await store.dispatch(
                    UpdateBioDataAction(
                      flag: updateBasicDetailsFlag,
                      context: context,
                      userBasicDetails: userBasicDetails,
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

      await tester.pumpAndSettle();

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should throw error on data in null',
        (WidgetTester tester) async {
      final UserBasicDetails userBasicDetails = UserBasicDetails();

      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'data': null}),
        200,
      );

      queryWhenThenAnswer(
        queryString: updateUserProfileMutation,
        variables: <String, dynamic>{
          'input': <String, dynamic>{
            'firstName': testFirstName,
            'lastName': testLastName,
            'dateOfBirth': '1996-01-11',
            'gender': 'unknown',
          }
        },
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(
        baseGraphQlClientMock
            .parseError(json.decode(response.body) as Map<String, dynamic>),
      ).thenReturn(null);

      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject()
                .contexts
                .add(<AppContext>[AppContext.BewellCONSUMER]);
            userBasicDetails.firstName.add(Name.withValue(testFirstName));
            userBasicDetails.lastName.add(Name.withValue(testLastName));
            userBasicDetails.gender.add(Gender.unknown);
            userBasicDetails.dateOfBirth.add('11 Jan 1996');
            StoreProvider.dispatch(
              context,
              PhoneSignUpStateAction(accountCreated: true),
            );

            return SILPrimaryButton(
              onPressed: () async {
                try {
                  await store.dispatch(
                    UpdateBioDataAction(
                      flag: updateBasicDetailsFlag,
                      context: context,
                      userBasicDetails: userBasicDetails,
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

      await tester.pumpAndSettle();

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });
  });
}
