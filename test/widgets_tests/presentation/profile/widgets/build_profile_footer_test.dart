import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/profile/widgets/build_profile_footer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock_utils.dart';
import '../../../../test_helpers.dart';

void main() {
  // initial set up
  setupFirebaseAuthMocks();

  late Store<AppState> store;
  setUp(() async {
    store = Store<AppState>(initialState: AppState.initial());
    HttpOverrides.global = null;
    await Firebase.initializeApp();
  });
  testWidgets('BuildProfileFooter widget renders well',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      client: baseGraphQlClientMock,
      widget: BuildProfileFooter(),
    );

    await tester.pumpAndSettle();

    expect(find.byType(BuildProfileFooter), findsWidgets);
    expect(find.text('Copyright ©️ 2021 My Afya Hub'), findsWidgets);
    expect(find.byType(GestureDetector), findsOneWidget);
    await tester.tap(find.byKey(logoutIconKey));
    await tester.pumpAndSettle();
  });
}
