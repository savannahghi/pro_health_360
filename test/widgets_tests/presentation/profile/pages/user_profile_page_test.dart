// Flutter imports:
import 'package:async_redux/async_redux.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/information_list_card.dart';
import 'package:myafyahub/presentation/profile/pages/personal_information_page.dart';
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

      expect(userProfileListItem, findsNWidgets(userProfileItems.length));
      expect(hotlineCallButton, findsOneWidget);
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

      await tester.ensureVisible(personalInformationButton);
      await tester.tap(personalInformationButton);
      await tester.pumpAndSettle();
      expect(find.byType(PersonalInformationPage), findsOneWidget);
    });
  });
}
