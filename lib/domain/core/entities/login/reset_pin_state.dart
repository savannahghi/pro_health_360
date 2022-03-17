// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_pin_state.freezed.dart';
part 'reset_pin_state.g.dart';

@freezed
class ResetPINState with _$ResetPINState {
  factory ResetPINState({
    String? phone,
    //If the user has set their PIN
    bool? isPINSet,
  }) = _ResetPINState;

  factory ResetPINState.fromJson(Map<String, dynamic> json) =>
      _$ResetPINStateFromJson(json);

  factory ResetPINState.initial() => ResetPINState(
        phone: UNKNOWN,
        isPINSet: false,
      );
}
