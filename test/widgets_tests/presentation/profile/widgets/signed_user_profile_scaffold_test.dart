// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_profile/term_and_conditions.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/resume_with_pin_page.dart';
import 'package:myafyahub/presentation/profile/pages/contact_details.dart';
import 'package:myafyahub/presentation/profile/widgets/profile_item_builder.dart';
import 'package:myafyahub/presentation/profile/widgets/signed_user_profile_scaffold.dart';
import '../../../../mock_image_httpclient.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('SignedUserProfileScaffold', () {
    late Store<AppState> store;
    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = BWTestHttpOverrides();
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

    group('on Tablet', () {
      testWidgets('should render widgets correctly',
          (WidgetTester tester) async {
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        tester.binding.window.physicalSizeTestValue = tabletPortrait;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const SignedUserProfileScaffold(),
        );

        await tester.pumpAndSettle();

        expect(find.byKey(profileMasterDetailRowKey), findsWidgets);
        expect(find.byType(ProfileMasterDetail), findsOneWidget);
        expect(find.byType(ProfileDetail), findsOneWidget);
        expect(find.byType(ProfileItemBuilder), findsWidgets);

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });

      testWidgets(
          'should render ProfileDetail correctly when ProfileItem [Account Section] is tapped',
          (WidgetTester tester) async {
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        tester.binding.window.physicalSizeTestValue = tabletLandscape;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const SignedUserProfileScaffold(),
        );

        await tester.pumpAndSettle();

        expect(find.byKey(profileMasterDetailRowKey), findsOneWidget);
        expect(find.byType(ProfileMasterDetail), findsOneWidget);
        expect(find.byType(ProfileDetail), findsOneWidget);
        expect(find.byType(ProfileItemBuilder), findsWidgets);

        await tester.tap(find.text(contactInfo).first);
        await tester.pumpAndSettle();

        expect(find.byType(BuildContactProvider), findsOneWidget);

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });

      testWidgets(
          'should render ProfileDetail correctly when ProfileItem '
          '[Legal Section] is tapped', (WidgetTester tester) async {
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        tester.binding.window.physicalSizeTestValue = tabletLandscape;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const SignedUserProfileScaffold(),
        );

        await tester.pumpAndSettle();

        expect(find.byKey(profileMasterDetailRowKey), findsOneWidget);
        expect(find.byType(ProfileMasterDetail), findsOneWidget);
        expect(find.byType(ProfileDetail), findsOneWidget);
        expect(find.byType(ProfileItemBuilder), findsWidgets);

        await tester.tap(find.text(termsOfServiceSettings).first);
        await tester.pumpAndSettle();

        expect(find.byType(TermsAndConditionsPage), findsOneWidget);

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });

      testWidgets('should navigate when Change PIN is tapped',
          (WidgetTester tester) async {
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        tester.binding.window.physicalSizeTestValue = tabletLandscape;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const SignedUserProfileScaffold(),
        );

        await tester.pumpAndSettle();

        expect(find.byKey(profileMasterDetailRowKey), findsOneWidget);
        expect(find.byType(ProfileMasterDetail), findsOneWidget);
        expect(find.byType(ProfileDetail), findsOneWidget);
        expect(find.byType(ProfileItemBuilder), findsWidgets);

        await tester.tap(find.text(changePINSettings).first);
        await tester.pumpAndSettle();

        expect(find.byType(ResumeWithPinPage), findsOneWidget);

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });
    });
    group('on Mobile', () {
      testWidgets(
          'should navigate when ProfileItem [Account Section] is tapped',
          (WidgetTester tester) async {
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        tester.binding.window.physicalSizeTestValue =
            typicalPhoneScreenSizePortrait;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const SignedUserProfileScaffold(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ProfileMasterDetail), findsOneWidget);
        expect(find.byType(ProfileDetail), findsNothing);
        expect(find.byType(ProfileItemBuilder), findsWidgets);

        await tester.tap(find.text(contactInfo));
        await tester.pumpAndSettle();

        expect(find.byType(ProfileContactDetails), findsOneWidget);

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });

      testWidgets('should navigate when ProfileItem [Legal Section] is tapped',
          (WidgetTester tester) async {
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        tester.binding.window.physicalSizeTestValue =
            typicalPhoneScreenSizePortrait;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const SignedUserProfileScaffold(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ProfileMasterDetail), findsOneWidget);
        expect(find.byType(ProfileDetail), findsNothing);
        expect(find.byType(ProfileItemBuilder), findsWidgets);

        await tester.dragUntilVisible(
          find.text(termsOfServiceSettings),
          find.byType(Column),
          const Offset(-30, 0),
        );

        await tester.tap(find.text(termsOfServiceSettings));
        await tester.pumpAndSettle();

        expect(find.byType(TermsAndConditionsPage), findsOneWidget);

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });

      testWidgets('should navigate when change PIN is tapped',
          (WidgetTester tester) async {
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        tester.binding.window.physicalSizeTestValue =
            typicalPhoneScreenSizePortrait;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const SignedUserProfileScaffold(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ProfileMasterDetail), findsOneWidget);
        expect(find.byType(ProfileDetail), findsNothing);
        expect(find.byType(ProfileItemBuilder), findsWidgets);

        await tester.tap(find.text(changePINSettings));
        await tester.pumpAndSettle();

        expect(find.byType(ResumeWithPinPage), findsOneWidget);

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });
    });
  });
}
