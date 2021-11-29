// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';
import 'package:myafyahub/presentation/content/pages/content_details_page.dart';
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
        widget: ContentDetailPage(contentDetails: mockContent),
      );

      expect(find.byKey(cancelButtonKey), findsOneWidget);
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
        widget: ContentDetailPage(contentDetails: contentWithoutBody),
      );
      expect(find.byType(GenericEmptyData), findsOneWidget);
    });
    testWidgets('Reaction buttons are tappable', (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'likeContent': true,
            }
          }),
          201,
        ),
      );
      final Content contentWithoutBody = mockContent.copyWith.call(body: null);
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: ContentDetailPage(contentDetails: contentWithoutBody),
      );
      await tester.pumpAndSettle();

      final Finder likeButton = find.byKey(likeButtonKey);
      final Finder shareButton = find.byKey(shareButtonKey);
      final Finder saveButton = find.byKey(saveButtonKey);

      expect(likeButton, findsOneWidget);
      expect(shareButton, findsOneWidget);
      expect(saveButton, findsOneWidget);

      await tester.tap(likeButton);
      await tester.pumpAndSettle();
      expect(find.text('Like'), findsNothing);

      await tester.tap(likeButton);
      await tester.pumpAndSettle();
      expect(find.text('Like'), findsNothing);
    });
  });
}
