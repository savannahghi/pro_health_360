// Dart imports:
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/inputs.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/request_pin_reset_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/request_pin_reset.dart';
import '../../../mock_image_http_client.dart';
import '../../../test_helpers.dart';

void main() {
  late Store<AppState> store;

  setUp(() {
    store = Store<AppState>(initialState: AppState.initial());
    HttpOverrides.global = TestHttpOverrides();
  });

  group('test if request reset pin widget exists', () {
    testWidgets('find pin request reset page', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: RequestPinResetPage());

      await tester.pump();
      final Finder pinLoginWidget = find.byType(RequestPinReset);
      expect(pinLoginWidget, findsOneWidget);

      final Finder pinLoginContentWidget = find.byType(SILPhoneInput);
      expect(pinLoginContentWidget, findsOneWidget);
    });
  });
}
