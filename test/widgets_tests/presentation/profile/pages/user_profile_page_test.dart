// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';
import 'package:myafyahub/presentation/profile/personal_information/personal_information_page.dart';
import 'package:myafyahub/presentation/profile/widgets/user_details_card_widget.dart';
import '../../../../test_helpers.dart';

void main() {
  group('UserProfilePage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateUserProfileAction(
          firstName: 'Test',
          lastName: 'Name',
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: UserProfilePage(),
      );
      expect(find.byType(UserDetailsCard), findsWidgets);
      final Finder userProfileListItem = find.byType(InformationListCard);
      final Finder hotlineCallButton = find.byKey(hotlineCallButtonKey);
      // final Finder requestCorrectionButton =
      //     find.byKey(requestCorrectionButtonKey);

      expect(userProfileListItem, findsNWidgets(userProfileItems.length));
      expect(hotlineCallButton, findsOneWidget);
      // todo(byron) return this when backend and workflow is ready
      // expect(requestCorrectionButton, findsOneWidget);

      // await tester.tap(requestCorrectionButton);
      // await tester.pumpAndSettle();
      // expect(find.text(comingSoonText), findsOneWidget);
    });

    testWidgets('navigates to PersonalInformationPage correctly',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateUserProfileAction(
          firstName: 'Test',
          lastName: 'Name',
        ),
      );
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
