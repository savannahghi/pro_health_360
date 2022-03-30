import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/alcohol_substance_use_state.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/screening_questions_list.dart';

class UpdateAlcoholStateAction extends ReduxAction<AppState> {
  UpdateAlcoholStateAction({
    this.errorFetchingQuestions,
    this.timeoutFetchingQuestions,
    this.screeningQuestions,
    this.errorAnsweringQuestions,
  });

  final bool? errorFetchingQuestions;
  final bool? errorAnsweringQuestions;
  final ScreeningQuestionsList? screeningQuestions;
  final bool? timeoutFetchingQuestions;

  @override
  Future<AppState?> reduce() async {
    final AlcoholSubstanceUseState newAlcoholSubstanceUseState =
        AlcoholSubstanceUseState(
      screeningQuestions: screeningQuestions ??
          state.miscState?.screeningToolsState?.alcoholSubstanceUseState
              ?.screeningQuestions,
      errorFetchingQuestions: errorFetchingQuestions ??
          state.miscState?.screeningToolsState?.alcoholSubstanceUseState
              ?.errorFetchingQuestions,
      errorAnsweringQuestions: errorAnsweringQuestions ??
          state.miscState?.screeningToolsState?.alcoholSubstanceUseState
              ?.errorAnsweringQuestions,
      timeoutFetchingQuestions: timeoutFetchingQuestions ??
          state.miscState?.screeningToolsState?.alcoholSubstanceUseState
              ?.timeoutFetchingQuestions,
    );

    final AppState newState = state.copyWith(
      miscState: state.miscState?.copyWith(
        screeningToolsState: state.miscState?.screeningToolsState
            ?.copyWith(alcoholSubstanceUseState: newAlcoholSubstanceUseState),
      ),
    );
    return newState;
  }
}
