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

  _LoginData call(
      {@JsonKey(name: 'code') String? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'clientProfile') ClientProfile? clientProfile}) {
    return _LoginData(
      code: code,
      message: message,
      credentials: credentials,
      clientProfile: clientProfile,
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
  @JsonKey(name: 'code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'credentials')
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientProfile')
  ClientProfile? get clientProfile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDataCopyWith<LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataCopyWith<$Res> {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) then) =
      _$LoginDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'code') String? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'clientProfile') ClientProfile? clientProfile});

  $AuthCredentialsCopyWith<$Res>? get credentials;
  $ClientProfileCopyWith<$Res>? get clientProfile;
}

/// @nodoc
class _$LoginDataCopyWithImpl<$Res> implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._value, this._then);

  final LoginData _value;
  // ignore: unused_field
  final $Res Function(LoginData) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? credentials = freezed,
    Object? clientProfile = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      clientProfile: clientProfile == freezed
          ? _value.clientProfile
          : clientProfile // ignore: cast_nullable_to_non_nullable
              as ClientProfile?,
    ));
  }

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials {
    if (_value.credentials == null) {
      return null;
    }

    return $AuthCredentialsCopyWith<$Res>(_value.credentials!, (value) {
      return _then(_value.copyWith(credentials: value));
    });
  }

  @override
  $ClientProfileCopyWith<$Res>? get clientProfile {
    if (_value.clientProfile == null) {
      return null;
    }

    return $ClientProfileCopyWith<$Res>(_value.clientProfile!, (value) {
      return _then(_value.copyWith(clientProfile: value));
    });
  }
}

/// @nodoc
abstract class _$LoginDataCopyWith<$Res> implements $LoginDataCopyWith<$Res> {
  factory _$LoginDataCopyWith(
          _LoginData value, $Res Function(_LoginData) then) =
      __$LoginDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'code') String? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'clientProfile') ClientProfile? clientProfile});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
  @override
  $ClientProfileCopyWith<$Res>? get clientProfile;
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
    Object? code = freezed,
    Object? message = freezed,
    Object? credentials = freezed,
    Object? clientProfile = freezed,
  }) {
    return _then(_LoginData(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      clientProfile: clientProfile == freezed
          ? _value.clientProfile
          : clientProfile // ignore: cast_nullable_to_non_nullable
              as ClientProfile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginData implements _LoginData {
  _$_LoginData(
      {@JsonKey(name: 'code') this.code,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'credentials') this.credentials,
      @JsonKey(name: 'clientProfile') this.clientProfile});

  factory _$_LoginData.fromJson(Map<String, dynamic> json) =>
      _$_$_LoginDataFromJson(json);

  @override
  @JsonKey(name: 'code')
  final String? code;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'credentials')
  final AuthCredentials? credentials;
  @override
  @JsonKey(name: 'clientProfile')
  final ClientProfile? clientProfile;

  @override
  String toString() {
    return 'LoginData(code: $code, message: $message, credentials: $credentials, clientProfile: $clientProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginData &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.credentials, credentials) ||
                const DeepCollectionEquality()
                    .equals(other.credentials, credentials)) &&
            (identical(other.clientProfile, clientProfile) ||
                const DeepCollectionEquality()
                    .equals(other.clientProfile, clientProfile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(credentials) ^
      const DeepCollectionEquality().hash(clientProfile);

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
  factory _LoginData(
          {@JsonKey(name: 'code') String? code,
          @JsonKey(name: 'message') String? message,
          @JsonKey(name: 'credentials') AuthCredentials? credentials,
          @JsonKey(name: 'clientProfile') ClientProfile? clientProfile}) =
      _$_LoginData;

  factory _LoginData.fromJson(Map<String, dynamic> json) =
      _$_LoginData.fromJson;

  @override
  @JsonKey(name: 'code')
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'credentials')
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'clientProfile')
  ClientProfile? get clientProfile => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginDataCopyWith<_LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}
