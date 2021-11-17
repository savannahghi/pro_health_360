import 'package:freezed_annotation/freezed_annotation.dart';

part 'confidential_state.freezed.dart';
part 'confidential_state.g.dart';

@freezed
class ConfidentialState with _$ConfidentialState {
  factory ConfidentialState() = _ConfidentialState;

  factory ConfidentialState.fromJson(Map<String, dynamic> json) =>
      _$ConfidentialStateFromJson(json);

  factory ConfidentialState.initial() => ConfidentialState();

  // TODO(abiud): add the following states
  // - SensitiveAccess
  // - LastSensitiveAccess
  // - SensitiveRoutes
}
