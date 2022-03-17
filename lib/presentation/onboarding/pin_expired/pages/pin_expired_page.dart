import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/nav_path_config.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

class PinExpiredPage extends StatelessWidget {
  const PinExpiredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PINRequestScaffold(
      iconSvgPath: pinExpiredImage,
      title: pinExpiredTitle,
      message: pinExpiredDescription,
      actionText: changePinCTA,
      actionCallback: () {
        StoreProvider.dispatch(
          context,
          UpdateOnboardingStateAction(
            currentOnboardingStage: CurrentOnboardingStage.PINExpired,
          ),
        );

        final AppNavConfig config =
            navPathConfig(appState: StoreProvider.state<AppState>(context));

        Navigator.of(context).pushReplacementNamed(config.nextRoute);
      },
      actionKey: changeMyPinButtonKey,
    );
  }
}
