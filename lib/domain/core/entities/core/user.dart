// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/application/core/services/utils.dart';

// Project imports:
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
    @JsonKey(name: 'dateOfBirth') String? dateOfBirth,
    @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
        Gender? gender,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'primaryContact') Contact? primaryContact,
    @JsonKey(name: 'secondaryContacts') List<Contact?>? secondaryContacts,
    @JsonKey(name: 'languages') List<String>? languages,
    @JsonKey(name: 'termsAccepted') bool? termsAccepted,
    @JsonKey(name: 'hasSetPin') bool? hasSetPin,
    @JsonKey(name: 'hasSetSecurityQuestions') bool? hasSetSecurityQuestions,
    @JsonKey(name: 'hasSetNickname') bool? hasSetNickname,
    @JsonKey(name: 'isPhoneVerified') bool? isPhoneVerified,
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
        dateOfBirth: UNKNOWN,
        gender: Gender.unknown,
        active: false,
        secondaryContacts: <Contact>[],
        primaryContact: Contact.initial(),
        languages: <String>[],
        termsAccepted: false,
        pinChangeRequired: false,
      );
}
