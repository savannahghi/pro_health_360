import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/violence_state.dart';
import 'package:myafyahub/domain/core/entities/core/screening_questions_list.dart';

class UpdateViolenceStateAction extends ReduxAction<AppState> {
  UpdateViolenceStateAction({
    this.errorFetchingQuestions,
    this.timeoutFetchingQuestions,
    this.screeningQuestions,
  });

  final bool? errorFetchingQuestions;
  final ScreeningQuestionsList? screeningQuestions;
  final bool? timeoutFetchingQuestions;

  @override
  Future<AppState?> reduce() async {
    final ViolenceState newViolenceState = ViolenceState(
      screeningQuestions: screeningQuestions ??
          state.miscState?.screeningToolsState?.violenceState
              ?.screeningQuestions,
      errorFetchingQuestions: errorFetchingQuestions ??
          state.miscState?.screeningToolsState?.violenceState
              ?.errorFetchingQuestions,
      timeoutFetchingQuestions: timeoutFetchingQuestions ??
          state.miscState?.screeningToolsState?.violenceState
              ?.timeoutFetchingQuestions,
    );

    final AppState newState = state.copyWith(
      miscState: state.miscState?.copyWith(
        screeningToolsState: state.miscState?.screeningToolsState
            ?.copyWith(violenceState: newViolenceState),
      ),
    );
    return newState;
  }
}
