// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_expired_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PINExpiredState _$$_PINExpiredStateFromJson(Map<String, dynamic> json) =>
    _$_PINExpiredState(
      phone: json['phone'] as String?,
      isPhoneVerified: json['isPhoneVerified'] as bool?,
      isPINChanged: json['isPINChanged'] as bool?,
      pin: json['pin'] as String?,
      confirmPIN: json['confirmPIN'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$$_PINExpiredStateToJson(_$_PINExpiredState instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'isPhoneVerified': instance.isPhoneVerified,
      'isPINChanged': instance.isPINChanged,
      'pin': instance.pin,
      'confirmPIN': instance.confirmPIN,
      'otp': instance.otp,
    };
