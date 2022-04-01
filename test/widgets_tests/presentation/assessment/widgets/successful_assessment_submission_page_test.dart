// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/actions/update_clinical_information_state_action.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/assessment/widgets/successful_assessment_submission_page.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('SuccessfulAssessmentSubmissionPage', () {
    testWidgets('should display successfully', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      store.dispatch(
        UpdateClinicInformationStateAction(phoneNumber: '+254712345678'),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const SuccessfulAssessmentSubmissionPage(),
      );
      await tester.pump();

      expect(find.byType(SuccessfulAssessmentSubmissionPage), findsOneWidget);

      final Finder button = find.byType(MyAfyaHubPrimaryButton);
      expect(button, findsOneWidget);

      await tester.tap(button);
      await tester.pump();

      expect(find.byType(SuccessfulAssessmentSubmissionPage), findsOneWidget);
    });
  });
}
