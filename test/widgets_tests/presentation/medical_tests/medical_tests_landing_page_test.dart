// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/coming_soon_page.dart';
import 'package:shared_ui_components/small_appbar.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/medical_tests/medical_tests_landing_page.dart';
import '../../../test_helpers.dart';

void main() {
  group('Medical Tests Landing Page renders correctly', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());
    testWidgets('Tests  Landing Page render correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MedicalTestsLandingPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(MedicalTestsLandingPage), findsOneWidget);
      expect(find.byType(SILSmallAppBar), findsOneWidget);
      expect(find.byType(SILComingSoonPage), findsOneWidget);
    });
  });
}
