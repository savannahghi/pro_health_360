// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/surveys/survey.dart';

class UpdateMiscStateAction extends ReduxAction<AppState> {
  UpdateMiscStateAction({
    this.inactiveTime,
    this.resumeWithPin,
    this.availableSurveyList,
    this.resumeWithPINRetries,
    this.selectedSurvey,
  });

  final List<Survey>? availableSurveyList;
  final String? inactiveTime;
  final bool? resumeWithPin;
  final int? resumeWithPINRetries;
  final Survey? selectedSurvey;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      miscState: state.miscState!.copyWith(
        inactiveTime: inactiveTime ?? state.miscState?.inactiveTime,
        resumeWithPin: resumeWithPin ?? state.miscState?.resumeWithPin,
        availableSurveysList:
            availableSurveyList ?? state.miscState?.availableSurveysList,
        resumeWithPINRetries:
            resumeWithPINRetries ?? state.miscState?.resumeWithPINRetries,
        selectedSurvey: selectedSurvey ?? state.miscState?.selectedSurvey,
      ),
    );

    return newState;
  }
}
