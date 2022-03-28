import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/alcohol_substance_use_state.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/contraceptive_state.dart';
import 'package:myafyahub/application/redux/states/tb_state.dart';
import 'package:myafyahub/application/redux/states/violence_state.dart';

class ScreeningToolsViewModel extends Vm {
  ScreeningToolsViewModel({
    required this.violenceState,
    required this.contraceptiveState,
    required this.tBState,
    required this.alcoholSubstanceUseState,
    this.wait,
  }) : super(
          equals: <Object?>[
            wait,
            violenceState,
            contraceptiveState,
            tBState,
            alcoholSubstanceUseState,
          ],
        );

  factory ScreeningToolsViewModel.fromStore(Store<AppState> store) {
    return ScreeningToolsViewModel(
      violenceState: store.state.miscState?.screeningToolsState?.violenceState,
      contraceptiveState:
          store.state.miscState?.screeningToolsState?.contraceptiveState,
      tBState: store.state.miscState?.screeningToolsState?.tbState,
      alcoholSubstanceUseState:
          store.state.miscState?.screeningToolsState?.alcoholSubstanceUseState,
      wait: store.state.wait,
    );
  }

  final AlcoholSubstanceUseState? alcoholSubstanceUseState;
  final ContraceptiveState? contraceptiveState;
  final TBState? tBState;
  final ViolenceState? violenceState;
  final Wait? wait;
}
