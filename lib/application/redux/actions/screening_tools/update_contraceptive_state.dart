import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/contraceptive_state.dart';
import 'package:myafyahub/domain/core/entities/core/screening_questions_list.dart';

class UpdateContraceptiveStateAction extends ReduxAction<AppState> {
  UpdateContraceptiveStateAction({
    this.errorFetchingQuestions,
    this.timeoutFetchingQuestions,
    this.screeningQuestions,
  });

  final bool? errorFetchingQuestions;
  final ScreeningQuestionsList? screeningQuestions;
  final bool? timeoutFetchingQuestions;

  @override
  Future<AppState?> reduce() async {
    final ContraceptiveState newContraceptiveState = ContraceptiveState(
      screeningQuestions: screeningQuestions ??
          state.miscState?.screeningToolsState?.contraceptiveState
              ?.screeningQuestions,
      errorFetchingQuestions: errorFetchingQuestions ??
          state.miscState?.screeningToolsState?.contraceptiveState
              ?.errorFetchingQuestions,
      timeoutFetchingQuestions: timeoutFetchingQuestions ??
          state.miscState?.screeningToolsState?.contraceptiveState
              ?.timeoutFetchingQuestions,
    );

    final AppState newState = state.copyWith(
      miscState: state.miscState?.copyWith(
        screeningToolsState: state.miscState?.screeningToolsState
            ?.copyWith(contraceptiveState: newContraceptiveState),
      ),
    );
    return newState;
  }
}
