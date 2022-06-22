import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/alcohol_substance_use_state.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/contraceptive_state.dart';
import 'package:pro_health_360/application/redux/states/screening_tools_state.dart';
import 'package:pro_health_360/application/redux/states/tb_state.dart';
import 'package:pro_health_360/application/redux/states/violence_state.dart';
import 'package:pro_health_360/domain/core/entities/core/available_screening_tools.dart';

class UpdateScreeningToolsState extends ReduxAction<AppState> {
  UpdateScreeningToolsState({
    this.violenceState,
    this.contraceptiveState,
    this.tbState,
    this.alcoholSubstanceUseState,
    this.availableScreeningTools,
  });

  final AlcoholSubstanceUseState? alcoholSubstanceUseState;
  final AvailableScreeningTools? availableScreeningTools;
  final ContraceptiveState? contraceptiveState;
  final TBState? tbState;
  final ViolenceState? violenceState;

  @override
  Future<AppState?> reduce() async {
    final ScreeningToolsState newScreeningToolsState = ScreeningToolsState(
      alcoholSubstanceUseState: alcoholSubstanceUseState ??
          state.miscState?.screeningToolsState?.alcoholSubstanceUseState,
      violenceState:
          violenceState ?? state.miscState?.screeningToolsState?.violenceState,
      contraceptiveState: contraceptiveState ??
          state.miscState?.screeningToolsState?.contraceptiveState,
      tbState: tbState ?? state.miscState?.screeningToolsState?.tbState,
      availableScreeningTools: availableScreeningTools ??
          state.miscState?.screeningToolsState?.availableScreeningTools,
    );

    final AppState newState = state.copyWith(
      miscState: state.miscState?.copyWith(
        screeningToolsState: newScreeningToolsState,
      ),
    );
    return newState;
  }
}
