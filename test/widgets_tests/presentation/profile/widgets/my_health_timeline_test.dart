// Flutter imports:
import 'package:async_redux/async_redux.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

// Project imports:
import 'package:myafyahub/presentation/profile/health_timeline/my_health_timeline.dart';
import 'package:myafyahub/presentation/profile/health_timeline/timeline_indicator.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('MyHealthTimeline', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: Store<AppState>(initialState: AppState.initial()),
        client: MockGraphQlClient(),
        widget: const MyHealthTimeline(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyHealthTimeline), findsOneWidget);
      expect(find.text('My Health Timeline'), findsOneWidget);
      expect(find.byType(TimelineIndicator), findsWidgets);
    });
  });
}
