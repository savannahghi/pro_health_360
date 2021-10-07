// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/onboarding_page_wrapper.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/pin_verification.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import '../../../test_helpers.dart';

void main() {
  group('onboarding page wrapper', () {
    testWidgets('flat button can be pressed', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const Scaffold(
              body: OnboardingPageWrapper(
            title: landingPageTitle,
            description: enterPINText,
            svgPath: shieldIconImgUrl,
            previousRoute: BWRoutes.phoneLogin,
            child: PinVerification(),
          )));

      await tester.pump();

      expect(find.byKey(onboardingSingleChildKey), findsOneWidget);
      expect(find.byKey(onboardingNoBorderButtonKey), findsOneWidget);

      await tester.tap(find.byKey(onboardingNoBorderButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(OnboardingPageWrapper), findsNothing);
    });
  });
}
