import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/profile/pages/contact_details.dart';

import 'package:myafyahub/presentation/router/router_generator.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_name_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:shared_ui_components/profile_banner.dart';
import 'package:user_profile/contacts.dart';

import '../../../../mocks.dart';

void main() {
  group('Should test ProfileContactDetails settings page', () {
    late Store<AppState> store;
    final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

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
    testWidgets('ProfileContactDetails page renders well',
        (WidgetTester tester) async {
      final MockNavigatorObserver mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) {
              return store.state;
            },
            builder: (BuildContext context, AppState appState) {
              return MaterialApp(
                onGenerateRoute: RouteGenerator.generateRoute,
                navigatorObservers: <NavigatorObserver>[mockObserver],
                home: Scaffold(
                  body: AppWrapper(
                    appName: testAppName,
                    appContexts: testAppContexts,
                    graphQLClient: mockGraphQlClient,
                    child: Builder(builder: (BuildContext context) {
                      return ProfileContactDetails();
                    }),
                  ),
                ),
              );
            },
          ),
        ),
      );

      expect(find.byType(ContactDetails), findsWidgets);
      expect(find.byType(SILProfileBanner), findsWidgets);

      // get the state
      final State<StatefulWidget> testState = tester.allStates.singleWhere(
          (State<StatefulWidget> element) =>
              element.toString() == buildContactProviderState);

      // check if it is null
      expect(testState, isNotNull);

      // call the method
      final BuildContactProviderState buildContactProviderStateTest =
          testState as BuildContactProviderState;
      buildContactProviderStateTest.refreshFeed();

      // assert that is was called
      expect(
          () => buildContactProviderStateTest.refreshFeed(), returnsNormally);
    });
  });
}
