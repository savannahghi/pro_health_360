// Dart imports:
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';
import 'package:myafyahub/presentation/feed/pages/content_details_page.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ContentDetailPage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });
    testWidgets('renders correctly with the correct content data',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: ContentDetailPage(articleDetails: mockContent),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
    });

    testWidgets(
        'renders an empty data widget if the body of a piece of content '
        'is empty', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      final Content contentWithoutBody = mockContent.copyWith.call(body: null);
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: ContentDetailPage(articleDetails: contentWithoutBody),
      );
      expect(find.byType(GenericEmptyData), findsOneWidget);
    });
  });
}
