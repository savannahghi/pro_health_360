// Flutter imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

// Project imports:
import 'package:myafyahub/presentation/communities/suggested_groups/suggested_group_card.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('SuggestedGroupCard', () {
    testWidgets('join button should route is successful',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockShortSILGraphQlClient mockShortSILGraphQlClient =
            MockShortSILGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'addMembersToCommunity': true}
            }),
            201,
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: SuggestedGroupCard(
            group: mockGroup,
            route: AppRoutes.phoneLogin,
          ),
        );

        final Finder joinButton = find.byKey(joinSuggestedGroupButtonKey);

        expect(joinButton, findsOneWidget);
        await tester.tap(joinButton);
        await tester.pumpAndSettle();
        expect(find.byType(LoginPage), findsOneWidget);
      });
    });

    testWidgets(
        'should show a snackbar with error message in case of error while adding member',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockShortSILGraphQlClient mockShortSILGraphQlClient =
            MockShortSILGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'errors': <Object>[
                <String, dynamic>{
                  'message': '4: error',
                }
              ]
            }),
            401,
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: SuggestedGroupCard(
            group: mockGroup,
            route: AppRoutes.phoneLogin,
          ),
        );

        final Finder joinButton = find.byKey(joinSuggestedGroupButtonKey);

        expect(joinButton, findsOneWidget);
        await tester.tap(joinButton);
        await tester.pump(const Duration(seconds: 4));
        expect(find.byType(SnackBar), findsOneWidget);
      });
    });
  });
}
