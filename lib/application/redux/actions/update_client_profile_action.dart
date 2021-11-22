// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

// TODO(abiud): rewrite this action to cater for the new fields
class UpdateClientProfileAction extends ReduxAction<AppState> {
  UpdateClientProfileAction({
    this.active,
    this.lastMoodRecordedDate,
    this.nickName,
    this.isSignedIn,
    this.treatmentEnrollmentDate,
  });

  final bool? active;
  final String? lastMoodRecordedDate;
  final String? nickName;
  final bool? isSignedIn;
  final String? treatmentEnrollmentDate;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      clientState: state.clientState?.copyWith.call(
        active: this.active ?? state.clientState?.active,
        isSignedIn: this.isSignedIn ?? state.clientState?.isSignedIn,
        lastMoodRecordedDate: this.lastMoodRecordedDate ??
            state.clientState?.lastMoodRecordedDate,
        treatmentEnrollmentDate: this.treatmentEnrollmentDate ??
            state.clientState!.treatmentEnrollmentDate,
      ),
    );

    return newState;
  }
}
