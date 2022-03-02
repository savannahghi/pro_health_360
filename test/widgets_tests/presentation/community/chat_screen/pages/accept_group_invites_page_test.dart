import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/communities/invited_groups/pages/accept_group_invites_page.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('AcceptGroupInvitations Page', () {
    late Store<AppState> store;
    final MockShortSILGraphQlClient mockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              'acceptInvitation': true,
            }
          },
        ),
        201,
      ),
    );

    final MockShortSILGraphQlClient rejectMockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              'rejectInvitation': true,
            }
          },
        ),
        201,
      ),
    );

    final MockShortSILGraphQlClient failRejectMockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              'rejectInvitation': null,
            }
          },
        ),
        201,
      ),
    );
    setUpAll(() {
      store = Store<AppState>(
        initialState: AppState.initial()
          ..clientState!.copyWith(facilityID: 'id'),
      );
    });

    testWidgets('renders correctly and accepts invitation',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const AcceptGroupInvitesPage(
          groupId: '',
          groupName: '',
          numberOfMembers: 0,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
      expect(find.text(joinGroup), findsOneWidget);
      expect(find.text(declineInvite), findsOneWidget);

      await tester.tap(find.text(joinGroup));
      await tester.pumpAndSettle();

      expect(find.byType(UserProfilePage), findsOneWidget);
    });
    testWidgets('renders correctly and rejects an invitation',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: rejectMockShortSILGraphQlClient,
        widget: const AcceptGroupInvitesPage(
          groupId: '',
          groupName: '',
          numberOfMembers: 0,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
      expect(find.text(joinGroup), findsOneWidget);
      expect(find.text(declineInvite), findsOneWidget);

      await tester.tap(find.text(declineInvite));
      await tester.pumpAndSettle();

      expect(find.byType(UserProfilePage), findsOneWidget);
    });

    testWidgets('fails to rejects an invitation', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: failRejectMockShortSILGraphQlClient,
        widget: const AcceptGroupInvitesPage(
          groupId: '',
          groupName: '',
          numberOfMembers: 0,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
      expect(find.text(joinGroup), findsOneWidget);
      expect(find.text(declineInvite), findsOneWidget);

      await tester.tap(find.text(declineInvite));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
