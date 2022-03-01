// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/client_state.dart';

part 'phone_login_response.freezed.dart';
part 'phone_login_response.g.dart';

@freezed
class PhoneLoginResponse with _$PhoneLoginResponse {
  factory PhoneLoginResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'credentials') AuthCredentials? credentials,
    @JsonKey(name: 'clientProfile') ClientState? clientState,
    @JsonKey(name: 'getStreamToken') String? streamToken,
  }) = _PhoneLoginResponse;

  factory PhoneLoginResponse.fromJson(Map<String, dynamic> json) =>
    _$PhoneLoginResponseFromJson(json);

}
