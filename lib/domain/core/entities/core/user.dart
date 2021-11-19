import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    @JsonKey(name: 'userID') String? userId,
    @JsonKey(name: 'userName') String? username, // This is the nickname
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'displayName') String? displayName, // This is the @handle
    @JsonKey(name: 'firstName') String? firstName,
    @JsonKey(name: 'middleName') String? middleName,
    @JsonKey(name: 'lastName') String? lastName,
    @JsonKey(name: 'gender') Gender? gender,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'contacts') List<Contact>? contacts,
    @JsonKey(name: 'languages') List<String>? languages,
    @JsonKey(name: 'termsAccepted') bool? termsAccepted,
    @JsonKey(name: 'pinChangeRequired', defaultValue: false)
        bool? pinChangeRequired,
    @JsonKey(name: 'suspended', defaultValue: false) bool? suspended,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.initial() => User(
        avatar: UNKNOWN,
        userId: UNKNOWN,
        username: UNKNOWN,
        displayName: UNKNOWN,
        firstName: UNKNOWN,
        middleName: UNKNOWN,
        lastName: UNKNOWN,
        gender: Gender.unknown,
        active: false,
        contacts: <Contact>[Contact.initial()],
        languages: <String>[],
        termsAccepted: false,
        pinChangeRequired: false,
      );
}
