// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'phone_login_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneLoginData _$PhoneLoginDataFromJson(Map<String, dynamic> json) {
  return _PhoneLoginData.fromJson(json);
}

/// @nodoc
class _$PhoneLoginDataTearOff {
  const _$PhoneLoginDataTearOff();

  _PhoneLoginData call({@JsonKey(name: 'login') LoginData? loginData}) {
    return _PhoneLoginData(
      loginData: loginData,
    );
  }

  PhoneLoginData fromJson(Map<String, Object> json) {
    return PhoneLoginData.fromJson(json);
  }
}

/// @nodoc
const $PhoneLoginData = _$PhoneLoginDataTearOff();

/// @nodoc
mixin _$PhoneLoginData {
  @JsonKey(name: 'login')
  LoginData? get loginData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneLoginDataCopyWith<PhoneLoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneLoginDataCopyWith<$Res> {
  factory $PhoneLoginDataCopyWith(
          PhoneLoginData value, $Res Function(PhoneLoginData) then) =
      _$PhoneLoginDataCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'login') LoginData? loginData});

  $LoginDataCopyWith<$Res>? get loginData;
}

/// @nodoc
class _$PhoneLoginDataCopyWithImpl<$Res>
    implements $PhoneLoginDataCopyWith<$Res> {
  _$PhoneLoginDataCopyWithImpl(this._value, this._then);

  final PhoneLoginData _value;
  // ignore: unused_field
  final $Res Function(PhoneLoginData) _then;

  @override
  $Res call({
    Object? loginData = freezed,
  }) {
    return _then(_value.copyWith(
      loginData: loginData == freezed
          ? _value.loginData
          : loginData // ignore: cast_nullable_to_non_nullable
              as LoginData?,
    ));
  }

  @override
  $LoginDataCopyWith<$Res>? get loginData {
    if (_value.loginData == null) {
      return null;
    }

    return $LoginDataCopyWith<$Res>(_value.loginData!, (value) {
      return _then(_value.copyWith(loginData: value));
    });
  }
}

/// @nodoc
abstract class _$PhoneLoginDataCopyWith<$Res>
    implements $PhoneLoginDataCopyWith<$Res> {
  factory _$PhoneLoginDataCopyWith(
          _PhoneLoginData value, $Res Function(_PhoneLoginData) then) =
      __$PhoneLoginDataCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'login') LoginData? loginData});

  @override
  $LoginDataCopyWith<$Res>? get loginData;
}

/// @nodoc
class __$PhoneLoginDataCopyWithImpl<$Res>
    extends _$PhoneLoginDataCopyWithImpl<$Res>
    implements _$PhoneLoginDataCopyWith<$Res> {
  __$PhoneLoginDataCopyWithImpl(
      _PhoneLoginData _value, $Res Function(_PhoneLoginData) _then)
      : super(_value, (v) => _then(v as _PhoneLoginData));

  @override
  _PhoneLoginData get _value => super._value as _PhoneLoginData;

  @override
  $Res call({
    Object? loginData = freezed,
  }) {
    return _then(_PhoneLoginData(
      loginData: loginData == freezed
          ? _value.loginData
          : loginData // ignore: cast_nullable_to_non_nullable
              as LoginData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhoneLoginData implements _PhoneLoginData {
  _$_PhoneLoginData({@JsonKey(name: 'login') this.loginData});

  factory _$_PhoneLoginData.fromJson(Map<String, dynamic> json) =>
      _$_$_PhoneLoginDataFromJson(json);

  @override
  @JsonKey(name: 'login')
  final LoginData? loginData;

  @override
  String toString() {
    return 'PhoneLoginData(loginData: $loginData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhoneLoginData &&
            (identical(other.loginData, loginData) ||
                const DeepCollectionEquality()
                    .equals(other.loginData, loginData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(loginData);

  @JsonKey(ignore: true)
  @override
  _$PhoneLoginDataCopyWith<_PhoneLoginData> get copyWith =>
      __$PhoneLoginDataCopyWithImpl<_PhoneLoginData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PhoneLoginDataToJson(this);
  }
}

abstract class _PhoneLoginData implements PhoneLoginData {
  factory _PhoneLoginData({@JsonKey(name: 'login') LoginData? loginData}) =
      _$_PhoneLoginData;

  factory _PhoneLoginData.fromJson(Map<String, dynamic> json) =
      _$_PhoneLoginData.fromJson;

  @override
  @JsonKey(name: 'login')
  LoginData? get loginData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PhoneLoginDataCopyWith<_PhoneLoginData> get copyWith =>
      throw _privateConstructorUsedError;
}
