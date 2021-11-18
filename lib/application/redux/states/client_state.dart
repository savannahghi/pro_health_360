import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/client_profile.dart';

part 'client_state.freezed.dart';
part 'client_state.g.dart';

@freezed
class ClientState with _$ClientState {
  factory ClientState({ClientProfile? clientProfile}) = _ClientState;

  factory ClientState.fromJson(Map<String, dynamic> json) =>
      _$ClientStateFromJson(json);

  factory ClientState.initial() =>
      ClientState(clientProfile: ClientProfile.initial());
}
