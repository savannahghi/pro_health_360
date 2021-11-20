// Dart imports:
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/feed/widgets/content_item.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ContentItem', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });

    testWidgets('shows the play icon if a piece of content has a video',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      final Content contentWithVideo =
          mockContent.copyWith.call(body: null, contentType: ContentType.VIDEO);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: ContentItem(contentDetails: contentWithVideo),
      );

      expect(find.byKey(feedVideoPlayIconKey), findsOneWidget);
    });
  });
}
