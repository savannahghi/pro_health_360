import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/onboarding/widgets/my_afya_hub_header_scaffold.dart';
import 'package:myafyahub/presentation/onboarding/widgets/my_afya_hub_onboarding_scaffold.dart';

import '../../../../test_helpers.dart';

void main() {
  group('MyAfyaHubOnboardingScaffold', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
          client: baseGraphQlClientMock,
          store: store,
          tester: tester,
          widget: const MyAfyaHubOnboardingScaffold(
            title: 'My Afya Hub Onboarding Scaffold',
            description: 'test My Afya Hub Onboarding Scaffold',
            child: Text('Test'),
          ));
      await tester.pump();
      expect(find.byType(MyAfyaHubScaffoldHeader), findsOneWidget);
    });
  });
}
