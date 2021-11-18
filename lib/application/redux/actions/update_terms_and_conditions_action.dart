import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';

class UpdateTermsAndConditionsAction extends ReduxAction<MainAppState> {
  UpdateTermsAndConditionsAction({
    this.id,
    this.termsString,
    this.isAccepted,
  });

  final String? id;
  final String? termsString;
  final bool? isAccepted;

  @override
  MainAppState reduce() {
    final bool? termsAccepted =
        state.clientState?.clientProfile?.user?.termsAccepted;

    final TermsAndConditions termsAndConditions =
        state.miscState!.termsAndConditions!;

    final MainAppState newState = state.copyWith(
      miscState: state.miscState?.copyWith(
        termsAndConditions: TermsAndConditions(
          termsId: id ?? termsAndConditions.termsId,
          text: termsString ?? termsAndConditions.text,
        ),
      ),
      clientState: state.clientState?.copyWith.clientProfile?.call(
        user: state.clientState?.clientProfile?.user?.copyWith(
          termsAccepted: isAccepted ?? termsAccepted,
        ),
      ),
    );

    return newState;
  }
}
