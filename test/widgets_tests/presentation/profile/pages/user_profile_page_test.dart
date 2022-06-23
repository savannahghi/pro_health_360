// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_client_profile_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/address.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/profile/hotline/pages/hotlines_page.dart';
import 'package:pro_health_360/presentation/profile/hotline/widgets/hotline_widget.dart';
import 'package:pro_health_360/presentation/profile/pages/user_profile_page.dart';
import 'package:pro_health_360/presentation/profile/personal_information/personal_information_page.dart';
import 'package:pro_health_360/presentation/profile/widgets/user_details_card_widget.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('UserProfilePage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateUserProfileAction(firstName: 'Test', lastName: 'Name'),
      );
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: UserProfilePage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(UserDetailsCard), findsWidgets);

      final Finder userProfileListItem = find.byType(InformationListCard);
      final Finder hotlineWidget = find.byType(HotlineWidget);

      expect(userProfileListItem, findsNWidgets(userProfileItems.length));
      expect(hotlineWidget, findsOneWidget);
    });

    testWidgets('should show more hotlines when prompted',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: UserProfilePage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(UserDetailsCard), findsWidgets);

      final Finder userProfileListItem = find.byType(InformationListCard);
      final Finder hotlineWidget = find.byType(HotlineWidget);
      expect(userProfileListItem, findsNWidgets(userProfileItems.length));
      expect(hotlineWidget, findsOneWidget);

      /// Verify the 2 hotline buttons are present
      final Finder hotlineCallButton = find.byKey(hotlineCallButtonKey);
      final Finder hotlineMoreHotlinesButton =
          find.byKey(hotlineMoreHotlinesKey);

      expect(hotlineCallButton, findsOneWidget);
      expect(hotlineMoreHotlinesButton, findsOneWidget);

      await tester.scrollUntilVisible(hotlineCallButton, 800);
      await tester.tap(hotlineCallButton);
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(hotlineMoreHotlinesButton, 800);
      await tester.tap(hotlineMoreHotlinesButton);
      await tester.pumpAndSettle();

      expect(find.byType(HotlinesPage), findsOneWidget);
      expect(find.text(hotlinesTitle), findsOneWidget);
    });

    testWidgets('navigates to PersonalInformationPage correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
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

    testWidgets('renders user information correctly',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateClientProfileAction(addresses: <Address>[Address(text: 'home')]),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: UserProfilePage(),
      );

      expect(find.text('home'), findsOneWidget);
    });
  });
}
