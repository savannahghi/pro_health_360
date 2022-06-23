// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_group_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/communities/group.dart';
import 'package:pro_health_360/presentation/communities/suggested_groups/suggested_group_card.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

import 'package:pro_health_360/presentation/communities/suggested_groups/suggested_groups_section_widget.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('SuggestedGroupsSection', () {
    testWidgets('SuggestedGroupsSection should render correctly',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        store.dispatch(UpdateGroupStateAction());
        final MockShortGraphQlClient mockShortSILGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'fetchRecentContent': <dynamic>[],
                'recommendedCommunities': <dynamic>[mockGroup]
              }
            }),
            201,
          ),
        );
        store.dispatch(
          UpdateGroupStateAction(
            recommendedGroups: <Group>[Group.initial()],
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const SuggestedGroupsSection(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(SuggestedGroupCard), findsNWidgets(1));
      });
    });

    testWidgets('shows a loading indicator when fetching data',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'loading': true}
            }),
            201,
          ),
        );
        store.dispatch(
          WaitAction<AppState>.add(fetchRecommendedCommunitiesFlag),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: const SuggestedGroupsSection(),
        );

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
    });
  });
}
