// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Credentials _$CredentialsFromJson(Map<String, dynamic> json) {
  return _Credentials.fromJson(json);
}

/// @nodoc
class _$CredentialsTearOff {
  const _$CredentialsTearOff();

  _Credentials call(
      {@JsonKey(name: 'clientProfile') ClientProfile? clientProfile,
      @JsonKey(name: 'authCredentials') AuthCredentials? authCredentials}) {
    return _Credentials(
      clientProfile: clientProfile,
      authCredentials: authCredentials,
    );
  }

  Credentials fromJson(Map<String, Object> json) {
    return Credentials.fromJson(json);
  }
}

/// @nodoc
const $Credentials = _$CredentialsTearOff();

/// @nodoc
mixin _$Credentials {
  @JsonKey(name: 'clientProfile')
  ClientProfile? get clientProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'authCredentials')
  AuthCredentials? get authCredentials => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CredentialsCopyWith<Credentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialsCopyWith<$Res> {
  factory $CredentialsCopyWith(
          Credentials value, $Res Function(Credentials) then) =
      _$CredentialsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'clientProfile') ClientProfile? clientProfile,
      @JsonKey(name: 'authCredentials') AuthCredentials? authCredentials});

  $ClientProfileCopyWith<$Res>? get clientProfile;
  $AuthCredentialsCopyWith<$Res>? get authCredentials;
}

/// @nodoc
class _$CredentialsCopyWithImpl<$Res> implements $CredentialsCopyWith<$Res> {
  _$CredentialsCopyWithImpl(this._value, this._then);

  final Credentials _value;
  // ignore: unused_field
  final $Res Function(Credentials) _then;

  @override
  $Res call({
    Object? clientProfile = freezed,
    Object? authCredentials = freezed,
  }) {
    return _then(_value.copyWith(
      clientProfile: clientProfile == freezed
          ? _value.clientProfile
          : clientProfile // ignore: cast_nullable_to_non_nullable
              as ClientProfile?,
      authCredentials: authCredentials == freezed
          ? _value.authCredentials
          : authCredentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
    ));
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

  @override
  $AuthCredentialsCopyWith<$Res>? get authCredentials {
    if (_value.authCredentials == null) {
      return null;
    }

    return $AuthCredentialsCopyWith<$Res>(_value.authCredentials!, (value) {
      return _then(_value.copyWith(authCredentials: value));
    });
  }
}

/// @nodoc
abstract class _$CredentialsCopyWith<$Res>
    implements $CredentialsCopyWith<$Res> {
  factory _$CredentialsCopyWith(
          _Credentials value, $Res Function(_Credentials) then) =
      __$CredentialsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'clientProfile') ClientProfile? clientProfile,
      @JsonKey(name: 'authCredentials') AuthCredentials? authCredentials});

  @override
  $ClientProfileCopyWith<$Res>? get clientProfile;
  @override
  $AuthCredentialsCopyWith<$Res>? get authCredentials;
}

/// @nodoc
class __$CredentialsCopyWithImpl<$Res> extends _$CredentialsCopyWithImpl<$Res>
    implements _$CredentialsCopyWith<$Res> {
  __$CredentialsCopyWithImpl(
      _Credentials _value, $Res Function(_Credentials) _then)
      : super(_value, (v) => _then(v as _Credentials));

  @override
  _Credentials get _value => super._value as _Credentials;

  @override
  $Res call({
    Object? clientProfile = freezed,
    Object? authCredentials = freezed,
  }) {
    return _then(_Credentials(
      clientProfile: clientProfile == freezed
          ? _value.clientProfile
          : clientProfile // ignore: cast_nullable_to_non_nullable
              as ClientProfile?,
      authCredentials: authCredentials == freezed
          ? _value.authCredentials
          : authCredentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Credentials implements _Credentials {
  _$_Credentials(
      {@JsonKey(name: 'clientProfile') this.clientProfile,
      @JsonKey(name: 'authCredentials') this.authCredentials});

  factory _$_Credentials.fromJson(Map<String, dynamic> json) =>
      _$_$_CredentialsFromJson(json);

  @override
  @JsonKey(name: 'clientProfile')
  final ClientProfile? clientProfile;
  @override
  @JsonKey(name: 'authCredentials')
  final AuthCredentials? authCredentials;

  @override
  String toString() {
    return 'Credentials(clientProfile: $clientProfile, authCredentials: $authCredentials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Credentials &&
            (identical(other.clientProfile, clientProfile) ||
                const DeepCollectionEquality()
                    .equals(other.clientProfile, clientProfile)) &&
            (identical(other.authCredentials, authCredentials) ||
                const DeepCollectionEquality()
                    .equals(other.authCredentials, authCredentials)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(clientProfile) ^
      const DeepCollectionEquality().hash(authCredentials);

  @JsonKey(ignore: true)
  @override
  _$CredentialsCopyWith<_Credentials> get copyWith =>
      __$CredentialsCopyWithImpl<_Credentials>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CredentialsToJson(this);
  }
}

abstract class _Credentials implements Credentials {
  factory _Credentials(
          {@JsonKey(name: 'clientProfile') ClientProfile? clientProfile,
          @JsonKey(name: 'authCredentials') AuthCredentials? authCredentials}) =
      _$_Credentials;

  factory _Credentials.fromJson(Map<String, dynamic> json) =
      _$_Credentials.fromJson;

  @override
  @JsonKey(name: 'clientProfile')
  ClientProfile? get clientProfile => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'authCredentials')
  AuthCredentials? get authCredentials => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CredentialsCopyWith<_Credentials> get copyWith =>
      throw _privateConstructorUsedError;
}
