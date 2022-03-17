// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/update_connectivity_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/infrastructure/connectivity/connectivity_interface.dart';
import 'package:myafyahub/infrastructure/connectivity/mobile_connectivity_status.dart';

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
          onContinue: (String PIN, String confirmPIN) async {
            final bool hasConnection =
                await connectivityStatus.checkConnection();

            StoreProvider.dispatch(
              context,
              UpdateConnectivityAction(hasConnection: hasConnection),
            );

            if (!hasConnection) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(noInternetConnection),
                ),
              );
              return;
            }

            setUserPIN(context: context, newPIN: PIN, confirmPIN: confirmPIN);
          },
        );
      },
    );
  }
}
