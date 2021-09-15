import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/home/widgets/sil_bottom_navigation_bar.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('SIL bottom navigation bar', () {
    final MockGraphQlClient GraphQlClient = MockGraphQlClient();
    final Store<AppState> store = Store<AppState>(
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

    testWidgets('should render widget', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: GraphQlClient,
        widget: const SILBottomNavigationBar(
          currentIndex: 0,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(silBottomNavKey), findsOneWidget);
    });

    testWidgets(
        'renders all bottom navigation items correctly '
        'and navigates to at least one of the bottom navigation items',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: GraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return Scaffold(
            body: Container(),
            bottomNavigationBar: const SILBottomNavigationBar(
              currentIndex: 1,
            ),
          );
        }),
      );

      await tester.pumpAndSettle();

      // verify the bottom navigation bar exists
      expect(find.byKey(silBottomNavKey), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(find.text('Library'), findsOneWidget);
    });

    testWidgets('should navigate to the different tabs',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: GraphQlClient,
        widget: Scaffold(
          body: Container(),
          bottomNavigationBar: const SILBottomNavigationBar(
            currentIndex: 1,
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(silBottomNavKey), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      expect(store.state.miscState!.bottomNavObj!.currentBottomNavIndex, 0);

      expect(find.text('Library'), findsOneWidget);
      await tester.tap(find.text('Library'));
      await tester.pumpAndSettle();

      expect(store.state.miscState!.bottomNavObj!.currentBottomNavIndex, 1);
    });
  });
}
