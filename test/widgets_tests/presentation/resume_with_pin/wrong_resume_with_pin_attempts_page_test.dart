import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/resume_with_pin/wrong_resume_with_pin_attempts_page.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  late Store<AppState> store;

  setUp(() {
    store = Store<AppState>(initialState: AppState.initial());
  });
  testWidgets('WrongResumeWithPinPage renders correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      client: MockGraphQlClient(),
      widget: const WrongResumeWithPinPage(),
    );

    await tester.pumpAndSettle();
    expect(find.byType(LoginCounterWidget), findsOneWidget);

    await tester.tap(find.byKey(signInButtonKey));
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
  });
}
