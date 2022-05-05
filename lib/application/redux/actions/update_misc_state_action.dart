// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class UpdateMiscStateAction extends ReduxAction<AppState> {
  UpdateMiscStateAction({
    this.inactiveTime,
    this.resumeWithPin,
  });

  final String? inactiveTime;
  final bool? resumeWithPin;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      miscState: state.miscState!.copyWith(
        inactiveTime: inactiveTime ?? state.miscState?.inactiveTime,
        resumeWithPin: resumeWithPin ?? state.miscState?.resumeWithPin,
      ),
    );

    return newState;
  }
}
