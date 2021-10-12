// Dart imports:
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/library/library_content.dart';
import 'package:myafyahub/presentation/engagement/library/pages/library_page_articles_list.dart';
import 'package:myafyahub/presentation/engagement/library/pages/library_page_content.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../test_helpers.dart';
import '../../../../test_utils.dart';

void main() {
  group('Library Page Content', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: LibraryPageContent(
          libContent: libListItems,
        ),
      );

      await tester.pumpAndSettle();

      final Finder libListWidget = find.byKey(libraryPageContentKey);
      expect(libListWidget, findsOneWidget);
    });

    testWidgets('list items should navigate to detail view page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: LibraryPageContent(
          libContent: libListItems,
        ),
      );

      await tester.pumpAndSettle();

      final Finder libListWidget = find.byKey(libraryPageContentKey);
      expect(libListWidget, findsOneWidget);

      final Finder libraryItemsList = find.byType(LibraryPageArticlesList);
      expect(libraryItemsList.first, findsOneWidget);
      await tester.tap(libraryItemsList.at(1));
      await tester.pumpAndSettle();
      expect(find.byType(LibraryContent), findsOneWidget);
    });
  });
}
