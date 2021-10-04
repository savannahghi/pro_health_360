import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile.dart' as p;

import 'package:flutter_test/flutter_test.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:shared_ui_components/profile_banner.dart';

import '../../../../mock_image_httpclient.dart';
import '../../../../test_helpers.dart';

void main() {
  group('Should test UserProfile page', () {
    late Store<AppState> store;
    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = BWTestHttpOverrides();
      store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
              firstName: Name.withValue('Test'),
              lastName: Name.withValue('Name'),
              gender: Gender.male),
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
            primaryEmailAddress: EmailAddress.withValue('s@g.com'),
          ),
        ),
      );
    });
    testWidgets('UserProfile page renders well for logged in user',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: p.UserProfile(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(SILProfileBanner), findsWidgets);
      expect(find.text('Logout'), findsWidgets);
    });

    testWidgets('UserProfile page renders well for anonymous user',
        (WidgetTester tester) async {
      store.dispatch(AuthStatusAction(isAnonymous: true));
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: p.UserProfile(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(SILProfileBanner), findsWidgets);
    });
  });
}
