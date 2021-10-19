// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/edit_profile_page_behavior_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/profile/pages/edit_profile_page.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('EditProfilePage test', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = null;
      store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
            firstName: Name.withValue('Test'),
            lastName: Name.withValue('Name'),
            gender: Gender.male,
          ),
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
            primaryEmailAddress: EmailAddress.withValue('s@g.com'),
          ),
        ),
      );
    });
    testWidgets('EditProfilePage should render correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: EditProfilePage(),
      );

      await tester.pumpAndSettle();
      final Finder scrollViewWidget = find.byType(Form);
      expect(scrollViewWidget, findsOneWidget);

      final Finder formWidget = find.byType(Form);
      expect(formWidget, findsOneWidget);
    });

    testWidgets(
        'Validators should validate the form correctly and display Snackbar',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return EditProfilePage();
          },
        ),
      );

      await tester.pumpAndSettle();

      //firstName
      final Finder firstName = find.byWidgetPredicate(
        (Widget widget) =>
            widget is SILFormTextField && widget.key == editProfileFirstNameKey,
      );
      expect(firstName, findsOneWidget);
      await tester.tap(firstName);
      await tester.enterText(firstName, '');

      //lastName
      final Finder lastName = find.byWidgetPredicate(
        (Widget widget) =>
            widget is SILFormTextField && widget.key == editProfileLastNameKey,
      );
      expect(lastName, findsOneWidget);
      await tester.tap(lastName);
      await tester.enterText(lastName, '');

      await tester.tap(find.text('UNKNOWN').last);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(find.text('UNKNOWN'), findsWidgets);

      final SILPrimaryButton saveButton = find
          .widgetWithText(SILPrimaryButton, 'Save & Continue')
          .evaluate()
          .first
          .widget as SILPrimaryButton;
      saveButton.onPressed!();
    });

    testWidgets('Form should be editable', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return EditProfilePage();
          },
        ),
      );

      await tester.pumpAndSettle();
      final Finder scrollViewWidget = find.byType(Form);
      expect(scrollViewWidget, findsOneWidget);

      final Finder formWidget = find.byType(Form);
      expect(formWidget, findsOneWidget);

      //firstName
      final Finder firstName = find.byWidgetPredicate(
        (Widget widget) =>
            widget is SILFormTextField && widget.key == editProfileFirstNameKey,
      );
      expect(firstName, findsOneWidget);
      await tester.tap(firstName);
      await tester.enterText(firstName, testFirstName);

      //lastName
      final Finder lastName = find.byWidgetPredicate(
        (Widget widget) =>
            widget is SILFormTextField && widget.key == editProfileLastNameKey,
      );
      expect(lastName, findsOneWidget);
      await tester.tap(lastName);
      await tester.enterText(lastName, testLastName);

      //gender
      final Finder gender = find.text('MALE');
      expect(gender, findsOneWidget);
      await tester.tap(gender);
      await tester.pumpAndSettle();
      expect(find.text('FEMALE').last, findsOneWidget);
      await tester.tap(find.text('FEMALE').last);
      await tester.pumpAndSettle();

      // primary button

      expect(find.byKey(editProfileSaveKey), findsOneWidget);

      final SILPrimaryButton saveButton = find
          .widgetWithText(SILPrimaryButton, 'Save & Continue')
          .evaluate()
          .first
          .widget as SILPrimaryButton;
      saveButton.onPressed!();

      await tester.pump(const Duration(seconds: 1));

      await tester.pumpAndSettle();

      expect(find.byType(EditProfilePage), findsNothing);
    });

    testWidgets(
        'should render gender required FeedbackBottomSheet when Save button is pressed',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return EditProfilePage();
          },
        ),
      );

      await tester.pumpAndSettle();
      final Finder scrollViewWidget = find.byType(Form);
      expect(scrollViewWidget, findsOneWidget);

      final Finder formWidget = find.byType(Form);
      expect(formWidget, findsOneWidget);

      //firstName
      final Finder firstName = find.byWidgetPredicate(
        (Widget widget) =>
            widget is SILFormTextField && widget.key == editProfileFirstNameKey,
      );
      expect(firstName, findsOneWidget);
      await tester.tap(firstName);
      await tester.enterText(firstName, testFirstName);

      //lastName
      final Finder lastName = find.byWidgetPredicate(
        (Widget widget) =>
            widget is SILFormTextField && widget.key == editProfileLastNameKey,
      );
      expect(lastName, findsOneWidget);
      await tester.tap(lastName);
      await tester.enterText(lastName, testLastName);

      //gender
      final Finder gender = find.text('MALE');
      expect(gender, findsOneWidget);
      await tester.tap(gender);
      await tester.pumpAndSettle();
      expect(find.text('UNKNOWN').last, findsOneWidget);
      await tester.tap(find.text('UNKNOWN').last);
      await tester.pumpAndSettle();

      // primary button

      expect(find.byKey(editProfileSaveKey), findsOneWidget);

      final SILPrimaryButton saveButton = find
          .widgetWithText(SILPrimaryButton, 'Save & Continue')
          .evaluate()
          .first
          .widget as SILPrimaryButton;
      saveButton.onPressed!();

      await tester.pumpAndSettle();

      expect(find.byKey(feedbackBottomSheet), findsOneWidget);
    });

    testWidgets('should show loader', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      final EditProfilePageBehaviorObject editProfilePageBehaviorObject =
          EditProfilePageBehaviorObject();
      editProfilePageBehaviorObject.loading.add(true);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return EditProfilePage();
          },
        ),
      );

      final Finder loaderWidget = find.byType(SILPlatformLoader);
      expect(loaderWidget, findsOneWidget);
    });
  });
}
