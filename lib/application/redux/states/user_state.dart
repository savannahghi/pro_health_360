import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/application/redux/states/auth_state.dart';
import 'package:myafyahub/application/redux/states/client_state.dart';
import 'package:myafyahub/application/redux/states/confidential_state.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    ClientState? clientState,
    AuthState? authState,
    ConfidentialState? confidentialState,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  factory UserState.initial() => UserState(
        clientState: ClientState.initial(),
        authState: AuthState.initial(),
        confidentialState: ConfidentialState.initial(),
      );
}
