import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/tb_state.dart';
import 'package:myafyahub/domain/core/entities/core/screening_questions_list.dart';

class UpdateTBStateAction extends ReduxAction<AppState> {
  UpdateTBStateAction({
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
    final TBState newTBState = TBState(
      screeningQuestions: screeningQuestions ??
          state.miscState?.screeningToolsState?.tbState?.screeningQuestions,
      errorFetchingQuestions: errorFetchingQuestions ??
          state.miscState?.screeningToolsState?.tbState?.errorFetchingQuestions,
      errorAnsweringQuestions: errorAnsweringQuestions ??
          state
              .miscState?.screeningToolsState?.tbState?.errorAnsweringQuestions,
      timeoutFetchingQuestions: timeoutFetchingQuestions ??
          state.miscState?.screeningToolsState?.tbState
              ?.timeoutFetchingQuestions,
    );

    final AppState newState = state.copyWith(
      miscState: state.miscState?.copyWith(
        screeningToolsState:
            state.miscState?.screeningToolsState?.copyWith(tbState: newTBState),
      ),
    );
    return newState;
  }
}
