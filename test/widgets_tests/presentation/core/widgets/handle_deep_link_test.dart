// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/update_content_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_response.dart';
import 'package:myafyahub/presentation/core/widgets/handle_deep_link.dart';
import 'package:myafyahub/presentation/home/pages/home_page.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('HandleDeepLink', () {
    setUp(() async {
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
    });
    testWidgets('should dispatch DeepLinkAction', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(800, 1200);
      tester.binding.window.devicePixelRatioTestValue = 1;

      final PhoneLoginResponse phoneLoginResponse =
          PhoneLoginResponse.fromJson(mockLoginResponse);

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getContent': <String, dynamic>{
                'items': <dynamic>[mockContent, mockContent]
              }
            }
          }),
          201,
        ),
      );

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      store.dispatch(
        UpdateUserAction(
          user: phoneLoginResponse.userResponse?.clientState?.user,
        ),
      );

      final DateTime now = DateTime.now();
      final int expiryTime = int.tryParse(
            phoneLoginResponse.userResponse?.credentials?.expiresIn ?? '3600',
          ) ??
          3600;
      final DateTime mockExpiry = now.add(Duration(seconds: expiryTime));

      store.dispatch(
        UpdateCredentialsAction(
          expiresIn: phoneLoginResponse.userResponse?.credentials?.expiresIn,
          tokenExpiryTimestamp: mockExpiry.toIso8601String(),
          isSignedIn: true,
        ),
      );

      store.dispatch(UpdateUserProfileAction(termsAccepted: true));

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
          hasSetNickName: true,
        ),
      );
      store.dispatch(
        UpdateContentStateAction(contentItems: <Content>[mockContent]),
      );
      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const HandleDeepLink(),
        );
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);
      });

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
