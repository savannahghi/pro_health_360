// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'phone_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneLogin _$PhoneLoginFromJson(Map<String, dynamic> json) {
  return _PhoneLogin.fromJson(json);
}

/// @nodoc
class _$PhoneLoginTearOff {
  const _$PhoneLoginTearOff();

  _PhoneLogin call(
      {bool invalidCredentials = false, String? phoneNumber, String? pinCode}) {
    return _PhoneLogin(
      invalidCredentials: invalidCredentials,
      phoneNumber: phoneNumber,
      pinCode: pinCode,
    );
  }

  PhoneLogin fromJson(Map<String, Object> json) {
    return PhoneLogin.fromJson(json);
  }
}

/// @nodoc
const $PhoneLogin = _$PhoneLoginTearOff();

/// @nodoc
mixin _$PhoneLogin {
  bool get invalidCredentials => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get pinCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneLoginCopyWith<PhoneLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneLoginCopyWith<$Res> {
  factory $PhoneLoginCopyWith(
          PhoneLogin value, $Res Function(PhoneLogin) then) =
      _$PhoneLoginCopyWithImpl<$Res>;
  $Res call({bool invalidCredentials, String? phoneNumber, String? pinCode});
}

/// @nodoc
class _$PhoneLoginCopyWithImpl<$Res> implements $PhoneLoginCopyWith<$Res> {
  _$PhoneLoginCopyWithImpl(this._value, this._then);

  final PhoneLogin _value;
  // ignore: unused_field
  final $Res Function(PhoneLogin) _then;

  @override
  $Res call({
    Object? invalidCredentials = freezed,
    Object? phoneNumber = freezed,
    Object? pinCode = freezed,
  }) {
    return _then(_value.copyWith(
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: pinCode == freezed
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PhoneLoginCopyWith<$Res> implements $PhoneLoginCopyWith<$Res> {
  factory _$PhoneLoginCopyWith(
          _PhoneLogin value, $Res Function(_PhoneLogin) then) =
      __$PhoneLoginCopyWithImpl<$Res>;
  @override
  $Res call({bool invalidCredentials, String? phoneNumber, String? pinCode});
}

/// @nodoc
class __$PhoneLoginCopyWithImpl<$Res> extends _$PhoneLoginCopyWithImpl<$Res>
    implements _$PhoneLoginCopyWith<$Res> {
  __$PhoneLoginCopyWithImpl(
      _PhoneLogin _value, $Res Function(_PhoneLogin) _then)
      : super(_value, (v) => _then(v as _PhoneLogin));

  @override
  _PhoneLogin get _value => super._value as _PhoneLogin;

  @override
  $Res call({
    Object? invalidCredentials = freezed,
    Object? phoneNumber = freezed,
    Object? pinCode = freezed,
  }) {
    return _then(_PhoneLogin(
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: pinCode == freezed
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhoneLogin implements _PhoneLogin {
  _$_PhoneLogin(
      {this.invalidCredentials = false, this.phoneNumber, this.pinCode});

  factory _$_PhoneLogin.fromJson(Map<String, dynamic> json) =>
      _$_$_PhoneLoginFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool invalidCredentials;
  @override
  final String? phoneNumber;
  @override
  final String? pinCode;

  @override
  String toString() {
    return 'PhoneLogin(invalidCredentials: $invalidCredentials, phoneNumber: $phoneNumber, pinCode: $pinCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhoneLogin &&
            (identical(other.invalidCredentials, invalidCredentials) ||
                const DeepCollectionEquality()
                    .equals(other.invalidCredentials, invalidCredentials)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.pinCode, pinCode) ||
                const DeepCollectionEquality().equals(other.pinCode, pinCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(invalidCredentials) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(pinCode);

  @JsonKey(ignore: true)
  @override
  _$PhoneLoginCopyWith<_PhoneLogin> get copyWith =>
      __$PhoneLoginCopyWithImpl<_PhoneLogin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PhoneLoginToJson(this);
  }
}

abstract class _PhoneLogin implements PhoneLogin {
  factory _PhoneLogin(
      {bool invalidCredentials,
      String? phoneNumber,
      String? pinCode}) = _$_PhoneLogin;

  factory _PhoneLogin.fromJson(Map<String, dynamic> json) =
      _$_PhoneLogin.fromJson;

  @override
  bool get invalidCredentials => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get pinCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PhoneLoginCopyWith<_PhoneLogin> get copyWith =>
      throw _privateConstructorUsedError;
}
