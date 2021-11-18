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
  return _AppState.fromJson(json);
}

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call(
      {AuthCredentials? credentials,
      UserState? userState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait}) {
    return _AppState(
      credentials: credentials,
      userState: userState,
      connectivityState: connectivityState,
      userFeedState: userFeedState,
      miscState: miscState,
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
  UserState? get userState => throw _privateConstructorUsedError;
  ConnectivityState? get connectivityState =>
      throw _privateConstructorUsedError;
  FeedResponsePayload? get userFeedState => throw _privateConstructorUsedError;
  MiscState? get miscState => throw _privateConstructorUsedError;
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
      UserState? userState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait});

  $AuthCredentialsCopyWith<$Res>? get credentials;
  $UserStateCopyWith<$Res>? get userState;
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
  $FeedResponsePayloadCopyWith<$Res>? get userFeedState;
  $MiscStateCopyWith<$Res>? get miscState;
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
    Object? userState = freezed,
    Object? connectivityState = freezed,
    Object? userFeedState = freezed,
    Object? miscState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
      connectivityState: connectivityState == freezed
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
      userFeedState: userFeedState == freezed
          ? _value.userFeedState
          : userFeedState // ignore: cast_nullable_to_non_nullable
              as FeedResponsePayload?,
      miscState: miscState == freezed
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
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
  $UserStateCopyWith<$Res>? get userState {
    if (_value.userState == null) {
      return null;
    }

    return $UserStateCopyWith<$Res>(_value.userState!, (value) {
      return _then(_value.copyWith(userState: value));
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

  @override
  $FeedResponsePayloadCopyWith<$Res>? get userFeedState {
    if (_value.userFeedState == null) {
      return null;
    }

    return $FeedResponsePayloadCopyWith<$Res>(_value.userFeedState!, (value) {
      return _then(_value.copyWith(userFeedState: value));
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
}

/// @nodoc
abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AuthCredentials? credentials,
      UserState? userState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
  @override
  $UserStateCopyWith<$Res>? get userState;
  @override
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
  @override
  $FeedResponsePayloadCopyWith<$Res>? get userFeedState;
  @override
  $MiscStateCopyWith<$Res>? get miscState;
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object? credentials = freezed,
    Object? userState = freezed,
    Object? connectivityState = freezed,
    Object? userFeedState = freezed,
    Object? miscState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_AppState(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
      connectivityState: connectivityState == freezed
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
      userFeedState: userFeedState == freezed
          ? _value.userFeedState
          : userFeedState // ignore: cast_nullable_to_non_nullable
              as FeedResponsePayload?,
      miscState: miscState == freezed
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppState implements _AppState {
  _$_AppState(
      {this.credentials,
      this.userState,
      this.connectivityState,
      this.userFeedState,
      this.miscState,
      @JsonKey(ignore: true) this.wait});

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$_$_AppStateFromJson(json);

  @override
  final AuthCredentials? credentials;
  @override
  final UserState? userState;
  @override
  final ConnectivityState? connectivityState;
  @override
  final FeedResponsePayload? userFeedState;
  @override
  final MiscState? miscState;
  @override
  @JsonKey(ignore: true)
  final Wait? wait;

  @override
  String toString() {
    return 'AppState(credentials: $credentials, userState: $userState, connectivityState: $connectivityState, userFeedState: $userFeedState, miscState: $miscState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.credentials, credentials) ||
                const DeepCollectionEquality()
                    .equals(other.credentials, credentials)) &&
            (identical(other.userState, userState) ||
                const DeepCollectionEquality()
                    .equals(other.userState, userState)) &&
            (identical(other.connectivityState, connectivityState) ||
                const DeepCollectionEquality()
                    .equals(other.connectivityState, connectivityState)) &&
            (identical(other.userFeedState, userFeedState) ||
                const DeepCollectionEquality()
                    .equals(other.userFeedState, userFeedState)) &&
            (identical(other.miscState, miscState) ||
                const DeepCollectionEquality()
                    .equals(other.miscState, miscState)) &&
            (identical(other.wait, wait) ||
                const DeepCollectionEquality().equals(other.wait, wait)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(credentials) ^
      const DeepCollectionEquality().hash(userState) ^
      const DeepCollectionEquality().hash(connectivityState) ^
      const DeepCollectionEquality().hash(userFeedState) ^
      const DeepCollectionEquality().hash(miscState) ^
      const DeepCollectionEquality().hash(wait);

  @JsonKey(ignore: true)
  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppStateToJson(this);
  }
}

abstract class _AppState implements AppState {
  factory _AppState(
      {AuthCredentials? credentials,
      UserState? userState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait}) = _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  @override
  UserState? get userState => throw _privateConstructorUsedError;
  @override
  ConnectivityState? get connectivityState =>
      throw _privateConstructorUsedError;
  @override
  FeedResponsePayload? get userFeedState => throw _privateConstructorUsedError;
  @override
  MiscState? get miscState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppStateCopyWith<_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

MainAppState _$MainAppStateFromJson(Map<String, dynamic> json) {
  return _MainAppState.fromJson(json);
}

/// @nodoc
class _$MainAppStateTearOff {
  const _$MainAppStateTearOff();

  _MainAppState call(
      {AuthCredentials? credentials,
      UserState? userState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait}) {
    return _MainAppState(
      credentials: credentials,
      userState: userState,
      onboardingState: onboardingState,
      bottomNavigationState: bottomNavigationState,
      miscState: miscState,
      wait: wait,
    );
  }

  MainAppState fromJson(Map<String, Object> json) {
    return MainAppState.fromJson(json);
  }
}

/// @nodoc
const $MainAppState = _$MainAppStateTearOff();

/// @nodoc
mixin _$MainAppState {
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  UserState? get userState => throw _privateConstructorUsedError;
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  MiscState? get miscState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainAppStateCopyWith<MainAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainAppStateCopyWith<$Res> {
  factory $MainAppStateCopyWith(
          MainAppState value, $Res Function(MainAppState) then) =
      _$MainAppStateCopyWithImpl<$Res>;
  $Res call(
      {AuthCredentials? credentials,
      UserState? userState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait});

  $AuthCredentialsCopyWith<$Res>? get credentials;
  $UserStateCopyWith<$Res>? get userState;
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  $MiscStateCopyWith<$Res>? get miscState;
}

/// @nodoc
class _$MainAppStateCopyWithImpl<$Res> implements $MainAppStateCopyWith<$Res> {
  _$MainAppStateCopyWithImpl(this._value, this._then);

  final MainAppState _value;
  // ignore: unused_field
  final $Res Function(MainAppState) _then;

  @override
  $Res call({
    Object? credentials = freezed,
    Object? userState = freezed,
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
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
  $UserStateCopyWith<$Res>? get userState {
    if (_value.userState == null) {
      return null;
    }

    return $UserStateCopyWith<$Res>(_value.userState!, (value) {
      return _then(_value.copyWith(userState: value));
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
}

/// @nodoc
abstract class _$MainAppStateCopyWith<$Res>
    implements $MainAppStateCopyWith<$Res> {
  factory _$MainAppStateCopyWith(
          _MainAppState value, $Res Function(_MainAppState) then) =
      __$MainAppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AuthCredentials? credentials,
      UserState? userState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
  @override
  $UserStateCopyWith<$Res>? get userState;
  @override
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  @override
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  @override
  $MiscStateCopyWith<$Res>? get miscState;
}

/// @nodoc
class __$MainAppStateCopyWithImpl<$Res> extends _$MainAppStateCopyWithImpl<$Res>
    implements _$MainAppStateCopyWith<$Res> {
  __$MainAppStateCopyWithImpl(
      _MainAppState _value, $Res Function(_MainAppState) _then)
      : super(_value, (v) => _then(v as _MainAppState));

  @override
  _MainAppState get _value => super._value as _MainAppState;

  @override
  $Res call({
    Object? credentials = freezed,
    Object? userState = freezed,
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_MainAppState(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
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
      this.userState,
      this.onboardingState,
      this.bottomNavigationState,
      this.miscState,
      @JsonKey(ignore: true) this.wait});

  factory _$_MainAppState.fromJson(Map<String, dynamic> json) =>
      _$_$_MainAppStateFromJson(json);

  @override
  final AuthCredentials? credentials;
  @override
  final UserState? userState;
  @override
  final OnboardingState? onboardingState;
  @override
  final BottomNavigationState? bottomNavigationState;
  @override
  final MiscState? miscState;
  @override
  @JsonKey(ignore: true)
  final Wait? wait;

  @override
  String toString() {
    return 'MainAppState(credentials: $credentials, userState: $userState, onboardingState: $onboardingState, bottomNavigationState: $bottomNavigationState, miscState: $miscState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MainAppState &&
            (identical(other.credentials, credentials) ||
                const DeepCollectionEquality()
                    .equals(other.credentials, credentials)) &&
            (identical(other.userState, userState) ||
                const DeepCollectionEquality()
                    .equals(other.userState, userState)) &&
            (identical(other.onboardingState, onboardingState) ||
                const DeepCollectionEquality()
                    .equals(other.onboardingState, onboardingState)) &&
            (identical(other.bottomNavigationState, bottomNavigationState) ||
                const DeepCollectionEquality().equals(
                    other.bottomNavigationState, bottomNavigationState)) &&
            (identical(other.miscState, miscState) ||
                const DeepCollectionEquality()
                    .equals(other.miscState, miscState)) &&
            (identical(other.wait, wait) ||
                const DeepCollectionEquality().equals(other.wait, wait)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(credentials) ^
      const DeepCollectionEquality().hash(userState) ^
      const DeepCollectionEquality().hash(onboardingState) ^
      const DeepCollectionEquality().hash(bottomNavigationState) ^
      const DeepCollectionEquality().hash(miscState) ^
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

abstract class _MainAppState implements MainAppState {
  factory _MainAppState(
      {AuthCredentials? credentials,
      UserState? userState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait}) = _$_MainAppState;

  factory _MainAppState.fromJson(Map<String, dynamic> json) =
      _$_MainAppState.fromJson;

  @override
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  @override
  UserState? get userState => throw _privateConstructorUsedError;
  @override
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  @override
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  @override
  MiscState? get miscState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MainAppStateCopyWith<_MainAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedState _$FeedStateFromJson(Map<String, dynamic> json) {
  return _FeedState.fromJson(json);
}

/// @nodoc
class _$FeedStateTearOff {
  const _$FeedStateTearOff();

  _FeedState call() {
    return _FeedState();
  }

  FeedState fromJson(Map<String, Object> json) {
    return FeedState.fromJson(json);
  }
}

/// @nodoc
const $FeedState = _$FeedStateTearOff();

/// @nodoc
mixin _$FeedState {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedStateCopyWith<$Res> {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) then) =
      _$FeedStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FeedStateCopyWithImpl<$Res> implements $FeedStateCopyWith<$Res> {
  _$FeedStateCopyWithImpl(this._value, this._then);

  final FeedState _value;
  // ignore: unused_field
  final $Res Function(FeedState) _then;
}

/// @nodoc
abstract class _$FeedStateCopyWith<$Res> {
  factory _$FeedStateCopyWith(
          _FeedState value, $Res Function(_FeedState) then) =
      __$FeedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$FeedStateCopyWithImpl<$Res> extends _$FeedStateCopyWithImpl<$Res>
    implements _$FeedStateCopyWith<$Res> {
  __$FeedStateCopyWithImpl(_FeedState _value, $Res Function(_FeedState) _then)
      : super(_value, (v) => _then(v as _FeedState));

  @override
  _FeedState get _value => super._value as _FeedState;
}

/// @nodoc
@JsonSerializable()
class _$_FeedState implements _FeedState {
  _$_FeedState();

  factory _$_FeedState.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedStateFromJson(json);

  @override
  String toString() {
    return 'FeedState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FeedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedStateToJson(this);
  }
}

abstract class _FeedState implements FeedState {
  factory _FeedState() = _$_FeedState;

  factory _FeedState.fromJson(Map<String, dynamic> json) =
      _$_FeedState.fromJson;
}

HomeState _$HomeStateFromJson(Map<String, dynamic> json) {
  return _HomeState.fromJson(json);
}

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call() {
    return _HomeState();
  }

  HomeState fromJson(Map<String, Object> json) {
    return HomeState.fromJson(json);
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;
}

/// @nodoc
@JsonSerializable()
class _$_HomeState implements _HomeState {
  _$_HomeState();

  factory _$_HomeState.fromJson(Map<String, dynamic> json) =>
      _$_$_HomeStateFromJson(json);

  @override
  String toString() {
    return 'HomeState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _HomeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HomeStateToJson(this);
  }
}

abstract class _HomeState implements HomeState {
  factory _HomeState() = _$_HomeState;

  factory _HomeState.fromJson(Map<String, dynamic> json) =
      _$_HomeState.fromJson;
}

CommunitiesState _$CommunitiesStateFromJson(Map<String, dynamic> json) {
  return _CommunitiesState.fromJson(json);
}

/// @nodoc
class _$CommunitiesStateTearOff {
  const _$CommunitiesStateTearOff();

  _CommunitiesState call() {
    return _CommunitiesState();
  }

  CommunitiesState fromJson(Map<String, Object> json) {
    return CommunitiesState.fromJson(json);
  }
}

/// @nodoc
const $CommunitiesState = _$CommunitiesStateTearOff();

/// @nodoc
mixin _$CommunitiesState {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunitiesStateCopyWith<$Res> {
  factory $CommunitiesStateCopyWith(
          CommunitiesState value, $Res Function(CommunitiesState) then) =
      _$CommunitiesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommunitiesStateCopyWithImpl<$Res>
    implements $CommunitiesStateCopyWith<$Res> {
  _$CommunitiesStateCopyWithImpl(this._value, this._then);

  final CommunitiesState _value;
  // ignore: unused_field
  final $Res Function(CommunitiesState) _then;
}

/// @nodoc
abstract class _$CommunitiesStateCopyWith<$Res> {
  factory _$CommunitiesStateCopyWith(
          _CommunitiesState value, $Res Function(_CommunitiesState) then) =
      __$CommunitiesStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$CommunitiesStateCopyWithImpl<$Res>
    extends _$CommunitiesStateCopyWithImpl<$Res>
    implements _$CommunitiesStateCopyWith<$Res> {
  __$CommunitiesStateCopyWithImpl(
      _CommunitiesState _value, $Res Function(_CommunitiesState) _then)
      : super(_value, (v) => _then(v as _CommunitiesState));

  @override
  _CommunitiesState get _value => super._value as _CommunitiesState;
}

/// @nodoc
@JsonSerializable()
class _$_CommunitiesState implements _CommunitiesState {
  _$_CommunitiesState();

  factory _$_CommunitiesState.fromJson(Map<String, dynamic> json) =>
      _$_$_CommunitiesStateFromJson(json);

  @override
  String toString() {
    return 'CommunitiesState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _CommunitiesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CommunitiesStateToJson(this);
  }
}

abstract class _CommunitiesState implements CommunitiesState {
  factory _CommunitiesState() = _$_CommunitiesState;

  factory _CommunitiesState.fromJson(Map<String, dynamic> json) =
      _$_CommunitiesState.fromJson;
}
