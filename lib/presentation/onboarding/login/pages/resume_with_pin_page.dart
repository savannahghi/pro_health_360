// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/onboarding_page_wrapper.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/pin_verification.dart';

class ResumeWithPinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        final String firstName = toBeginningOfSentenceCase(
          vm.appState.userProfileState!.userProfile!.userBioData!.firstName!
              .getValue(),
        )!;
        return OnboardingPageWrapper(
          title: OnboardingStrings.of(context)!.greetUser(firstName),
          description: OnboardingStrings.of(context)!.enterPinToContinueText(),
          svgPath: shieldIconImgUrl,
          child: const PinVerification(),
        );
      },
    );
  }
}
