// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MiscState _$_$_MiscStateFromJson(Map<String, dynamic> json) {
  return _$_MiscState(
    phoneLogin: json['phoneLogin'] == null
        ? null
        : PhoneLogin.fromJson(json['phoneLogin'] as Map<String, dynamic>),
    userPin: json['userPin'] == null
        ? null
        : UserPin.fromJson(json['userPin'] as Map<String, dynamic>),
    libraryListItems: json['libraryListItems'] as List<dynamic>?,
    healthPagePINInputTime: json['healthPagePINInputTime'] as String?,
    faqState: json['faqState'] == null
        ? null
        : FAQState.fromJson(json['faqState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MiscStateToJson(_$_MiscState instance) =>
    <String, dynamic>{
      'phoneLogin': instance.phoneLogin,
      'userPin': instance.userPin,
      'libraryListItems': instance.libraryListItems,
      'healthPagePINInputTime': instance.healthPagePINInputTime,
      'faqState': instance.faqState,
    };

_$_FAQState _$_$_FAQStateFromJson(Map<String, dynamic> json) {
  return _$_FAQState();
}

Map<String, dynamic> _$_$_FAQStateToJson(_$_FAQState instance) =>
    <String, dynamic>{};
