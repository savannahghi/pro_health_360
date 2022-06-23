// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:pro_health_360/application/redux/actions/content/fetch_like_status_action.dart';
import 'package:pro_health_360/application/redux/actions/update_content_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('FetchLikeStatusAction', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should dispatch action and catch error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{
                'message': '4: error',
              }
            ],
            'data': <String, dynamic>{
              'checkIfUserHasLikedContent': true,
            },
          }),
          401,
        ),
      );
      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () async {
                try {
                  store.dispatch(
                    UpdateContentStateAction(
                      contentItems: <Content>[mockContent],
                    ),
                  );
                  await store.dispatch(
                    FetchLikeStatusAction(
                      context: context,
                      contentID: 1,
                      contentDisplayedType: ContentDisplayedType.UNKNOWN,
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });
  });
}
