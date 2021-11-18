// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _MainAppState.fromJson(json);
}

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _MainAppState call(
      {AuthCredentials? credentials,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientState? clientState,
      ConnectivityState? connectivityState,
      @JsonKey(ignore: true) Wait? wait}) {
    return _MainAppState(
      credentials: credentials,
      onboardingState: onboardingState,
      bottomNavigationState: bottomNavigationState,
      miscState: miscState,
      clientState: clientState,
      connectivityState: connectivityState,
      wait: wait,
    );
  }

  AppState fromJson(Map<String, Object> json) {
    return AppState.fromJson(json);
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  MiscState? get miscState => throw _privateConstructorUsedError;
  ClientState? get clientState => throw _privateConstructorUsedError;
  ConnectivityState? get connectivityState =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call(
      {AuthCredentials? credentials,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientState? clientState,
      ConnectivityState? connectivityState,
      @JsonKey(ignore: true) Wait? wait});

  $AuthCredentialsCopyWith<$Res>? get credentials;
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  $MiscStateCopyWith<$Res>? get miscState;
  $ClientStateCopyWith<$Res>? get clientState;
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? credentials = freezed,
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? clientState = freezed,
    Object? connectivityState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      onboardingState: onboardingState == freezed
          ? _value.onboardingState
          : onboardingState // ignore: cast_nullable_to_non_nullable
              as OnboardingState?,
      bottomNavigationState: bottomNavigationState == freezed
          ? _value.bottomNavigationState
          : bottomNavigationState // ignore: cast_nullable_to_non_nullable
              as BottomNavigationState?,
      miscState: miscState == freezed
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
      clientState: clientState == freezed
          ? _value.clientState
          : clientState // ignore: cast_nullable_to_non_nullable
              as ClientState?,
      connectivityState: connectivityState == freezed
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
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
  $OnboardingStateCopyWith<$Res>? get onboardingState {
    if (_value.onboardingState == null) {
      return null;
    }

    return $OnboardingStateCopyWith<$Res>(_value.onboardingState!, (value) {
      return _then(_value.copyWith(onboardingState: value));
    });
  }

  @override
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState {
    if (_value.bottomNavigationState == null) {
      return null;
    }

    return $BottomNavigationStateCopyWith<$Res>(_value.bottomNavigationState!,
        (value) {
      return _then(_value.copyWith(bottomNavigationState: value));
    });
  }

  @override
  $MiscStateCopyWith<$Res>? get miscState {
    if (_value.miscState == null) {
      return null;
    }

    return $MiscStateCopyWith<$Res>(_value.miscState!, (value) {
      return _then(_value.copyWith(miscState: value));
    });
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
  $ConnectivityStateCopyWith<$Res>? get connectivityState {
    if (_value.connectivityState == null) {
      return null;
    }

    return $ConnectivityStateCopyWith<$Res>(_value.connectivityState!, (value) {
      return _then(_value.copyWith(connectivityState: value));
    });
  }
}

/// @nodoc
abstract class _$MainAppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$MainAppStateCopyWith(
          _MainAppState value, $Res Function(_MainAppState) then) =
      __$MainAppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AuthCredentials? credentials,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientState? clientState,
      ConnectivityState? connectivityState,
      @JsonKey(ignore: true) Wait? wait});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
  @override
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  @override
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  @override
  $MiscStateCopyWith<$Res>? get miscState;
  @override
  $ClientStateCopyWith<$Res>? get clientState;
  @override
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
}

/// @nodoc
class __$MainAppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$MainAppStateCopyWith<$Res> {
  __$MainAppStateCopyWithImpl(
      _MainAppState _value, $Res Function(_MainAppState) _then)
      : super(_value, (v) => _then(v as _MainAppState));

  @override
  _MainAppState get _value => super._value as _MainAppState;

  @override
  $Res call({
    Object? credentials = freezed,
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? clientState = freezed,
    Object? connectivityState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_MainAppState(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      onboardingState: onboardingState == freezed
          ? _value.onboardingState
          : onboardingState // ignore: cast_nullable_to_non_nullable
              as OnboardingState?,
      bottomNavigationState: bottomNavigationState == freezed
          ? _value.bottomNavigationState
          : bottomNavigationState // ignore: cast_nullable_to_non_nullable
              as BottomNavigationState?,
      miscState: miscState == freezed
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
      clientState: clientState == freezed
          ? _value.clientState
          : clientState // ignore: cast_nullable_to_non_nullable
              as ClientState?,
      connectivityState: connectivityState == freezed
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MainAppState implements _MainAppState {
  _$_MainAppState(
      {this.credentials,
      this.onboardingState,
      this.bottomNavigationState,
      this.miscState,
      this.clientState,
      this.connectivityState,
      @JsonKey(ignore: true) this.wait});

  factory _$_MainAppState.fromJson(Map<String, dynamic> json) =>
      _$_$_MainAppStateFromJson(json);

  @override
  final AuthCredentials? credentials;
  @override
  final OnboardingState? onboardingState;
  @override
  final BottomNavigationState? bottomNavigationState;
  @override
  final MiscState? miscState;
  @override
  final ClientState? clientState;
  @override
  final ConnectivityState? connectivityState;
  @override
  @JsonKey(ignore: true)
  final Wait? wait;

  @override
  String toString() {
    return 'AppState(credentials: $credentials, onboardingState: $onboardingState, bottomNavigationState: $bottomNavigationState, miscState: $miscState, clientState: $clientState, connectivityState: $connectivityState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MainAppState &&
            (identical(other.credentials, credentials) ||
                const DeepCollectionEquality()
                    .equals(other.credentials, credentials)) &&
            (identical(other.onboardingState, onboardingState) ||
                const DeepCollectionEquality()
                    .equals(other.onboardingState, onboardingState)) &&
            (identical(other.bottomNavigationState, bottomNavigationState) ||
                const DeepCollectionEquality().equals(
                    other.bottomNavigationState, bottomNavigationState)) &&
            (identical(other.miscState, miscState) ||
                const DeepCollectionEquality()
                    .equals(other.miscState, miscState)) &&
            (identical(other.clientState, clientState) ||
                const DeepCollectionEquality()
                    .equals(other.clientState, clientState)) &&
            (identical(other.connectivityState, connectivityState) ||
                const DeepCollectionEquality()
                    .equals(other.connectivityState, connectivityState)) &&
            (identical(other.wait, wait) ||
                const DeepCollectionEquality().equals(other.wait, wait)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(credentials) ^
      const DeepCollectionEquality().hash(onboardingState) ^
      const DeepCollectionEquality().hash(bottomNavigationState) ^
      const DeepCollectionEquality().hash(miscState) ^
      const DeepCollectionEquality().hash(clientState) ^
      const DeepCollectionEquality().hash(connectivityState) ^
      const DeepCollectionEquality().hash(wait);

  @JsonKey(ignore: true)
  @override
  _$MainAppStateCopyWith<_MainAppState> get copyWith =>
      __$MainAppStateCopyWithImpl<_MainAppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MainAppStateToJson(this);
  }
}

abstract class _MainAppState implements AppState {
  factory _MainAppState(
      {AuthCredentials? credentials,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientState? clientState,
      ConnectivityState? connectivityState,
      @JsonKey(ignore: true) Wait? wait}) = _$_MainAppState;

  factory _MainAppState.fromJson(Map<String, dynamic> json) =
      _$_MainAppState.fromJson;

  @override
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  @override
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  @override
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  @override
  MiscState? get miscState => throw _privateConstructorUsedError;
  @override
  ClientState? get clientState => throw _privateConstructorUsedError;
  @override
  ConnectivityState? get connectivityState =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MainAppStateCopyWith<_MainAppState> get copyWith =>
      throw _privateConstructorUsedError;
}
