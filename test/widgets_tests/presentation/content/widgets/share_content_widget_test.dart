import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/content/widgets/share_content_widget.dart';

import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ShareContentWidget', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();

      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets('works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const ShareContentWidget(
          link: 'testLink',
          title: 'testTitle',
          contentID: 0,
        ),
      );
      await tester.pumpAndSettle();
      final Finder shareButton = find.byKey(shareButtonKey);

      expect(shareButton, findsOneWidget);

      await tester.tap(shareButton);
      await tester.pumpAndSettle();
      expect(find.text('Share'), findsOneWidget);
    });
  });
}
