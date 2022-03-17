// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pin_expired_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PINExpiredState _$PINExpiredStateFromJson(Map<String, dynamic> json) {
  return _PINExpiredState.fromJson(json);
}

/// @nodoc
class _$PINExpiredStateTearOff {
  const _$PINExpiredStateTearOff();

  _PINExpiredState call(
      {String? phone,
      bool? isPhoneVerified,
      bool? isPINChanged,
      String? pin,
      String? confirmPIN,
      String? otp}) {
    return _PINExpiredState(
      phone: phone,
      isPhoneVerified: isPhoneVerified,
      isPINChanged: isPINChanged,
      pin: pin,
      confirmPIN: confirmPIN,
      otp: otp,
    );
  }

  PINExpiredState fromJson(Map<String, Object?> json) {
    return PINExpiredState.fromJson(json);
  }
}

/// @nodoc
const $PINExpiredState = _$PINExpiredStateTearOff();

/// @nodoc
mixin _$PINExpiredState {
// The phone number
  String? get phone =>
      throw _privateConstructorUsedError; // Whether the phone number has been verified
  bool? get isPhoneVerified =>
      throw _privateConstructorUsedError; // Whether the PIN has been changed
  bool? get isPINChanged => throw _privateConstructorUsedError; // The PIN
  String? get pin => throw _privateConstructorUsedError; // The confirm PIN
  String? get confirmPIN =>
      throw _privateConstructorUsedError; // The OTP used when confirming the phone number
  String? get otp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PINExpiredStateCopyWith<PINExpiredState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PINExpiredStateCopyWith<$Res> {
  factory $PINExpiredStateCopyWith(
          PINExpiredState value, $Res Function(PINExpiredState) then) =
      _$PINExpiredStateCopyWithImpl<$Res>;
  $Res call(
      {String? phone,
      bool? isPhoneVerified,
      bool? isPINChanged,
      String? pin,
      String? confirmPIN,
      String? otp});
}

/// @nodoc
class _$PINExpiredStateCopyWithImpl<$Res>
    implements $PINExpiredStateCopyWith<$Res> {
  _$PINExpiredStateCopyWithImpl(this._value, this._then);

  final PINExpiredState _value;
  // ignore: unused_field
  final $Res Function(PINExpiredState) _then;

  @override
  $Res call({
    Object? phone = freezed,
    Object? isPhoneVerified = freezed,
    Object? isPINChanged = freezed,
    Object? pin = freezed,
    Object? confirmPIN = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPINChanged: isPINChanged == freezed
          ? _value.isPINChanged
          : isPINChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      pin: pin == freezed
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPIN: confirmPIN == freezed
          ? _value.confirmPIN
          : confirmPIN // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PINExpiredStateCopyWith<$Res>
    implements $PINExpiredStateCopyWith<$Res> {
  factory _$PINExpiredStateCopyWith(
          _PINExpiredState value, $Res Function(_PINExpiredState) then) =
      __$PINExpiredStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? phone,
      bool? isPhoneVerified,
      bool? isPINChanged,
      String? pin,
      String? confirmPIN,
      String? otp});
}

/// @nodoc
class __$PINExpiredStateCopyWithImpl<$Res>
    extends _$PINExpiredStateCopyWithImpl<$Res>
    implements _$PINExpiredStateCopyWith<$Res> {
  __$PINExpiredStateCopyWithImpl(
      _PINExpiredState _value, $Res Function(_PINExpiredState) _then)
      : super(_value, (v) => _then(v as _PINExpiredState));

  @override
  _PINExpiredState get _value => super._value as _PINExpiredState;

  @override
  $Res call({
    Object? phone = freezed,
    Object? isPhoneVerified = freezed,
    Object? isPINChanged = freezed,
    Object? pin = freezed,
    Object? confirmPIN = freezed,
    Object? otp = freezed,
  }) {
    return _then(_PINExpiredState(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPINChanged: isPINChanged == freezed
          ? _value.isPINChanged
          : isPINChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      pin: pin == freezed
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPIN: confirmPIN == freezed
          ? _value.confirmPIN
          : confirmPIN // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PINExpiredState implements _PINExpiredState {
  _$_PINExpiredState(
      {this.phone,
      this.isPhoneVerified,
      this.isPINChanged,
      this.pin,
      this.confirmPIN,
      this.otp});

  factory _$_PINExpiredState.fromJson(Map<String, dynamic> json) =>
      _$$_PINExpiredStateFromJson(json);

  @override // The phone number
  final String? phone;
  @override // Whether the phone number has been verified
  final bool? isPhoneVerified;
  @override // Whether the PIN has been changed
  final bool? isPINChanged;
  @override // The PIN
  final String? pin;
  @override // The confirm PIN
  final String? confirmPIN;
  @override // The OTP used when confirming the phone number
  final String? otp;

  @override
  String toString() {
    return 'PINExpiredState(phone: $phone, isPhoneVerified: $isPhoneVerified, isPINChanged: $isPINChanged, pin: $pin, confirmPIN: $confirmPIN, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PINExpiredState &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality()
                .equals(other.isPhoneVerified, isPhoneVerified) &&
            const DeepCollectionEquality()
                .equals(other.isPINChanged, isPINChanged) &&
            const DeepCollectionEquality().equals(other.pin, pin) &&
            const DeepCollectionEquality()
                .equals(other.confirmPIN, confirmPIN) &&
            const DeepCollectionEquality().equals(other.otp, otp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(isPhoneVerified),
      const DeepCollectionEquality().hash(isPINChanged),
      const DeepCollectionEquality().hash(pin),
      const DeepCollectionEquality().hash(confirmPIN),
      const DeepCollectionEquality().hash(otp));

  @JsonKey(ignore: true)
  @override
  _$PINExpiredStateCopyWith<_PINExpiredState> get copyWith =>
      __$PINExpiredStateCopyWithImpl<_PINExpiredState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PINExpiredStateToJson(this);
  }
}

abstract class _PINExpiredState implements PINExpiredState {
  factory _PINExpiredState(
      {String? phone,
      bool? isPhoneVerified,
      bool? isPINChanged,
      String? pin,
      String? confirmPIN,
      String? otp}) = _$_PINExpiredState;

  factory _PINExpiredState.fromJson(Map<String, dynamic> json) =
      _$_PINExpiredState.fromJson;

  @override // The phone number
  String? get phone;
  @override // Whether the phone number has been verified
  bool? get isPhoneVerified;
  @override // Whether the PIN has been changed
  bool? get isPINChanged;
  @override // The PIN
  String? get pin;
  @override // The confirm PIN
  String? get confirmPIN;
  @override // The OTP used when confirming the phone number
  String? get otp;
  @override
  @JsonKey(ignore: true)
  _$PINExpiredStateCopyWith<_PINExpiredState> get copyWith =>
      throw _privateConstructorUsedError;
}
