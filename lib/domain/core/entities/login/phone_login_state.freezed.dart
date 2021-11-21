// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'phone_login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneLoginState _$PhoneLoginStateFromJson(Map<String, dynamic> json) {
  return _PhoneLoginState.fromJson(json);
}

/// @nodoc
class _$PhoneLoginStateTearOff {
  const _$PhoneLoginStateTearOff();

  _PhoneLoginState call(
      {bool invalidCredentials = false, String? phoneNumber, String? pinCode}) {
    return _PhoneLoginState(
      invalidCredentials: invalidCredentials,
      phoneNumber: phoneNumber,
      pinCode: pinCode,
    );
  }

  PhoneLoginState fromJson(Map<String, Object> json) {
    return PhoneLoginState.fromJson(json);
  }
}

/// @nodoc
const $PhoneLoginState = _$PhoneLoginStateTearOff();

/// @nodoc
mixin _$PhoneLoginState {
  bool get invalidCredentials => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get pinCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneLoginStateCopyWith<PhoneLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneLoginStateCopyWith<$Res> {
  factory $PhoneLoginStateCopyWith(
          PhoneLoginState value, $Res Function(PhoneLoginState) then) =
      _$PhoneLoginStateCopyWithImpl<$Res>;
  $Res call({bool invalidCredentials, String? phoneNumber, String? pinCode});
}

/// @nodoc
class _$PhoneLoginStateCopyWithImpl<$Res>
    implements $PhoneLoginStateCopyWith<$Res> {
  _$PhoneLoginStateCopyWithImpl(this._value, this._then);

  final PhoneLoginState _value;
  // ignore: unused_field
  final $Res Function(PhoneLoginState) _then;

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
abstract class _$PhoneLoginStateCopyWith<$Res>
    implements $PhoneLoginStateCopyWith<$Res> {
  factory _$PhoneLoginStateCopyWith(
          _PhoneLoginState value, $Res Function(_PhoneLoginState) then) =
      __$PhoneLoginStateCopyWithImpl<$Res>;
  @override
  $Res call({bool invalidCredentials, String? phoneNumber, String? pinCode});
}

/// @nodoc
class __$PhoneLoginStateCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$PhoneLoginStateCopyWith<$Res> {
  __$PhoneLoginStateCopyWithImpl(
      _PhoneLoginState _value, $Res Function(_PhoneLoginState) _then)
      : super(_value, (v) => _then(v as _PhoneLoginState));

  @override
  _PhoneLoginState get _value => super._value as _PhoneLoginState;

  @override
  $Res call({
    Object? invalidCredentials = freezed,
    Object? phoneNumber = freezed,
    Object? pinCode = freezed,
  }) {
    return _then(_PhoneLoginState(
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
class _$_PhoneLoginState implements _PhoneLoginState {
  _$_PhoneLoginState(
      {this.invalidCredentials = false, this.phoneNumber, this.pinCode});

  factory _$_PhoneLoginState.fromJson(Map<String, dynamic> json) =>
      _$_$_PhoneLoginStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool invalidCredentials;
  @override
  final String? phoneNumber;
  @override
  final String? pinCode;

  @override
  String toString() {
    return 'PhoneLoginState(invalidCredentials: $invalidCredentials, phoneNumber: $phoneNumber, pinCode: $pinCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhoneLoginState &&
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
  _$PhoneLoginStateCopyWith<_PhoneLoginState> get copyWith =>
      __$PhoneLoginStateCopyWithImpl<_PhoneLoginState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PhoneLoginStateToJson(this);
  }
}

abstract class _PhoneLoginState implements PhoneLoginState {
  factory _PhoneLoginState(
      {bool invalidCredentials,
      String? phoneNumber,
      String? pinCode}) = _$_PhoneLoginState;

  factory _PhoneLoginState.fromJson(Map<String, dynamic> json) =
      _$_PhoneLoginState.fromJson;

  @override
  bool get invalidCredentials => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get pinCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PhoneLoginStateCopyWith<_PhoneLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}