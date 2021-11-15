import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class UpdateProfileTermsAndConditionsAction extends ReduxAction<AppState> {
  UpdateProfileTermsAndConditionsAction({
    required this.isAccepted,
  });

  final bool isAccepted;

  @override
  AppState reduce() {
    final AppState newState =
        state.copyWith.userProfileState!.userProfile!.call(
      termsAccepted: this.isAccepted,
    );

    return newState;
  }
}
