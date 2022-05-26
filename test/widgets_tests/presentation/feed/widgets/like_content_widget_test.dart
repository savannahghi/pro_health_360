import 'dart:convert';
import 'dart:io';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/actions/update_content_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/widgets/like_content_widget.dart';

import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('LikeContentWidget', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();

      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });
    testWidgets('renders correctly with the like value set to false',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'checkIfUserHasLikedContent': false,
            }
          }),
          201,
        ),
      );
      store.dispatch(
        UpdateContentStateAction(
          contentItems: <Content>[mockContent.copyWith(hasLiked: false)],
        ),
      );
      await tester.runAsync(() async {
        TestWidgetsFlutterBinding.ensureInitialized();
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: LikeContentWidget(
            contentID: mockContent.contentID!,
            contentDisplayedType: ContentDisplayedType.FEED,
          ),
        );
        await tester.pumpAndSettle();

        final Finder likeButton = find.byKey(likeButtonKey);
        expect(likeButton, findsOneWidget);

        await tester.ensureVisible(likeButton);
        await tester.pumpAndSettle();
        await tester.tap(likeButton);
        await tester.pumpAndSettle();

        expect(find.text('Like'), findsNothing);
      });
    });
    testWidgets('renders correctly with the like value set to true',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateContentStateAction(
          contentItems: <Content>[mockContent.copyWith(hasLiked: true)],
        ),
      );
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'checkIfUserHasLikedContent': true,
            }
          }),
          201,
        ),
      );
      await tester.runAsync(() async {
        TestWidgetsFlutterBinding.ensureInitialized();
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const LikeContentWidget(
            contentID: 1,
            contentDisplayedType: ContentDisplayedType.FEED,
          ),
        );
        await tester.pumpAndSettle();

        final Finder likeButton = find.byKey(likeButtonKey);
        expect(likeButton, findsOneWidget);

        await tester.ensureVisible(likeButton);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(likeButtonKey));
        await tester.pumpAndSettle();
        expect(find.text('likes'), findsNothing);
      });
    });
    testWidgets('like should be false when item is not found in state',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateContentStateAction(
          contentItems: <Content>[mockContent.copyWith(hasLiked: true)],
        ),
      );
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'checkIfUserHasLikedContent': true,
            }
          }),
          201,
        ),
      );

      TestWidgetsFlutterBinding.ensureInitialized();
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const LikeContentWidget(
          contentID: 9,
          contentDisplayedType: ContentDisplayedType.FEED,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('likes'), findsNothing);
    });
  });
}
