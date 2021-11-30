// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MiscState _$_$_MiscStateFromJson(Map<String, dynamic> json) {
  return _$_MiscState(
    initialRoute: json['initialRoute'] as String?,
    userPin: json['userPin'] == null
        ? null
        : UserPin.fromJson(json['userPin'] as Map<String, dynamic>),
    libraryListItems: json['libraryListItems'] as List<dynamic>?,
    healthPagePINInputTime: json['healthPagePINInputTime'] as String?,
  );
}

Map<String, dynamic> _$_$_MiscStateToJson(_$_MiscState instance) =>
    <String, dynamic>{
      'initialRoute': instance.initialRoute,
      'userPin': instance.userPin,
      'libraryListItems': instance.libraryListItems,
      'healthPagePINInputTime': instance.healthPagePINInputTime,
    };
