import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';

class UpdateTermsAndConditionsAction extends ReduxAction<AppState> {
  UpdateTermsAndConditionsAction({
    this.id,
    this.termsString,
    this.isAccepted,
  });

  final String? id;
  final String? termsString;
  final bool? isAccepted;

  @override
  AppState reduce() {
    final bool termsAccepted =
        state.userProfileState!.userProfile!.termsAccepted!;
    final TermsAndConditions termsAndConditions =
        state.miscState!.termsAndConditions!;

    final AppState newState = state.copyWith.call(
      miscState: state.miscState!.copyWith.call(
        termsAndConditions: TermsAndConditions(
          termsId: id ?? termsAndConditions.termsId,
          text: termsString ?? termsAndConditions.text,
        ),
      ),
      userProfileState: state.userProfileState!.copyWith.call(
        userProfile: state.userProfileState!.userProfile!.copyWith.call(
          termsAccepted: isAccepted ?? termsAccepted,
        ),
      ),
    );

    return newState;
  }
}
