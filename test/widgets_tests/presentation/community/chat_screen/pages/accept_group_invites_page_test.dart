import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/communities/invited_groups/pages/accept_group_invites_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('AcceptGroupInvitations Page', () {
    late Store<AppState> store;
    final MockShortGraphQlClient failRejectMockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              'rejectInvitation': false,
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

    final MockShortGraphQlClient rejectMockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              'rejectInvitation': true,
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
          },
        ),
        200,
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
        client: MockGraphQlClient(),
        widget: const AcceptGroupInvitesPage(
          groupId: '',
          groupName: '',
          numberOfMembers: 0,
          acceptInviteRoute: AppRoutes.userProfilePage,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
      expect(find.text(joinGroup), findsOneWidget);
      expect(find.text(declineInvite), findsOneWidget);

      await tester.tap(find.text(joinGroup));
      await tester.pumpAndSettle();

      expect(find.byType(AcceptGroupInvitesPage), findsNothing);
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

      expect(find.byType(AcceptGroupInvitesPage), findsNothing);
    });

    testWidgets('fails to reject an invitation', (WidgetTester tester) async {
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
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
