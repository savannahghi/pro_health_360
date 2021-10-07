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
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_mood_selection.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('MyAfyaHubMoodSelection', () {
    final Store<AppState> store = Store<AppState>(
      initialState: AppState.initial().copyWith(
        userProfileState: UserProfileState(
          auth: AuthCredentialResponse.fromJson(
              <String, dynamic>{'uid': 'ajskdhbskjbdjhaskdbkash'}),
          userProfile: UserProfile.initial().copyWith(
            primaryPhoneNumber: PhoneNumber.withValue('0715710345'),
            userBioData: BioData.initial().copyWith(
                firstName: Name.withValue('john'),
                lastName: Name.withValue('doe'),
                gender: Gender.female),
          ),
        ),
      ),
    );

    final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

    testWidgets('should tap the various moods  and show a coming soon text',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const MyAfyaHubMoodSelection(),
      );

      expect(find.text(howAreYouFeelingTodayText('john')), findsOneWidget);

      await tester.tap(find.byKey(excitedMoodKey));
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Coming soon'), findsOneWidget);

      await tester.tap(find.byKey(happyMoodKey));
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Coming soon'), findsOneWidget);

      await tester.tap(find.byKey(mehMoodKey));
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Coming soon'), findsOneWidget);

      await tester.tap(find.byKey(sadMoodKey));
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Coming soon'), findsOneWidget);

      await tester.tap(find.byKey(verySadMoodKey));
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Coming soon'), findsOneWidget);
    });
  });
}
