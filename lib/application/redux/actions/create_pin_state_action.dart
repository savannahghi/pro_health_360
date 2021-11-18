import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/create_pin.dart';

class CreatePINStateAction extends ReduxAction<MainAppState> {
  CreatePINStateAction({
    this.confirmPIN,
    this.newPIN,
  });

  final String? confirmPIN;
  final String? newPIN;

  @override
  MainAppState reduce() {
    final MainAppState newState = state.copyWith.onboardingState!.call(
        createPINState: CreatePINState(newPIN: newPIN, confirmPIN: confirmPIN));

    return newState;
  }
}
