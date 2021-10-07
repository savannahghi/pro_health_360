// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/doctors/doctors_page.dart';
import '../../../mocks.dart';

void main() {
  group('SeeDoctorPage', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    testWidgets('Tests see doctor page', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletPortrait;

      await tester.pumpWidget(StoreProvider<AppState>(
          store: store, child: MaterialApp(home: SeeDoctorLandingPage())));

      expect(find.byType(SeeDoctorLandingPage), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
