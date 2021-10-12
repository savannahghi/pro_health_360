// Flutter imports:
import 'package:async_redux/async_redux.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/information_list_card.dart';
import 'package:myafyahub/presentation/profile/pages/clinic_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/personal_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/saved_posts.dart';
import 'package:myafyahub/presentation/profile/pages/settings_page.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';
import 'package:myafyahub/presentation/profile/widgets/user_details_card_widget.dart';

import '../../../../test_helpers.dart';

void main() {
  group('UserProfilePage', () {
    late Store<AppState> store;
    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: UserProfilePage(),
      );
      expect(find.byType(UserDetailsCard), findsWidgets);
      final Finder userProfileListItem = find.byType(InformationListCard);
      final Finder hotlineCallButton = find.byKey(hotlineCallButtonKey);
      final Finder personalInformationButton =
          find.text('Personal information');

      expect(userProfileListItem, findsNWidgets(userProfileItems.length));
      expect(hotlineCallButton, findsOneWidget);
      expect(personalInformationButton, findsOneWidget);

      await tester.ensureVisible(personalInformationButton);
      await tester.tap(personalInformationButton);
      await tester.pumpAndSettle();
      expect(find.byType(PersonalInformationPage), findsOneWidget);

      await tester.tap(find.byKey(backButtonKey));
      await tester.pumpAndSettle();
      expect(userProfileListItem, findsNWidgets(userProfileItems.length));
    });
    testWidgets('navigates to PersonalInformationPage correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: UserProfilePage(),
      );
      final Finder personalInformationButton =
          find.text('Personal information');
      expect(personalInformationButton, findsOneWidget);

      await tester.tap(personalInformationButton);
      await tester.pumpAndSettle();
      expect(find.byType(PersonalInformationPage), findsOneWidget);

      await tester.tap(find.byKey(backButtonKey));
      await tester.pumpAndSettle();
      expect(personalInformationButton, findsOneWidget);
    });
    testWidgets('navigates to ClinicDataPage correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: UserProfilePage(),
      );
      final Finder clinicInformationButton = find.text('Clinic information');
      expect(clinicInformationButton, findsOneWidget);

      await tester.tap(clinicInformationButton);
      await tester.pumpAndSettle();
      expect(find.byType(ClinicInformationPage), findsOneWidget);

      await tester.tap(find.byKey(backButtonKey));
      await tester.pumpAndSettle();
      expect(clinicInformationButton, findsOneWidget);
    });
    testWidgets('navigates to SavedPostsPage correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: UserProfilePage(),
      );
      final Finder mySavedButton = find.text('My Saved');
      expect(mySavedButton, findsOneWidget);

      await tester.tap(mySavedButton);
      await tester.pumpAndSettle();
      expect(find.byType(SavedPostPage), findsOneWidget);

      await tester.tap(find.byKey(backButtonKey));
      await tester.pumpAndSettle();
      expect(mySavedButton, findsOneWidget);
    });
    testWidgets('navigates to SettingsPage correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: UserProfilePage(),
      );
      final Finder settingsButton = find.text('Settings');
      expect(settingsButton, findsOneWidget);

      await tester.ensureVisible(settingsButton);
      await tester.tap(settingsButton);
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);

      await tester.tap(find.byKey(backButtonKey));
      await tester.pumpAndSettle();
      expect(settingsButton, findsOneWidget);
    });
    testWidgets('FAQs button show a coming soon snackbar',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: UserProfilePage(),
      );
      final Finder faqsButton = find.text('FAQs');
      expect(faqsButton, findsOneWidget);

      await tester.ensureVisible(faqsButton);
      await tester.tap(faqsButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text(comingSoonText), findsOneWidget);
    });
  });
}
