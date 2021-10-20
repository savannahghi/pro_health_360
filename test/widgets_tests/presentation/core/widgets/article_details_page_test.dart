import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/widgets/article_details_page.dart';

import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ArticleDetailsPage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: ArticleDetailsPage(
          payload: <String, dynamic>{
            'authorName': feedItems.first.authorName,
            'coverImagePath': feedItems.first.coverImageUrl,
            'date': feedItems.first.date,
            'titleText': feedItems.first.header,
            'bodyText': feedItems.first.bodyContent,
            'authorDisplayPic': feedItems.first.authorDisplayPic,
          },
        ),
      );
      expect(find.byType(CustomAppBar), findsOneWidget);
    });
  });
}
