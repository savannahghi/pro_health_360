// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/logout_button.dart';
import '../../mock_utils.dart';
import '../../mocks.dart';
import '../../test_helpers.dart';
import '../../test_utils.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  testWidgets('sil logout btn', (WidgetTester tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = tabletPortrait;

    await buildTestWidget(
      tester: tester,
      store: store,
      client: baseGraphQlClientMock,
      widget: Builder(
        builder: (BuildContext context) {
          return const Scaffold(body: LogoutButton());
        },
      ),
    );

    await tester.pump();

    expect(find.byType(SILNoBorderButton), findsOneWidget);

    await tester.tap(find.byType(SILNoBorderButton));
    await fireEvent(tester);
    await tester.pumpAndSettle();

    // verify(mockObserver.didPush(sampleRoute, any));
    expect(find.byType(LoginPage), findsOneWidget);
    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });

  testWidgets('LogoutButton should navigate when pressed',
      (WidgetTester tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = tabletPortrait;
    await buildTestWidget(
      tester: tester,
      store: store,
      client: baseGraphQlClientMock,
      widget: Builder(
        builder: (BuildContext context) {
          return const Scaffold(body: LogoutButton());
        },
      ),
    );

    await tester.pump();

    await tester.pumpAndSettle();
    expect(find.byKey(logoutButtonKey), findsOneWidget);

    await tester.tap(find.byKey(logoutButtonKey));
    await tester.pumpAndSettle();
    // verify(mockNavigatorObserver.didPush(sampleRoute, any));

    expect(store.state.userProfileState!.isSignedIn, false);
    // TOD: (vincent) confirm state reset
    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
