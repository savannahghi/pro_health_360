import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';

part 'client_profile.freezed.dart';
part 'client_profile.g.dart';

@freezed
class ClientProfile with _$ClientProfile {
  factory ClientProfile({
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'active') bool? active,
  }) = _ClientProfile;

  factory ClientProfile.fromJson(Map<String, dynamic> json) =>
      _$ClientProfileFromJson(json);
}
