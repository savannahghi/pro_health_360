// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      userId: json['userID'] as String?,
      username: json['userName'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: genderFromJson(json['gender'] as String?),
      active: json['active'] as bool? ?? false,
      primaryContact: json['primaryContact'] == null
          ? null
          : Contact.fromJson(json['primaryContact'] as Map<String, dynamic>),
      secondaryContacts: (json['secondaryContacts'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      termsAccepted: json['termsAccepted'] as bool?,
      hasSetPin: json['hasSetPin'] as bool?,
      hasSetSecurityQuestions: json['hasSetSecurityQuestions'] as bool?,
      hasSetNickname: json['hasSetNickname'] as bool?,
      isPhoneVerified: json['isPhoneVerified'] as bool?,
      pinChangeRequired: json['pinChangeRequired'] as bool? ?? false,
      suspended: json['suspended'] as bool? ?? false,
      chatRoomToken: json['chatRoomToken'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'userID': instance.userId,
      'userName': instance.username,
      'avatar': instance.avatar,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': genderToJson(instance.gender),
      'active': instance.active,
      'primaryContact': instance.primaryContact,
      'secondaryContacts': instance.secondaryContacts,
      'languages': instance.languages,
      'termsAccepted': instance.termsAccepted,
      'hasSetPin': instance.hasSetPin,
      'hasSetSecurityQuestions': instance.hasSetSecurityQuestions,
      'hasSetNickname': instance.hasSetNickname,
      'isPhoneVerified': instance.isPhoneVerified,
      'pinChangeRequired': instance.pinChangeRequired,
      'suspended': instance.suspended,
      'chatRoomToken': instance.chatRoomToken,
    };
