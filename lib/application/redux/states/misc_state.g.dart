// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MiscState _$_$_MiscStateFromJson(Map<String, dynamic> json) {
  return _$_MiscState(
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
      'userPin': instance.userPin,
      'libraryListItems': instance.libraryListItems,
      'healthPagePINInputTime': instance.healthPagePINInputTime,
      'faqState': instance.faqState,
    };
