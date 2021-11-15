// Package imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/core/widgets/pin_input_field_widget.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/verify_phone_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/verify_otp_widget.dart';
import 'package:myafyahub/presentation/onboarding/terms_and_conditions_page.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('VerifyPhonePage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'sendOTP': true,
              'getCurrentTerms': termsMock,
              'acceptTerms': true
            },
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const VerifyPhonePage(
          otp: 1234,
          userID: 'some-user-id',
          phoneNumber: '0700111222',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(VerifyOtpWidget), findsOneWidget);
      await tester.pumpAndSettle();
      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '1234');
      await tester.pumpAndSettle(const Duration(seconds: 5));
      expect(find.byType(TermsAndConditionsPage), findsWidgets);
    });
  });
}
