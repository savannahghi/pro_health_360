import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/application/redux/states/alcohol_substance_use_state.dart';
import 'package:myafyahub/application/redux/states/contraceptive_state.dart';
import 'package:myafyahub/application/redux/states/tb_state.dart';
import 'package:myafyahub/application/redux/states/violence_state.dart';

part 'screening_tools_state.g.dart';
part 'screening_tools_state.freezed.dart';

@freezed
class ScreeningToolsState with _$ScreeningToolsState {
  factory ScreeningToolsState({
    ViolenceState? violenceState,
    ContraceptiveState? contraceptiveState,
    TBState? tbState,
    AlcoholSubstanceUseState? alcoholSubstanceUseState,
  }) = _ScreeningToolsState;

  factory ScreeningToolsState.fromJson(Map<String, dynamic> json) =>
      _$ScreeningToolsStateFromJson(json);

  factory ScreeningToolsState.initial() => ScreeningToolsState(
        violenceState: ViolenceState.initial(),
        contraceptiveState: ContraceptiveState.initial(),
        tbState: TBState.initial(),
        alcoholSubstanceUseState: AlcoholSubstanceUseState.initial(),
      );
}
