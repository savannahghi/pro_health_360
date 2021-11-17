import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    @JsonKey(name: 'userID') String? userId,
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'userName') String? username,
    @JsonKey(name: 'firstName') String? firstName,
    @JsonKey(name: 'lastName') String? lastName,
    bool? active,
    @JsonKey(name: 'contacts') List<Contact>? contacts,
    @JsonKey(name: 'termsAccepted') bool? termsAccepted,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.initial() => User(
        userId: UNKNOWN,
        displayName: UNKNOWN,
        username: UNKNOWN,
        firstName: UNKNOWN,
        lastName: UNKNOWN,
        active: false,
        termsAccepted: false,
      );
}
