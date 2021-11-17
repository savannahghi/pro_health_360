// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientState _$ClientStateFromJson(Map<String, dynamic> json) {
  return _ClientState.fromJson(json);
}

/// @nodoc
class _$ClientStateTearOff {
  const _$ClientStateTearOff();

  _ClientState call({ClientProfile? clientProfile}) {
    return _ClientState(
      clientProfile: clientProfile,
    );
  }

  ClientState fromJson(Map<String, Object> json) {
    return ClientState.fromJson(json);
  }
}

/// @nodoc
const $ClientState = _$ClientStateTearOff();

/// @nodoc
mixin _$ClientState {
  ClientProfile? get clientProfile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientStateCopyWith<ClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientStateCopyWith<$Res> {
  factory $ClientStateCopyWith(
          ClientState value, $Res Function(ClientState) then) =
      _$ClientStateCopyWithImpl<$Res>;
  $Res call({ClientProfile? clientProfile});

  $ClientProfileCopyWith<$Res>? get clientProfile;
}

/// @nodoc
class _$ClientStateCopyWithImpl<$Res> implements $ClientStateCopyWith<$Res> {
  _$ClientStateCopyWithImpl(this._value, this._then);

  final ClientState _value;
  // ignore: unused_field
  final $Res Function(ClientState) _then;

  @override
  $Res call({
    Object? clientProfile = freezed,
  }) {
    return _then(_value.copyWith(
      clientProfile: clientProfile == freezed
          ? _value.clientProfile
          : clientProfile // ignore: cast_nullable_to_non_nullable
              as ClientProfile?,
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
}

/// @nodoc
abstract class _$ClientStateCopyWith<$Res>
    implements $ClientStateCopyWith<$Res> {
  factory _$ClientStateCopyWith(
          _ClientState value, $Res Function(_ClientState) then) =
      __$ClientStateCopyWithImpl<$Res>;
  @override
  $Res call({ClientProfile? clientProfile});

  @override
  $ClientProfileCopyWith<$Res>? get clientProfile;
}

/// @nodoc
class __$ClientStateCopyWithImpl<$Res> extends _$ClientStateCopyWithImpl<$Res>
    implements _$ClientStateCopyWith<$Res> {
  __$ClientStateCopyWithImpl(
      _ClientState _value, $Res Function(_ClientState) _then)
      : super(_value, (v) => _then(v as _ClientState));

  @override
  _ClientState get _value => super._value as _ClientState;

  @override
  $Res call({
    Object? clientProfile = freezed,
  }) {
    return _then(_ClientState(
      clientProfile: clientProfile == freezed
          ? _value.clientProfile
          : clientProfile // ignore: cast_nullable_to_non_nullable
              as ClientProfile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientState implements _ClientState {
  _$_ClientState({this.clientProfile});

  factory _$_ClientState.fromJson(Map<String, dynamic> json) =>
      _$_$_ClientStateFromJson(json);

  @override
  final ClientProfile? clientProfile;

  @override
  String toString() {
    return 'ClientState(clientProfile: $clientProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClientState &&
            (identical(other.clientProfile, clientProfile) ||
                const DeepCollectionEquality()
                    .equals(other.clientProfile, clientProfile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(clientProfile);

  @JsonKey(ignore: true)
  @override
  _$ClientStateCopyWith<_ClientState> get copyWith =>
      __$ClientStateCopyWithImpl<_ClientState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClientStateToJson(this);
  }
}

abstract class _ClientState implements ClientState {
  factory _ClientState({ClientProfile? clientProfile}) = _$_ClientState;

  factory _ClientState.fromJson(Map<String, dynamic> json) =
      _$_ClientState.fromJson;

  @override
  ClientProfile? get clientProfile => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClientStateCopyWith<_ClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
