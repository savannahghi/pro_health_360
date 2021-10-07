// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/help_center/sil_help_center_button.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('SILHelpCenterButton test', () {
    late Store<AppState> store;
    final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

    setUpAll(() {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          userProfileState: UserProfileState(
            auth: AuthCredentialResponse.fromJson(
                <String, dynamic>{'uid': 'ajskdhbskjbdjhaskdbkash'}),
            userProfile: UserProfile.initial().copyWith(
              primaryPhoneNumber: PhoneNumber.withValue('0715710345'),
              userBioData: BioData.initial().copyWith(
                  firstName: Name.withValue('name'),
                  lastName: Name.withValue('name'),
                  gender: Gender.female),
            ),
          ),
        ),
      );
    });
    testWidgets('SILHelpCenterButton should render correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const SILHelpCenterButton(),
      );

      await tester.pumpAndSettle();
      final Finder floatingActionButton = find.byKey(helpCenterButtonKey);
      expect(floatingActionButton, findsOneWidget);
    });

    testWidgets('SILHelpCenterButton works correctly when pressed',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const SILHelpCenterButton();
        }),
      );

      await tester.pumpAndSettle();
      final Finder floatingActionButton = find.byKey(helpCenterButtonKey);
      expect(floatingActionButton, findsOneWidget);

      await tester.tap(floatingActionButton);
      // verify(mockObserver.didPush(sampleRoute, any));
    });
  });
}
