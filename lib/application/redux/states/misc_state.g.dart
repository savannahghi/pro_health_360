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
    changePIN: json['changePIN'] == null
        ? null
        : ChangePIN.fromJson(json['changePIN'] as Map<String, dynamic>),
    userPin: json['userPin'] == null
        ? null
        : UserPin.fromJson(json['userPin'] as Map<String, dynamic>),
    appErrorState: (json['appErrorState'] as List<dynamic>?)
        ?.map((e) => AppErrorState.fromJson(e as Map<String, dynamic>))
        .toSet(),
    bottomNavObj: json['bottomNavObj'] == null
        ? null
        : BottomNavObj.fromJson(json['bottomNavObj'] as Map<String, dynamic>),
    libraryListItems: json['libraryListItems'] as List<dynamic>?,
    healthPagePINInputTime: json['healthPagePINInputTime'] as String?,
  );
}

Map<String, dynamic> _$_$_MiscStateToJson(_$_MiscState instance) =>
    <String, dynamic>{
      'phoneLogin': instance.phoneLogin,
      'changePIN': instance.changePIN,
      'userPin': instance.userPin,
      'appErrorState': instance.appErrorState?.toList(),
      'bottomNavObj': instance.bottomNavObj,
      'libraryListItems': instance.libraryListItems,
      'healthPagePINInputTime': instance.healthPagePINInputTime,
    };
