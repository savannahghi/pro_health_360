// Package imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/buttons.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_widget.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/congratulations_page.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('CongratulationsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    // testWidgets('should validate the input', (WidgetTester tester) async {
    //   await buildTestWidget(
    //     tester: tester,
    //     store: store,
    //     client: baseGraphQlClientMock,
    //     widget: const CongratulationsPage(
    //       duration: '3 years',
    //     ),
    //   );
    //   await tester.ensureVisible(find.byType(MyAfyaHubPrimaryButton));
    //   await tester.tap(find.byType(MyAfyaHubPrimaryButton));
    //   await tester.pumpAndSettle();

    //   expect(find.text(nameInputValidateString), findsOneWidget);
    // });

    testWidgets('continue button is clickable if input is valid',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'setNickName': true},
          }),
          201,
        ),
      );

      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const CongratulationsPage(
            duration: '3 years',
          ),
        );

        await tester.pumpAndSettle();
        await tester.showKeyboard(find.byType(CustomTextField));
        await tester.enterText(find.byType(CustomTextField), 'Name');
        await tester.pumpAndSettle();

        await tester.ensureVisible(find.byType(MyAfyaHubPrimaryButton));
        await tester.tap(find.byType(MyAfyaHubPrimaryButton));
        await tester.pumpAndSettle();
        expect(find.byType(HomeWidget), findsOneWidget);
      });
    });
  });
}
