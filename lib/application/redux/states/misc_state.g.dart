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
    phoneSignUp: json['phoneSignUp'] == null
        ? null
        : PhoneSignUp.fromJson(json['phoneSignUp'] as Map<String, dynamic>),
    userPin: json['userPin'] == null
        ? null
        : UserPin.fromJson(json['userPin'] as Map<String, dynamic>),
    appErrorState: (json['appErrorState'] as List<dynamic>?)
        ?.map((e) => AppErrorState.fromJson(e as Map<String, dynamic>))
        .toSet(),
    bottomNavObj: json['bottomNavObj'] == null
        ? null
        : BottomNavObj.fromJson(json['bottomNavObj'] as Map<String, dynamic>),
    faqList: (json['faqList'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : FAQContent.fromJson(e as Map<String, dynamic>))
        .toList(),
    libraryListItems: json['libraryListItems'] as List<dynamic>?,
    appReviewObj: json['appReviewObj'] == null
        ? null
        : AppReviewObj.fromJson(json['appReviewObj'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MiscStateToJson(_$_MiscState instance) =>
    <String, dynamic>{
      'phoneLogin': instance.phoneLogin,
      'phoneSignUp': instance.phoneSignUp,
      'userPin': instance.userPin,
      'appErrorState': instance.appErrorState?.toList(),
      'bottomNavObj': instance.bottomNavObj,
      'faqList': instance.faqList,
      'libraryListItems': instance.libraryListItems,
      'appReviewObj': instance.appReviewObj,
    };
