import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/home/pages/home_page.dart';
import 'package:myafyahub/presentation/resume_with_pin/resume_pin_connector.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('ResumePinConnector', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('provides correct username', (WidgetTester tester) async {
      store.dispatch(
        UpdateUserAction(
          user: store.state.clientState?.user?.copyWith(username: 'John'),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const ResumePinConnector(),
      );

      expect(find.text(welcomeBackUserText('John')), findsOneWidget);
    });

    testWidgets('provides correct loading', (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(resumeWithPinFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const ResumePinConnector(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('provides correct on submit', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            jsonEncode(
              <String, dynamic>{
                'data': <String, bool>{'verifyPIN': true}
              },
            ),
            200,
          ),
        ),
        widget: const ResumePinConnector(),
      );

      final Finder pinInputField = find.byKey(const Key('pin_input_field'));

      await tester.enterText(pinInputField, '0000');
      await tester.pump();
      await tester.pump();

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('provides correct logout functionality',
        (WidgetTester tester) async {
      store.dispatch(AuthStatusAction(idToken: 'some-id-token'));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const ResumePinConnector(),
      );

      expect(store.state.credentials?.idToken, 'some-id-token');

      final Finder logoutBtn = find.byKey(const Key('logout_button'));
      await tester.tap(logoutBtn);

      expect(store.state.credentials?.idToken, UNKNOWN);
    });
  });
}
