// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/content/widgets/successful_feedback_submission.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('SuccessfulFeedbackSubmissionPage', () {
    testWidgets('should display successfully', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const SuccessfulFeedbackSubmissionPage(),
      );
      await tester.pump();

      expect(find.byType(SuccessfulFeedbackSubmissionPage), findsOneWidget);

      final Finder button = find.byType(MyAfyaHubPrimaryButton);
      expect(button, findsOneWidget);

      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byType(UserProfilePage), findsOneWidget);
    });
  });
}
