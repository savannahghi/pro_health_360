// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/signup_utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/entities/login/user_pin.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import '../../mocks.dart';
import '../../test_helpers.dart';
import '../../test_utils.dart';

void main() {
  final MockGraphQlClient GraphQlClient = MockGraphQlClient();

  testWidgets('should call ChangePinAction when intent is to change pin',
      (WidgetTester tester) async {
    final MiscState misc = MiscState.initial().copyWith.call(
          userPin: UserPin(isChangingPin: true),
        );

    final UserProfileState profileState =
        UserProfileState.initial().copyWith.userProfile!.call(
              primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            );

    final Store<AppState> store = Store<AppState>(
      initialState: AppState.initial().copyWith.call(
            miscState: misc,
            userProfileState: profileState,
          ),
    );

    await buildTestWidget(
      tester: tester,
      store: store,
      client: GraphQlClient,
      widget: Material(
        child: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(
              onPressed: () => SignUpUtils().signUpUser(
                  validateFormFields: true,
                  context: context,
                  createPin: '1111',
                  confirmPin: '1111'),
            );
          },
        ),
      ),
    );

    await tester.pump();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    expect(store.state.miscState!.userPin!.isChangingPin, false);
  });

  testWidgets('should call ChangePinAction when intent is forgot pin',
      (WidgetTester tester) async {
    final MiscState misc = MiscState.initial().copyWith.call(
          userPin: UserPin(forgotPIN: true, recoveryOtp: '123456'),
        );

    final UserProfileState profileState =
        UserProfileState.initial().copyWith.userProfile!.call(
              primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            );

    final Store<AppState> store = Store<AppState>(
      initialState: AppState.initial().copyWith.call(
            miscState: misc,
            userProfileState: profileState,
          ),
    );

    EndPointsContextSubject().contexts.add(testAppContexts);

    await buildTestWidget(
      tester: tester,
      store: store,
      client: GraphQlClient,
      widget: Material(
        child: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(
              onPressed: () => SignUpUtils().signUpUser(
                  validateFormFields: true,
                  context: context,
                  createPin: '1111',
                  confirmPin: '1111'),
            );
          },
        ),
      ),
    );

    await tester.pump();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    expect(find.byKey(feedbackBottomSheet), findsOneWidget);
  });
}
