// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/library/library_content_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/engagement/library/library_content.dart';
import '../../../mock_image_http_client.dart';
import '../../../test_helpers.dart';

void main() {
  group('LibraryContent', () {
    late Store<AppState> store;

    const String image =
        'https://images.unsplash.com/photo-1525466760727-1d8be8721154?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ';
    const String emptyImage = '';
    const String readTime = '2 mins';
    const String bodyText = 'Exercise for a healthy life';
    const String contentTags = 'Health Tips';
    const String bodyHTMLLink =
        "<a href='https://www.nhs.uk/live-well/healthy-weight/bmi-calculator/'>BMI calculator</a>";

    final LibraryContentItemData libraryContentItem = LibraryContentItemData(
      image,
      readTime,
      bodyText,
      contentTags,
      libraryContentPublishDate: '1969-07-20 20:18:04Z',
      libraryContentTitle: 'Exercise',
    );

    final LibraryContentItemData libraryContentItemWithNoImage =
        LibraryContentItemData(
      emptyImage,
      readTime,
      bodyText,
      contentTags,
      libraryContentPublishDate: '1969-07-20 20:18:04Z',
      libraryContentTitle: 'Exercise',
    );

    final LibraryContentItemData libraryContentItemWithHTMLBodyLink =
        LibraryContentItemData(
      emptyImage,
      readTime,
      bodyHTMLLink,
      contentTags,
      libraryContentPublishDate: '1969-07-20 20:18:04Z',
      libraryContentTitle: 'Exercise',
    );

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: LibraryContent(libraryContentItem: libraryContentItem),
      );

      await tester.pumpAndSettle();

      final Finder columnWidget = find.byKey(libraryContentColumnKey);
      expect(columnWidget, findsOneWidget);

      final Finder containerWidget = find.byKey(libraryContentContainerKey);
      expect(containerWidget, findsOneWidget);

      expect(find.byKey(libraryIconButtonKey), findsOneWidget);
    });

    testWidgets('should render correctly LibraryIconButton',
        (WidgetTester tester) async {
      Widget? iconButton;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            iconButton = LibraryIconButton(
              context: context,
              backgroundColor: AppColors.whiteColor,
              iconColor: AppColors.blackColor,
            );
            return iconButton!;
          },
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(GestureDetector), findsOneWidget);

      expect(iconButton, isNotNull);

      final GestureDetector? theWidget = iconButton as GestureDetector?;

      expect(theWidget?.onTap, isNotNull);

      expect(() => theWidget?.onTap?.call(), returnsNormally);
    });

    testWidgets('should render widgets with mocked data',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: LibraryContent(libraryContentItem: libraryContentItem),
      );
    });

    testWidgets('should render libraryButton when image is unavailable',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: LibraryContent(
          libraryContentItem: libraryContentItemWithNoImage,
        ),
      );
    });

    testWidgets('should render html body with links',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: LibraryContent(
          libraryContentItem: libraryContentItemWithHTMLBodyLink,
        ),
      );
      await tester.tap(find.text('BMI calculator').first);
    });
  });
}
