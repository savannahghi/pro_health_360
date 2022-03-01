// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/logout_button.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import '../../mocks.dart';
import '../../test_helpers.dart';
import '../../test_utils.dart';

void main() {
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

    expect(find.byType(MyAfyaHubNoBorderButton), findsOneWidget);

    await tester.tap(find.byType(MyAfyaHubNoBorderButton));
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

    expect(store.state.credentials!.isSignedIn, false);
    // TOD: (vincent) confirm state reset
    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
