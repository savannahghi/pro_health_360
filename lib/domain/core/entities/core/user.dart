import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/core/contact.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    @JsonKey(name: 'userID') String? userId,
    @JsonKey(name: 'userName') String? username, // This is the nickname
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'name') String? name, // This is the @handle
    @JsonKey(name: 'firstName') String? firstName,
    @JsonKey(name: 'lastName') String? lastName,
    @JsonKey(name: 'dateOfBirth') String? dateOfBirth,
    @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
        Gender? gender,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'primaryContact') Contact? primaryContact,
    @JsonKey(name: 'secondaryContacts') List<Contact?>? secondaryContacts,
    @JsonKey(name: 'languages') List<String>? languages,
    @JsonKey(name: 'termsAccepted', defaultValue: false) bool? termsAccepted,
    @JsonKey(name: 'hasSetPin', defaultValue: false) bool? hasSetPin,
    @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
        bool? hasSetSecurityQuestions,
    @JsonKey(name: 'hasSetNickname', defaultValue: false) bool? hasSetNickname,
    @JsonKey(name: 'isPhoneVerified', defaultValue: false)
        bool? isPhoneVerified,

    /// Whether this user needs to change their PIN
    ///
    /// This is normally used to signify that this user is a new user
    @JsonKey(name: 'pinChangeRequired', defaultValue: false)
        bool? pinChangeRequired,

    /// Used to indicate that the user's PIN has been reset by someone else
    ///
    /// This is used to trigger the change PIN workflow
    @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
        bool? pinUpdateRequired,
    @JsonKey(name: 'suspended', defaultValue: false) bool? suspended,
    String? streamToken,
    @JsonKey(name: 'roles') List<Role>? roles,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.initial() => User(
        avatar: UNKNOWN,
        userId: UNKNOWN,
        username: UNKNOWN,
        name: UNKNOWN,
        firstName: UNKNOWN,
        lastName: UNKNOWN,
        dateOfBirth: UNKNOWN,
        gender: Gender.unknown,
        active: false,
        secondaryContacts: <Contact>[],
        primaryContact: Contact.initial(),
        languages: <String>[],
        termsAccepted: false,
        pinChangeRequired: false,
        streamToken: UNKNOWN,
        pinUpdateRequired: false,
        hasSetNickname: false,
        hasSetPin: false,
        hasSetSecurityQuestions: false,
        isPhoneVerified: false,
        suspended: false,
        roles: <Role>[],
      );
}
