// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/onboarding/set_nickname/pages/set_nickname_page.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('OnboardingUtils', () {
    const MethodChannel('plugins.flutter.io/url_launcher')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'launch') {
        return Future<bool>.value(true); // set initial values here if desired
      }
      return null;
    });

    testWidgets('clearAllFlags should clear all flags',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      const String flag = 'create_account';
      await store.dispatch(
        WaitAction<AppState>.add(
          flag,
          ref: '${flag}_ref',
        ),
      );

      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return MyAfyaHubPrimaryButton(
                onPressed: () async {
                  clearAllFlags(context);
                  await Future<void>.delayed(const Duration(seconds: 5));
                },
              );
            },
          ),
        );

        await tester.pump();

        await tester.tap(find.byType(MyAfyaHubPrimaryButton));
        await tester.pumpAndSettle();

        expect(store.state.wait!.isWaitingFor(flag), false);
      });
    });
  });
  // group('setUserPIN', () {
  //   late Store<AppState> store;

  //   setUpAll(() {
  //     store = Store<AppState>(initialState: AppState.initial());
  //     HttpOverrides.global = null;
  //   });

  //   testWidgets('Navigates to Congratulations page if PINs are valid  ',
  //       (WidgetTester tester) async {
  //     final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
  //     await buildTestWidget(
  //       tester: tester,
  //       store: store,
  //       client: mockGraphQlClient,
  //       widget: Builder(
  //         builder: (BuildContext context) {
  //           return MyAfyaHubPrimaryButton(
  //             onPressed: () async {
  //               await _setUserPIN(
  //                 confirmPIN: '0000',
  //                 context: context,
  //                 newPIN: '0000',
  //                 flavour: Flavour.consumer.name,
  //               );
  //             },
  //           );
  //         },
  //       ),
  //     );

  //     await tester.tap(find.byType(MyAfyaHubPrimaryButton));
  //     await tester.pumpAndSettle();
  //     expect(find.byType(SetNickNamePage), findsOneWidget);
  //   });

  //   testWidgets('Shows snackbar when pins do not match',
  //       (WidgetTester tester) async {
  //     final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
  //     await buildTestWidget(
  //       tester: tester,
  //       store: store,
  //       client: mockGraphQlClient,
  //       widget: Builder(
  //         builder: (BuildContext context) {
  //           return MyAfyaHubPrimaryButton(
  //             onPressed: () async {
  //               await _setUserPIN(
  //                 confirmPIN: '0001',
  //                 context: context,
  //                 newPIN: '0000',
  //                 flavour: Flavour.consumer.name,
  //               );
  //             },
  //           );
  //         },
  //       ),
  //     );

  //     await tester.tap(find.byType(MyAfyaHubPrimaryButton));
  //     await tester.pump(const Duration(seconds: 1));
  //     expect(find.text(pinMustMatchString), findsOneWidget);
  //   });
  // });
}
