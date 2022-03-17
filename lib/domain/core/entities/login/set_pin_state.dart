// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_pin_state.freezed.dart';
part 'set_pin_state.g.dart';

@freezed
class SetPINState with _$SetPINState {
  factory SetPINState({
    String? phone,
    //If the user has set their PIN
    bool? isPINSet,
  }) = _SetPINState;

  factory SetPINState.fromJson(Map<String, dynamic> json) =>
      _$SetPINStateFromJson(json);

  factory SetPINState.initial() => SetPINState(
        phone: UNKNOWN,
        isPINSet: false,
      );
}
