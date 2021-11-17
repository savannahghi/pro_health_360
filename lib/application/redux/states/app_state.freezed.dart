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
      {UserProfileState? userProfileState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait}) {
    return _AppState(
      userProfileState: userProfileState,
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
  UserProfileState? get userProfileState => throw _privateConstructorUsedError;
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
      {UserProfileState? userProfileState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait});

  $UserProfileStateCopyWith<$Res>? get userProfileState;
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
    Object? userProfileState = freezed,
    Object? connectivityState = freezed,
    Object? userFeedState = freezed,
    Object? miscState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      userProfileState: userProfileState == freezed
          ? _value.userProfileState
          : userProfileState // ignore: cast_nullable_to_non_nullable
              as UserProfileState?,
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
  $UserProfileStateCopyWith<$Res>? get userProfileState {
    if (_value.userProfileState == null) {
      return null;
    }

    return $UserProfileStateCopyWith<$Res>(_value.userProfileState!, (value) {
      return _then(_value.copyWith(userProfileState: value));
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
      {UserProfileState? userProfileState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait});

  @override
  $UserProfileStateCopyWith<$Res>? get userProfileState;
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
    Object? userProfileState = freezed,
    Object? connectivityState = freezed,
    Object? userFeedState = freezed,
    Object? miscState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_AppState(
      userProfileState: userProfileState == freezed
          ? _value.userProfileState
          : userProfileState // ignore: cast_nullable_to_non_nullable
              as UserProfileState?,
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
      {this.userProfileState,
      this.connectivityState,
      this.userFeedState,
      this.miscState,
      @JsonKey(ignore: true) this.wait});

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$_$_AppStateFromJson(json);

  @override
  final UserProfileState? userProfileState;
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
    return 'AppState(userProfileState: $userProfileState, connectivityState: $connectivityState, userFeedState: $userFeedState, miscState: $miscState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.userProfileState, userProfileState) ||
                const DeepCollectionEquality()
                    .equals(other.userProfileState, userProfileState)) &&
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
      const DeepCollectionEquality().hash(userProfileState) ^
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
      {UserProfileState? userProfileState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait}) = _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  UserProfileState? get userProfileState => throw _privateConstructorUsedError;
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
  return _State.fromJson(json);
}

/// @nodoc
class _$MainAppStateTearOff {
  const _$MainAppStateTearOff();

  _State call(
      {OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientProfile? clientProfile,
      @JsonKey(ignore: true) Wait? wait}) {
    return _State(
      onboardingState: onboardingState,
      bottomNavigationState: bottomNavigationState,
      miscState: miscState,
      clientProfile: clientProfile,
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
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  MiscState? get miscState => throw _privateConstructorUsedError;
  ClientProfile? get clientProfile => throw _privateConstructorUsedError;
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
      {OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientProfile? clientProfile,
      @JsonKey(ignore: true) Wait? wait});

  $OnboardingStateCopyWith<$Res>? get onboardingState;
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  $MiscStateCopyWith<$Res>? get miscState;
  $ClientProfileCopyWith<$Res>? get clientProfile;
}

/// @nodoc
class _$MainAppStateCopyWithImpl<$Res> implements $MainAppStateCopyWith<$Res> {
  _$MainAppStateCopyWithImpl(this._value, this._then);

  final MainAppState _value;
  // ignore: unused_field
  final $Res Function(MainAppState) _then;

  @override
  $Res call({
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? clientProfile = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
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
      clientProfile: clientProfile == freezed
          ? _value.clientProfile
          : clientProfile // ignore: cast_nullable_to_non_nullable
              as ClientProfile?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
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
abstract class _$StateCopyWith<$Res> implements $MainAppStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call(
      {OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientProfile? clientProfile,
      @JsonKey(ignore: true) Wait? wait});

  @override
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  @override
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  @override
  $MiscStateCopyWith<$Res>? get miscState;
  @override
  $ClientProfileCopyWith<$Res>? get clientProfile;
}

/// @nodoc
class __$StateCopyWithImpl<$Res> extends _$MainAppStateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(_State _value, $Res Function(_State) _then)
      : super(_value, (v) => _then(v as _State));

  @override
  _State get _value => super._value as _State;

  @override
  $Res call({
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? clientProfile = freezed,
    Object? wait = freezed,
  }) {
    return _then(_State(
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
      clientProfile: clientProfile == freezed
          ? _value.clientProfile
          : clientProfile // ignore: cast_nullable_to_non_nullable
              as ClientProfile?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_State implements _State {
  _$_State(
      {this.onboardingState,
      this.bottomNavigationState,
      this.miscState,
      this.clientProfile,
      @JsonKey(ignore: true) this.wait});

  factory _$_State.fromJson(Map<String, dynamic> json) =>
      _$_$_StateFromJson(json);

  @override
  final OnboardingState? onboardingState;
  @override
  final BottomNavigationState? bottomNavigationState;
  @override
  final MiscState? miscState;
  @override
  final ClientProfile? clientProfile;
  @override
  @JsonKey(ignore: true)
  final Wait? wait;

  @override
  String toString() {
    return 'MainAppState(onboardingState: $onboardingState, bottomNavigationState: $bottomNavigationState, miscState: $miscState, clientProfile: $clientProfile, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _State &&
            (identical(other.onboardingState, onboardingState) ||
                const DeepCollectionEquality()
                    .equals(other.onboardingState, onboardingState)) &&
            (identical(other.bottomNavigationState, bottomNavigationState) ||
                const DeepCollectionEquality().equals(
                    other.bottomNavigationState, bottomNavigationState)) &&
            (identical(other.miscState, miscState) ||
                const DeepCollectionEquality()
                    .equals(other.miscState, miscState)) &&
            (identical(other.clientProfile, clientProfile) ||
                const DeepCollectionEquality()
                    .equals(other.clientProfile, clientProfile)) &&
            (identical(other.wait, wait) ||
                const DeepCollectionEquality().equals(other.wait, wait)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(onboardingState) ^
      const DeepCollectionEquality().hash(bottomNavigationState) ^
      const DeepCollectionEquality().hash(miscState) ^
      const DeepCollectionEquality().hash(clientProfile) ^
      const DeepCollectionEquality().hash(wait);

  @JsonKey(ignore: true)
  @override
  _$StateCopyWith<_State> get copyWith =>
      __$StateCopyWithImpl<_State>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StateToJson(this);
  }
}

abstract class _State implements MainAppState {
  factory _State(
      {OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientProfile? clientProfile,
      @JsonKey(ignore: true) Wait? wait}) = _$_State;

  factory _State.fromJson(Map<String, dynamic> json) = _$_State.fromJson;

  @override
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  @override
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  @override
  MiscState? get miscState => throw _privateConstructorUsedError;
  @override
  ClientProfile? get clientProfile => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StateCopyWith<_State> get copyWith => throw _privateConstructorUsedError;
}

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

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
class _$UserProfileTearOff {
  const _$UserProfileTearOff();

  _UserProfile call() {
    return _UserProfile();
  }

  UserProfile fromJson(Map<String, Object> json) {
    return UserProfile.fromJson(json);
  }
}

/// @nodoc
const $UserProfile = _$UserProfileTearOff();

/// @nodoc
mixin _$UserProfile {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  final UserProfile _value;
  // ignore: unused_field
  final $Res Function(UserProfile) _then;
}

/// @nodoc
abstract class _$UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(
          _UserProfile value, $Res Function(_UserProfile) then) =
      __$UserProfileCopyWithImpl<$Res>;
}

/// @nodoc
class __$UserProfileCopyWithImpl<$Res> extends _$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(
      _UserProfile _value, $Res Function(_UserProfile) _then)
      : super(_value, (v) => _then(v as _UserProfile));

  @override
  _UserProfile get _value => super._value as _UserProfile;
}

/// @nodoc
@JsonSerializable()
class _$_UserProfile implements _UserProfile {
  _$_UserProfile();

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$_$_UserProfileFromJson(json);

  @override
  String toString() {
    return 'UserProfile()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UserProfile);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserProfileToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  factory _UserProfile() = _$_UserProfile;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;
}

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  return _AuthState.fromJson(json);
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call({AuthCredentials? credentials}) {
    return _AuthState(
      credentials: credentials,
    );
  }

  AuthState fromJson(Map<String, Object> json) {
    return AuthState.fromJson(json);
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  AuthCredentials? get credentials => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call({AuthCredentials? credentials});

  $AuthCredentialsCopyWith<$Res>? get credentials;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? credentials = freezed,
  }) {
    return _then(_value.copyWith(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
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
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call({AuthCredentials? credentials});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object? credentials = freezed,
  }) {
    return _then(_AuthState(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthState implements _AuthState {
  _$_AuthState({this.credentials});

  factory _$_AuthState.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthStateFromJson(json);

  @override
  final AuthCredentials? credentials;

  @override
  String toString() {
    return 'AuthState(credentials: $credentials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.credentials, credentials) ||
                const DeepCollectionEquality()
                    .equals(other.credentials, credentials)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(credentials);

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthStateToJson(this);
  }
}

abstract class _AuthState implements AuthState {
  factory _AuthState({AuthCredentials? credentials}) = _$_AuthState;

  factory _AuthState.fromJson(Map<String, dynamic> json) =
      _$_AuthState.fromJson;

  @override
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

ConfidentialState _$ConfidentialStateFromJson(Map<String, dynamic> json) {
  return _ConfidentialState.fromJson(json);
}

/// @nodoc
class _$ConfidentialStateTearOff {
  const _$ConfidentialStateTearOff();

  _ConfidentialState call() {
    return _ConfidentialState();
  }

  ConfidentialState fromJson(Map<String, Object> json) {
    return ConfidentialState.fromJson(json);
  }
}

/// @nodoc
const $ConfidentialState = _$ConfidentialStateTearOff();

/// @nodoc
mixin _$ConfidentialState {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfidentialStateCopyWith<$Res> {
  factory $ConfidentialStateCopyWith(
          ConfidentialState value, $Res Function(ConfidentialState) then) =
      _$ConfidentialStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConfidentialStateCopyWithImpl<$Res>
    implements $ConfidentialStateCopyWith<$Res> {
  _$ConfidentialStateCopyWithImpl(this._value, this._then);

  final ConfidentialState _value;
  // ignore: unused_field
  final $Res Function(ConfidentialState) _then;
}

/// @nodoc
abstract class _$ConfidentialStateCopyWith<$Res> {
  factory _$ConfidentialStateCopyWith(
          _ConfidentialState value, $Res Function(_ConfidentialState) then) =
      __$ConfidentialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$ConfidentialStateCopyWithImpl<$Res>
    extends _$ConfidentialStateCopyWithImpl<$Res>
    implements _$ConfidentialStateCopyWith<$Res> {
  __$ConfidentialStateCopyWithImpl(
      _ConfidentialState _value, $Res Function(_ConfidentialState) _then)
      : super(_value, (v) => _then(v as _ConfidentialState));

  @override
  _ConfidentialState get _value => super._value as _ConfidentialState;
}

/// @nodoc
@JsonSerializable()
class _$_ConfidentialState implements _ConfidentialState {
  _$_ConfidentialState();

  factory _$_ConfidentialState.fromJson(Map<String, dynamic> json) =>
      _$_$_ConfidentialStateFromJson(json);

  @override
  String toString() {
    return 'ConfidentialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ConfidentialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConfidentialStateToJson(this);
  }
}

abstract class _ConfidentialState implements ConfidentialState {
  factory _ConfidentialState() = _$_ConfidentialState;

  factory _ConfidentialState.fromJson(Map<String, dynamic> json) =
      _$_ConfidentialState.fromJson;
}

NotificationState _$NotificationStateFromJson(Map<String, dynamic> json) {
  return _NotificationState.fromJson(json);
}

/// @nodoc
class _$NotificationStateTearOff {
  const _$NotificationStateTearOff();

  _NotificationState call() {
    return _NotificationState();
  }

  NotificationState fromJson(Map<String, Object> json) {
    return NotificationState.fromJson(json);
  }
}

/// @nodoc
const $NotificationState = _$NotificationStateTearOff();

/// @nodoc
mixin _$NotificationState {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  final NotificationState _value;
  // ignore: unused_field
  final $Res Function(NotificationState) _then;
}

/// @nodoc
abstract class _$NotificationStateCopyWith<$Res> {
  factory _$NotificationStateCopyWith(
          _NotificationState value, $Res Function(_NotificationState) then) =
      __$NotificationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$NotificationStateCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements _$NotificationStateCopyWith<$Res> {
  __$NotificationStateCopyWithImpl(
      _NotificationState _value, $Res Function(_NotificationState) _then)
      : super(_value, (v) => _then(v as _NotificationState));

  @override
  _NotificationState get _value => super._value as _NotificationState;
}

/// @nodoc
@JsonSerializable()
class _$_NotificationState implements _NotificationState {
  _$_NotificationState();

  factory _$_NotificationState.fromJson(Map<String, dynamic> json) =>
      _$_$_NotificationStateFromJson(json);

  @override
  String toString() {
    return 'NotificationState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NotificationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotificationStateToJson(this);
  }
}

abstract class _NotificationState implements NotificationState {
  factory _NotificationState() = _$_NotificationState;

  factory _NotificationState.fromJson(Map<String, dynamic> json) =
      _$_NotificationState.fromJson;
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

OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) {
  return _OnboardingState.fromJson(json);
}

/// @nodoc
class _$OnboardingStateTearOff {
  const _$OnboardingStateTearOff();

  _OnboardingState call() {
    return _OnboardingState();
  }

  OnboardingState fromJson(Map<String, Object> json) {
    return OnboardingState.fromJson(json);
  }
}

/// @nodoc
const $OnboardingState = _$OnboardingStateTearOff();

/// @nodoc
mixin _$OnboardingState {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  final OnboardingState _value;
  // ignore: unused_field
  final $Res Function(OnboardingState) _then;
}

/// @nodoc
abstract class _$OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(
          _OnboardingState value, $Res Function(_OnboardingState) then) =
      __$OnboardingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(
      _OnboardingState _value, $Res Function(_OnboardingState) _then)
      : super(_value, (v) => _then(v as _OnboardingState));

  @override
  _OnboardingState get _value => super._value as _OnboardingState;
}

/// @nodoc
@JsonSerializable()
class _$_OnboardingState implements _OnboardingState {
  _$_OnboardingState();

  factory _$_OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$_$_OnboardingStateFromJson(json);

  @override
  String toString() {
    return 'OnboardingState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnboardingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OnboardingStateToJson(this);
  }
}

abstract class _OnboardingState implements OnboardingState {
  factory _OnboardingState() = _$_OnboardingState;

  factory _OnboardingState.fromJson(Map<String, dynamic> json) =
      _$_OnboardingState.fromJson;
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
