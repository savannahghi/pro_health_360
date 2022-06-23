// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/application/redux/actions/create_pin_action.dart';
import 'package:pro_health_360/application/redux/actions/update_connectivity_action.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/infrastructure/connectivity/connectivity_interface.dart';
import 'package:pro_health_360/infrastructure/connectivity/mobile_connectivity_status.dart';

class CreateNewPINPage extends StatelessWidget {
  CreateNewPINPage({ConnectivityChecker? connectivityStatus})
      : connectivityStatus = connectivityStatus ?? MobileConnectivityChecker();

  final ConnectivityChecker connectivityStatus;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        return CreateNewPINWidget(
          title: createNewPINTitleString,
          loading: vm.appState.wait!.isWaitingFor(createPinFlag),
          onContinue: (String pin, String confirmPIN) async {
            final bool hasConnection =
                await connectivityStatus.checkConnection();

            StoreProvider.dispatch(
              context,
              UpdateConnectivityAction(hasConnection: hasConnection),
            );

            if (!hasConnection) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(noInternetConnection)),
              );
              return;
            }

            // this is the Redux Action that store the PINs user enters
            StoreProvider.dispatch(
              context,
              UpdateOnboardingStateAction(pin: pin, confirmPIN: confirmPIN),
            );

            // this is the Redux Action that handles set PIN for an existing user
            StoreProvider.dispatch<AppState>(
              context,
              CreatePINAction(context: context),
            );
          },
        );
      },
    );
  }
}
