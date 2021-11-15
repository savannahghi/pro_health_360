// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginData _$LoginDataFromJson(Map<String, dynamic> json) {
  return _LoginData.fromJson(json);
}

/// @nodoc
class _$LoginDataTearOff {
  const _$LoginDataTearOff();

  _LoginData call({@JsonKey(name: 'credentials') Credentials? credentials}) {
    return _LoginData(
      credentials: credentials,
    );
  }

  LoginData fromJson(Map<String, Object> json) {
    return LoginData.fromJson(json);
  }
}

/// @nodoc
const $LoginData = _$LoginDataTearOff();

/// @nodoc
mixin _$LoginData {
  @JsonKey(name: 'credentials')
  Credentials? get credentials => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDataCopyWith<LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataCopyWith<$Res> {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) then) =
      _$LoginDataCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'credentials') Credentials? credentials});

  $CredentialsCopyWith<$Res>? get credentials;
}

/// @nodoc
class _$LoginDataCopyWithImpl<$Res> implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._value, this._then);

  final LoginData _value;
  // ignore: unused_field
  final $Res Function(LoginData) _then;

  @override
  $Res call({
    Object? credentials = freezed,
  }) {
    return _then(_value.copyWith(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials?,
    ));
  }

  @override
  $CredentialsCopyWith<$Res>? get credentials {
    if (_value.credentials == null) {
      return null;
    }

    return $CredentialsCopyWith<$Res>(_value.credentials!, (value) {
      return _then(_value.copyWith(credentials: value));
    });
  }
}

/// @nodoc
abstract class _$LoginDataCopyWith<$Res> implements $LoginDataCopyWith<$Res> {
  factory _$LoginDataCopyWith(
          _LoginData value, $Res Function(_LoginData) then) =
      __$LoginDataCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'credentials') Credentials? credentials});

  @override
  $CredentialsCopyWith<$Res>? get credentials;
}

/// @nodoc
class __$LoginDataCopyWithImpl<$Res> extends _$LoginDataCopyWithImpl<$Res>
    implements _$LoginDataCopyWith<$Res> {
  __$LoginDataCopyWithImpl(_LoginData _value, $Res Function(_LoginData) _then)
      : super(_value, (v) => _then(v as _LoginData));

  @override
  _LoginData get _value => super._value as _LoginData;

  @override
  $Res call({
    Object? credentials = freezed,
  }) {
    return _then(_LoginData(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginData implements _LoginData {
  _$_LoginData({@JsonKey(name: 'credentials') this.credentials});

  factory _$_LoginData.fromJson(Map<String, dynamic> json) =>
      _$_$_LoginDataFromJson(json);

  @override
  @JsonKey(name: 'credentials')
  final Credentials? credentials;

  @override
  String toString() {
    return 'LoginData(credentials: $credentials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginData &&
            (identical(other.credentials, credentials) ||
                const DeepCollectionEquality()
                    .equals(other.credentials, credentials)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(credentials);

  @JsonKey(ignore: true)
  @override
  _$LoginDataCopyWith<_LoginData> get copyWith =>
      __$LoginDataCopyWithImpl<_LoginData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LoginDataToJson(this);
  }
}

abstract class _LoginData implements LoginData {
  factory _LoginData({@JsonKey(name: 'credentials') Credentials? credentials}) =
      _$_LoginData;

  factory _LoginData.fromJson(Map<String, dynamic> json) =
      _$_LoginData.fromJson;

  @override
  @JsonKey(name: 'credentials')
  Credentials? get credentials => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginDataCopyWith<_LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}
