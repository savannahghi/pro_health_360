// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/phone_signup.dart';

class PhoneSignUpViewModel {
  final PhoneSignUp? phoneSignUpState;

  PhoneSignUpViewModel({required this.phoneSignUpState});

  static PhoneSignUpViewModel fromStore(Store<AppState> store) {
    return PhoneSignUpViewModel(
        phoneSignUpState: store.state.miscState!.phoneSignUp);
  }
}
