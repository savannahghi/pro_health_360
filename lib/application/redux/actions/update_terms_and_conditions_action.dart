import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';

class UpdateTermsAndConditionsAction extends ReduxAction<AppState> {
  UpdateTermsAndConditionsAction({
    required this.id,
    required this.termsString,
  });

  final String id;
  final String termsString;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.miscState!.call(
      termsAndConditions: TermsAndConditions(
        termsId: id,
        text: termsString,
      ),
    );

    return newState;
  }
}
