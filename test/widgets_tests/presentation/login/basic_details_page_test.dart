// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/basic_details_page.dart';
import '../../../mock_utils.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';
import '../../../test_utils.dart';

void main() {
  group('Basic details page', () {
    final AppState state = AppState.initial();

    final Store<AppState> store = Store<AppState>(initialState: state);
    final StoreTester<AppState> storeTester = StoreTester<AppState>.from(store);

    // initial set up
    setupFirebaseAuthMocks();

    setUpAll(() async {
      await Firebase.initializeApp();
    });

    testWidgets('should test the basic details page widgets',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return BasicDetailsPage();
        }),
      );

      await tester.pump();
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      //gender option field
      final Finder genderFieldFinder = find.text(selectGender);
      final Finder genderErrorFinder = find.text(genderRequired);
      final Finder dobErrorFinder = find.text(dobRequired);
      final Finder buttonFinder = find.byKey(primaryButtonKey);

      // gender option field test

      await tester.tap(genderFieldFinder);
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButtonHideUnderline), findsOneWidget);

      // primary button test

      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      expect(genderErrorFinder, findsNothing);
      expect(dobErrorFinder, findsNothing);
    });

    testWidgets('first name form should be editable',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return BasicDetailsPage();
        }),
      );

      await tester.pump();

      //first name
      final Finder firstNameFormFinder = find.byWidgetPredicate(
          (Widget widget) =>
              widget is SILFormTextField && widget.key == firstNameKey);
      final Finder firstNameErrorFinder = find.text(firstNameRequiredString);

      // first name form test
      await tester.tap(firstNameFormFinder.first);
      await tester.enterText(firstNameFormFinder, 'John');
      await tester.pumpAndSettle();

      expect(firstNameErrorFinder, findsNothing);
    });

    testWidgets('last name form should be editable',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return BasicDetailsPage();
        }),
      );

      await tester.pump();

      //last name
      final Finder lastNameFormFinder = find.byWidgetPredicate(
          (Widget widget) =>
              widget is SILFormTextField && widget.key == lastNameKey);
      final Finder lastNameErrorFinder = find.text(firstNameRequiredString);

      // last name form test

      await tester.tap(lastNameFormFinder.first);
      await tester.enterText(lastNameFormFinder, 'David');
      await tester.pumpAndSettle();

      expect(lastNameErrorFinder, findsNothing);
    });

    testWidgets('first name can be validated correctly',
        (WidgetTester tester) async {
      OnboardingStrings? onBoardingStringClass;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            onBoardingStringClass = OnboardingStrings.of(context);
            return BasicDetailsPage();
          },
        ),
      );

      await tester.pump();

      //first name
      final Finder firstNameFormFinder = find.byWidgetPredicate(
          (Widget widget) =>
              widget is SILFormTextField && widget.key == firstNameKey);

      expect(firstNameFormFinder, findsWidgets);

      //primary button
      final SILPrimaryButton saveButton = find
          .widgetWithText(
              SILPrimaryButton, onBoardingStringClass!.saveContinueText())
          .evaluate()
          .first
          .widget as SILPrimaryButton;
      saveButton.onPressed!();

      await tester.pumpAndSettle();
      expect(find.text(onBoardingStringClass!.firstNameRequiredText()),
          findsOneWidget);
    });

    testWidgets('last name can be validated correctly',
        (WidgetTester tester) async {
      OnboardingStrings? onBoardingStringClass;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            onBoardingStringClass = OnboardingStrings.of(context);
            return BasicDetailsPage();
          },
        ),
      );

      await tester.pump();

      //last name
      final Finder lastNameFormFinder = find.byWidgetPredicate(
          (Widget widget) =>
              widget is SILFormTextField && widget.key == lastNameKey);

      expect(lastNameFormFinder, findsWidgets);

      //primary button
      final SILPrimaryButton saveButton = find
          .widgetWithText(
              SILPrimaryButton, onBoardingStringClass!.saveContinueText())
          .evaluate()
          .first
          .widget as SILPrimaryButton;
      saveButton.onPressed!();

      await tester.pumpAndSettle();
      expect(find.text(onBoardingStringClass!.lastNameRequiredText()),
          findsOneWidget);
    });

    testWidgets('gender can be validated correctly',
        (WidgetTester tester) async {
      OnboardingStrings? onBoardingStringClass;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            onBoardingStringClass = OnboardingStrings.of(context);
            return BasicDetailsPage();
          },
        ),
      );

      await tester.pump();

      //gender
      expect(find.text(genderHint), findsOneWidget);
      await tester.tap(find.text(genderHint));
      await tester.pumpAndSettle();
      await tester.tap(find.text('UNKNOWN').last);
      await tester.pumpAndSettle();

      //primary button
      final SILPrimaryButton saveButton = find
          .widgetWithText(
              SILPrimaryButton, onBoardingStringClass!.saveContinueText())
          .evaluate()
          .first
          .widget as SILPrimaryButton;
      saveButton.onPressed!();

      await tester.pumpAndSettle();

      expect(onBoardingStringClass!.phoneNumberExistsText(),
          'Sorry, a user with that phone number exists, please sign in to continue');

      expect(store.state.userProfileState!.userProfile!.userBioData!.gender,
          Gender.unknown);
    });

    testWidgets('date of birth can be validated correctly',
        (WidgetTester tester) async {
      OnboardingStrings? onBoardingStringClass;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            onBoardingStringClass = OnboardingStrings.of(context);
            return BasicDetailsPage();
          },
        ),
      );

      await tester.pump();

      //primary button
      final SILPrimaryButton saveButton = find
          .widgetWithText(
              SILPrimaryButton, onBoardingStringClass!.saveContinueText())
          .evaluate()
          .first
          .widget as SILPrimaryButton;
      saveButton.onPressed!();
      await tester.pumpAndSettle();

      expect(find.text(onBoardingStringClass!.dateOfBirthRequiredText()),
          findsOneWidget);
      expect(
          store.state.userProfileState!.userProfile!.userBioData!.dateOfBirth,
          UNKNOWN);
    });

    testWidgets(
        'Save button updates user profile when pressed and navigates to HomePage',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final DateFormat formatter = DateFormat('MM-dd');
      final String date = formatter.format(DateTime.now());
      storeTester.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
          ),
        ),
      );
      // updateUserProfile response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'loading': true}
        }),
        201,
      );

      queryWhenThenAnswer(
          queryString: updateUserProfileMutation,
          variables: <String, dynamic>{
            'input': <String, dynamic>{
              'firstName': testFirstName,
              'lastName': testLastName,
              'dateOfBirth': '2003-$date',
              'gender': 'female',
            }
          },
          response: response);

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock.parseError(<String, dynamic>{
        'data': <String, dynamic>{'loading': true}
      })).thenReturn(null);

      // getFeed mocked response
      final http.Response feedResponse = http.Response(
        json.encode(<String, dynamic>{
          'error': <String, dynamic>{'error': 'some error'}
        }),
        401,
      );

      queryWhenThenAnswer(
          queryString: getFeedQuery,
          variables: <String, dynamic>{
            'flavour': Flavour.CONSUMER.name,
            'persistent': 'BOTH',
            'visibility': 'SHOW',
            'isAnonymous': false,
            'status': null,
          },
          response: feedResponse);

      when(baseGraphQlClientMock.toMap(feedResponse))
          .thenReturn(json.decode(feedResponse.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock.parseError(<String, dynamic>{
        'error': <String, dynamic>{'error': 'some error'}
      })).thenReturn('null');

      await store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
              dateOfBirth: '3 May 2021',
              gender: Gender.female,
              firstName: Name.withValue(testFirstName),
              lastName: Name.withValue(testLastName)),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: BasicDetailsPage(),
      );

      await tester.pump();

      //finder
      final Finder firstNameFormFinder = find.byWidgetPredicate(
          (Widget widget) =>
              widget is SILFormTextField && widget.key == firstNameKey);
      final Finder lastNameFormFinder = find.byWidgetPredicate(
          (Widget widget) =>
              widget is SILFormTextField && widget.key == lastNameKey);
      final Finder genderFinder = find.text(genderHint);
      final Finder datePickerFinder =
          find.widgetWithText(GestureDetector, dateLabelText);

      expect(firstNameFormFinder, findsWidgets);
      expect(genderFinder, findsOneWidget);
      expect(lastNameFormFinder, findsWidgets);

      // first name form test
      await tester.tap(firstNameFormFinder.first);
      await tester.pumpAndSettle();
      await tester.showKeyboard(firstNameFormFinder);
      await tester.enterText(firstNameFormFinder, testFirstName);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // last name form test
      await tester.tap(lastNameFormFinder.first);
      await tester.pumpAndSettle();
      await tester.showKeyboard(lastNameFormFinder);
      await tester.enterText(lastNameFormFinder, testLastName);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // gender test
      await tester.tap(genderFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('UNKNOWN').last);
      await tester.pumpAndSettle();

      await tester.tap(genderFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('FEMALE').last);
      await tester.pumpAndSettle();

      // dob test

      await tester.tap(datePickerFinder);
      await tester.pumpAndSettle();
      await tester.enterText(datePickerFinder, DateTime.now().toString());
      await tester.tap(find.text('2003'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      //primary button test

      final SILPrimaryButton saveButton = find
          .widgetWithText(SILPrimaryButton, 'Save & Continue')
          .evaluate()
          .first
          .widget as SILPrimaryButton;
      saveButton.onPressed!();

      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should render gender required FeedbackBottomSheet when Save button is pressed',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final DateFormat formatter = DateFormat('MM-dd');
      final String date = formatter.format(DateTime.now());

      // updateUserProfile response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'loading': true}
        }),
        201,
      );

      queryWhenThenAnswer(
          queryString: updateUserProfileMutation,
          variables: <String, dynamic>{
            'input': <String, dynamic>{
              'firstName': testFirstName,
              'lastName': testLastName,
              'dateOfBirth': '2003-$date',
              'gender': 'female',
            }
          },
          response: response);

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock.parseError(<String, dynamic>{
        'data': <String, dynamic>{'loading': true}
      })).thenReturn(null);

      // getFeed mocked response
      final http.Response feedResponse = http.Response(
        json.encode(<String, dynamic>{
          'error': <String, dynamic>{'error': 'some error'}
        }),
        401,
      );

      queryWhenThenAnswer(
          queryString: getFeedQuery,
          variables: <String, dynamic>{
            'flavour': Flavour.CONSUMER.name,
            'persistent': 'BOTH',
            'visibility': 'SHOW',
            'isAnonymous': false,
            'status': null,
          },
          response: feedResponse);

      when(baseGraphQlClientMock.toMap(feedResponse))
          .thenReturn(json.decode(feedResponse.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock.parseError(<String, dynamic>{
        'error': <String, dynamic>{'error': 'some error'}
      })).thenReturn('null');

      await store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
              dateOfBirth: '3 May 2021',
              gender: Gender.female,
              firstName: Name.withValue(testFirstName),
              lastName: Name.withValue(testLastName)),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: BasicDetailsPage(),
      );

      await tester.pump();

      //finder
      final Finder firstNameFormFinder = find.byWidgetPredicate(
          (Widget widget) =>
              widget is SILFormTextField && widget.key == firstNameKey);
      final Finder lastNameFormFinder = find.byWidgetPredicate(
          (Widget widget) =>
              widget is SILFormTextField && widget.key == lastNameKey);
      final Finder genderFinder = find.text(genderHint);
      final Finder datePickerFinder =
          find.widgetWithText(GestureDetector, dateLabelText);

      expect(firstNameFormFinder, findsWidgets);
      expect(genderFinder, findsOneWidget);
      expect(lastNameFormFinder, findsWidgets);

      // first name form test
      await tester.tap(firstNameFormFinder.first);
      await tester.pumpAndSettle();
      await tester.showKeyboard(firstNameFormFinder);
      await tester.enterText(firstNameFormFinder, testFirstName);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // last name form test
      await tester.tap(lastNameFormFinder.first);
      await tester.pumpAndSettle();
      await tester.showKeyboard(lastNameFormFinder);
      await tester.enterText(lastNameFormFinder, testLastName);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // gender test
      await tester.tap(genderFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('UNKNOWN').last);
      await tester.pumpAndSettle();

      // dob test

      await tester.tap(datePickerFinder);
      await tester.pumpAndSettle();
      await tester.enterText(datePickerFinder, DateTime.now().toString());
      await tester.tap(find.text('2003'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      //primary button test

      final SILPrimaryButton saveButton = find
          .widgetWithText(SILPrimaryButton, 'Save & Continue')
          .evaluate()
          .first
          .widget as SILPrimaryButton;
      saveButton.onPressed!();

      await tester.pumpAndSettle();
      expect(find.byKey(feedbackBottomSheet), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should render SILPlatformLoader', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            toggleLoadingIndicator(
                context: context, flag: updateBasicDetailsFlag);
            return BasicDetailsPage();
          },
        ),
      );

      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
