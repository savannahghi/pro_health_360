// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/feed/feed_list.dart';
import 'package:myafyahub/presentation/profile/pages/saved_posts.dart';
import '../../../test_helpers.dart';

void main() {
  group('SavedPosts', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: SavedPostPage(),
        );

        expect(find.text(savedVideoText), findsOneWidget);
        expect(find.text(savedArticleText), findsOneWidget);
        expect(find.byType(FeedList), findsWidgets);
      });
    });
  });
}
