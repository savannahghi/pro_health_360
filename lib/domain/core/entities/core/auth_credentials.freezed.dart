// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthCredentials _$AuthCredentialsFromJson(Map<String, dynamic> json) {
  return _AuthCredentials.fromJson(json);
}

/// @nodoc
class _$AuthCredentialsTearOff {
  const _$AuthCredentialsTearOff();

  _AuthCredentials call(
      {String? expiresIn, String? idToken, String? refreshToken}) {
    return _AuthCredentials(
      expiresIn: expiresIn,
      idToken: idToken,
      refreshToken: refreshToken,
    );
  }

  AuthCredentials fromJson(Map<String, Object> json) {
    return AuthCredentials.fromJson(json);
  }
}

/// @nodoc
const $AuthCredentials = _$AuthCredentialsTearOff();

/// @nodoc
mixin _$AuthCredentials {
  String? get expiresIn => throw _privateConstructorUsedError;
  String? get idToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthCredentialsCopyWith<AuthCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCredentialsCopyWith<$Res> {
  factory $AuthCredentialsCopyWith(
          AuthCredentials value, $Res Function(AuthCredentials) then) =
      _$AuthCredentialsCopyWithImpl<$Res>;
  $Res call({String? expiresIn, String? idToken, String? refreshToken});
}

/// @nodoc
class _$AuthCredentialsCopyWithImpl<$Res>
    implements $AuthCredentialsCopyWith<$Res> {
  _$AuthCredentialsCopyWithImpl(this._value, this._then);

  final AuthCredentials _value;
  // ignore: unused_field
  final $Res Function(AuthCredentials) _then;

  @override
  $Res call({
    Object? expiresIn = freezed,
    Object? idToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AuthCredentialsCopyWith<$Res>
    implements $AuthCredentialsCopyWith<$Res> {
  factory _$AuthCredentialsCopyWith(
          _AuthCredentials value, $Res Function(_AuthCredentials) then) =
      __$AuthCredentialsCopyWithImpl<$Res>;
  @override
  $Res call({String? expiresIn, String? idToken, String? refreshToken});
}

/// @nodoc
class __$AuthCredentialsCopyWithImpl<$Res>
    extends _$AuthCredentialsCopyWithImpl<$Res>
    implements _$AuthCredentialsCopyWith<$Res> {
  __$AuthCredentialsCopyWithImpl(
      _AuthCredentials _value, $Res Function(_AuthCredentials) _then)
      : super(_value, (v) => _then(v as _AuthCredentials));

  @override
  _AuthCredentials get _value => super._value as _AuthCredentials;

  @override
  $Res call({
    Object? expiresIn = freezed,
    Object? idToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_AuthCredentials(
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthCredentials implements _AuthCredentials {
  _$_AuthCredentials({this.expiresIn, this.idToken, this.refreshToken});

  factory _$_AuthCredentials.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthCredentialsFromJson(json);

  @override
  final String? expiresIn;
  @override
  final String? idToken;
  @override
  final String? refreshToken;

  @override
  String toString() {
    return 'AuthCredentials(expiresIn: $expiresIn, idToken: $idToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthCredentials &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresIn, expiresIn)) &&
            (identical(other.idToken, idToken) ||
                const DeepCollectionEquality()
                    .equals(other.idToken, idToken)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(expiresIn) ^
      const DeepCollectionEquality().hash(idToken) ^
      const DeepCollectionEquality().hash(refreshToken);

  @JsonKey(ignore: true)
  @override
  _$AuthCredentialsCopyWith<_AuthCredentials> get copyWith =>
      __$AuthCredentialsCopyWithImpl<_AuthCredentials>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthCredentialsToJson(this);
  }
}

abstract class _AuthCredentials implements AuthCredentials {
  factory _AuthCredentials(
      {String? expiresIn,
      String? idToken,
      String? refreshToken}) = _$_AuthCredentials;

  factory _AuthCredentials.fromJson(Map<String, dynamic> json) =
      _$_AuthCredentials.fromJson;

  @override
  String? get expiresIn => throw _privateConstructorUsedError;
  @override
  String? get idToken => throw _privateConstructorUsedError;
  @override
  String? get refreshToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthCredentialsCopyWith<_AuthCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}
