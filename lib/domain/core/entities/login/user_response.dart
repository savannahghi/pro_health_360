// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/client_state.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse({
    @JsonKey(name: 'credentials') AuthCredentials? credentials,
    @JsonKey(name: 'clientProfile') ClientState? clientState,
    @JsonKey(name: 'getStreamToken') String? streamToken,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
