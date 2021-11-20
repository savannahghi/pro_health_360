// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/my_health/pages/appointments_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_diary_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_page.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';
import '../../../test_helpers.dart';

void main() {
  group('MyHealthPage', () {
    late Store<AppState> store;
    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MyHealthPage(),
      );
      expect(find.byType(MyHealthPage), findsOneWidget);
      expect(find.text(myHealthPageHealthDiary), findsOneWidget);
      await tester.tap(find.text(myHealthPageHealthDiary));
      await tester.pumpAndSettle();
      expect(find.byType(MyHealthDiaryPage), findsOneWidget);
    });
    testWidgets('navigates to UserProfilePage ', (WidgetTester tester) async {
      store.dispatch(
        UpdateUserProfileAction(firstName: 'Test', lastName: 'Name'),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MyHealthPage(),
      );

      await tester.tap(find.text(myHealthPageProfile));
      await tester.pumpAndSettle();
      expect(find.byType(UserProfilePage), findsOneWidget);
    });
    testWidgets('navigates to Appointments Page ', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MyHealthPage(),
      );
      await tester.tap(find.text(myHealthPageAppointments));
      await tester.pumpAndSettle();
      expect(find.byType(AppointmentsPage), findsOneWidget);
    });
  });
}
