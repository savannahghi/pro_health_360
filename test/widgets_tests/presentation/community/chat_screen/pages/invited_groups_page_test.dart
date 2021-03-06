import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/invited_groups_page.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/widgets/group_invite_item.dart';
import 'package:pro_health_360/presentation/profile/pages/user_profile_page.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('Invited groups Page', () {
    late Store<AppState> store;
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'listPendingInvites': <dynamic>[
              <String, dynamic>{
                'id': '12345',
                'name': 'Test',
                'memberCount': 3,
                'gender': <dynamic>[],
                'description': '',
                'createdBy': null
              }
            ]
          }
        }),
        201,
      ),
    );

    final MockShortGraphQlClient mockShortSILGraphQlClientWithNoData =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'listPendingInvites': <dynamic>[],
            'retrieveFacility': <String, dynamic>{
              'ID': 'some-id',
              'name': 'name',
              'code': 1111,
              'county': 'Nairobi',
              'active': true,
              'phone': '+254712345678',
              'description': 'name Hospital'
            }
          }
        }),
        201,
      ),
    );

    setUpAll(() async {
      store = Store<AppState>(
        initialState: AppState.initial()
          ..clientState!.copyWith(facilityID: 'id'),
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders zero experience correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClientWithNoData,
        widget: const InvitedGroupsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.text(youHaveNoInvites), findsOneWidget);
      await tester.tap(find.text(okThanksText));

      await tester.pumpAndSettle();
      expect(find.byType(UserProfilePage), findsOneWidget);
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const InvitedGroupsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GroupInviteItem), findsOneWidget);
    });

    testWidgets('shows loading indicator correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const InvitedGroupsPage(),
      );

      store.dispatch(WaitAction<AppState>.add(fetchInvitedCommunitiesFlag));
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
