// Dart imports:
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/library/library_content_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/library/widgets/library_list_item.dart';
import '../../../mock_image_http_client.dart';
import '../../../test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  setUpAll(() {
    HttpOverrides.global = TestHttpOverrides();
  });

  final LibraryContentItemData libraryContentItem = LibraryContentItemData(
      'image', 'body', 'title', 'tag',
      libraryContentPublishDate: DateTime.now().toIso8601String(),
      libraryContentTitle: '');

  group('Library list test', () {
    testWidgets('Library List should render correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: LibraryListItem(libraryContentItem: libraryContentItem));

      await tester.pumpAndSettle();
      final Finder gestureWidget = find.byKey(libraryListItemKey);
      expect(gestureWidget, findsOneWidget);
    });

    testWidgets('Library List should navigate when pressed',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: LibraryListItem(libraryContentItem: libraryContentItem));

      await tester.pumpAndSettle();
      final Finder gestureWidget = find.byKey(libraryListItemKey);
      expect(gestureWidget, findsOneWidget);

      await tester.tap(gestureWidget);
      await tester.pumpAndSettle();
    });
  });
}
