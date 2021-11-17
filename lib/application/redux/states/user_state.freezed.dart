// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return _UserState.fromJson(json);
}

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  _UserState call(
      {ClientState? clientState,
      AuthState? authState,
      ConfidentialState? confidentialState}) {
    return _UserState(
      clientState: clientState,
      authState: authState,
      confidentialState: confidentialState,
    );
  }

  UserState fromJson(Map<String, Object> json) {
    return UserState.fromJson(json);
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  ClientState? get clientState => throw _privateConstructorUsedError;
  AuthState? get authState => throw _privateConstructorUsedError;
  ConfidentialState? get confidentialState =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call(
      {ClientState? clientState,
      AuthState? authState,
      ConfidentialState? confidentialState});

  $ClientStateCopyWith<$Res>? get clientState;
  $AuthStateCopyWith<$Res>? get authState;
  $ConfidentialStateCopyWith<$Res>? get confidentialState;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object? clientState = freezed,
    Object? authState = freezed,
    Object? confidentialState = freezed,
  }) {
    return _then(_value.copyWith(
      clientState: clientState == freezed
          ? _value.clientState
          : clientState // ignore: cast_nullable_to_non_nullable
              as ClientState?,
      authState: authState == freezed
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthState?,
      confidentialState: confidentialState == freezed
          ? _value.confidentialState
          : confidentialState // ignore: cast_nullable_to_non_nullable
              as ConfidentialState?,
    ));
  }

  @override
  $ClientStateCopyWith<$Res>? get clientState {
    if (_value.clientState == null) {
      return null;
    }

    return $ClientStateCopyWith<$Res>(_value.clientState!, (value) {
      return _then(_value.copyWith(clientState: value));
    });
  }

  @override
  $AuthStateCopyWith<$Res>? get authState {
    if (_value.authState == null) {
      return null;
    }

    return $AuthStateCopyWith<$Res>(_value.authState!, (value) {
      return _then(_value.copyWith(authState: value));
    });
  }

  @override
  $ConfidentialStateCopyWith<$Res>? get confidentialState {
    if (_value.confidentialState == null) {
      return null;
    }

    return $ConfidentialStateCopyWith<$Res>(_value.confidentialState!, (value) {
      return _then(_value.copyWith(confidentialState: value));
    });
  }
}

/// @nodoc
abstract class _$UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$UserStateCopyWith(
          _UserState value, $Res Function(_UserState) then) =
      __$UserStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ClientState? clientState,
      AuthState? authState,
      ConfidentialState? confidentialState});

  @override
  $ClientStateCopyWith<$Res>? get clientState;
  @override
  $AuthStateCopyWith<$Res>? get authState;
  @override
  $ConfidentialStateCopyWith<$Res>? get confidentialState;
}

/// @nodoc
class __$UserStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateCopyWith<$Res> {
  __$UserStateCopyWithImpl(_UserState _value, $Res Function(_UserState) _then)
      : super(_value, (v) => _then(v as _UserState));

  @override
  _UserState get _value => super._value as _UserState;

  @override
  $Res call({
    Object? clientState = freezed,
    Object? authState = freezed,
    Object? confidentialState = freezed,
  }) {
    return _then(_UserState(
      clientState: clientState == freezed
          ? _value.clientState
          : clientState // ignore: cast_nullable_to_non_nullable
              as ClientState?,
      authState: authState == freezed
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthState?,
      confidentialState: confidentialState == freezed
          ? _value.confidentialState
          : confidentialState // ignore: cast_nullable_to_non_nullable
              as ConfidentialState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserState implements _UserState {
  _$_UserState({this.clientState, this.authState, this.confidentialState});

  factory _$_UserState.fromJson(Map<String, dynamic> json) =>
      _$_$_UserStateFromJson(json);

  @override
  final ClientState? clientState;
  @override
  final AuthState? authState;
  @override
  final ConfidentialState? confidentialState;

  @override
  String toString() {
    return 'UserState(clientState: $clientState, authState: $authState, confidentialState: $confidentialState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserState &&
            (identical(other.clientState, clientState) ||
                const DeepCollectionEquality()
                    .equals(other.clientState, clientState)) &&
            (identical(other.authState, authState) ||
                const DeepCollectionEquality()
                    .equals(other.authState, authState)) &&
            (identical(other.confidentialState, confidentialState) ||
                const DeepCollectionEquality()
                    .equals(other.confidentialState, confidentialState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(clientState) ^
      const DeepCollectionEquality().hash(authState) ^
      const DeepCollectionEquality().hash(confidentialState);

  @JsonKey(ignore: true)
  @override
  _$UserStateCopyWith<_UserState> get copyWith =>
      __$UserStateCopyWithImpl<_UserState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserStateToJson(this);
  }
}

abstract class _UserState implements UserState {
  factory _UserState(
      {ClientState? clientState,
      AuthState? authState,
      ConfidentialState? confidentialState}) = _$_UserState;

  factory _UserState.fromJson(Map<String, dynamic> json) =
      _$_UserState.fromJson;

  @override
  ClientState? get clientState => throw _privateConstructorUsedError;
  @override
  AuthState? get authState => throw _privateConstructorUsedError;
  @override
  ConfidentialState? get confidentialState =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserStateCopyWith<_UserState> get copyWith =>
      throw _privateConstructorUsedError;
}
