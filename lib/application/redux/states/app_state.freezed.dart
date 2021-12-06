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
      OnboardingState? onboardingState,
      HomeState? homeState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientState? clientState,
      ConnectivityState? connectivityState,
      ContentState? contentState,
      SavedContentState? savedContentState,
      @JsonKey(ignore: true) Wait? wait}) {
    return _AppState(
      credentials: credentials,
      onboardingState: onboardingState,
      homeState: homeState,
      bottomNavigationState: bottomNavigationState,
      miscState: miscState,
      clientState: clientState,
      connectivityState: connectivityState,
      contentState: contentState,
      savedContentState: savedContentState,
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
  HomeState? get homeState => throw _privateConstructorUsedError;
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  MiscState? get miscState => throw _privateConstructorUsedError;
  ClientState? get clientState => throw _privateConstructorUsedError;
  ConnectivityState? get connectivityState =>
      throw _privateConstructorUsedError;
  ContentState? get contentState => throw _privateConstructorUsedError;
  SavedContentState? get savedContentState =>
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
      HomeState? homeState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientState? clientState,
      ConnectivityState? connectivityState,
      ContentState? contentState,
      SavedContentState? savedContentState,
      @JsonKey(ignore: true) Wait? wait});

  $AuthCredentialsCopyWith<$Res>? get credentials;
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  $HomeStateCopyWith<$Res>? get homeState;
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  $MiscStateCopyWith<$Res>? get miscState;
  $ClientStateCopyWith<$Res>? get clientState;
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
  $ContentStateCopyWith<$Res>? get contentState;
  $SavedContentStateCopyWith<$Res>? get savedContentState;
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
    Object? homeState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? clientState = freezed,
    Object? connectivityState = freezed,
    Object? contentState = freezed,
    Object? savedContentState = freezed,
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
      homeState: homeState == freezed
          ? _value.homeState
          : homeState // ignore: cast_nullable_to_non_nullable
              as HomeState?,
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
      contentState: contentState == freezed
          ? _value.contentState
          : contentState // ignore: cast_nullable_to_non_nullable
              as ContentState?,
      savedContentState: savedContentState == freezed
          ? _value.savedContentState
          : savedContentState // ignore: cast_nullable_to_non_nullable
              as SavedContentState?,
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
  $HomeStateCopyWith<$Res>? get homeState {
    if (_value.homeState == null) {
      return null;
    }

    return $HomeStateCopyWith<$Res>(_value.homeState!, (value) {
      return _then(_value.copyWith(homeState: value));
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

  @override
  $ContentStateCopyWith<$Res>? get contentState {
    if (_value.contentState == null) {
      return null;
    }

    return $ContentStateCopyWith<$Res>(_value.contentState!, (value) {
      return _then(_value.copyWith(contentState: value));
    });
  }

  @override
  $SavedContentStateCopyWith<$Res>? get savedContentState {
    if (_value.savedContentState == null) {
      return null;
    }

    return $SavedContentStateCopyWith<$Res>(_value.savedContentState!, (value) {
      return _then(_value.copyWith(savedContentState: value));
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
      OnboardingState? onboardingState,
      HomeState? homeState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientState? clientState,
      ConnectivityState? connectivityState,
      ContentState? contentState,
      SavedContentState? savedContentState,
      @JsonKey(ignore: true) Wait? wait});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
  @override
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  @override
  $HomeStateCopyWith<$Res>? get homeState;
  @override
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  @override
  $MiscStateCopyWith<$Res>? get miscState;
  @override
  $ClientStateCopyWith<$Res>? get clientState;
  @override
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
  @override
  $ContentStateCopyWith<$Res>? get contentState;
  @override
  $SavedContentStateCopyWith<$Res>? get savedContentState;
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
    Object? onboardingState = freezed,
    Object? homeState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? clientState = freezed,
    Object? connectivityState = freezed,
    Object? contentState = freezed,
    Object? savedContentState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_AppState(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      onboardingState: onboardingState == freezed
          ? _value.onboardingState
          : onboardingState // ignore: cast_nullable_to_non_nullable
              as OnboardingState?,
      homeState: homeState == freezed
          ? _value.homeState
          : homeState // ignore: cast_nullable_to_non_nullable
              as HomeState?,
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
      contentState: contentState == freezed
          ? _value.contentState
          : contentState // ignore: cast_nullable_to_non_nullable
              as ContentState?,
      savedContentState: savedContentState == freezed
          ? _value.savedContentState
          : savedContentState // ignore: cast_nullable_to_non_nullable
              as SavedContentState?,
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
      this.onboardingState,
      this.homeState,
      this.bottomNavigationState,
      this.miscState,
      this.clientState,
      this.connectivityState,
      this.contentState,
      this.savedContentState,
      @JsonKey(ignore: true) this.wait});

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$_$_AppStateFromJson(json);

  @override
  final AuthCredentials? credentials;
  @override
  final OnboardingState? onboardingState;
  @override
  final HomeState? homeState;
  @override
  final BottomNavigationState? bottomNavigationState;
  @override
  final MiscState? miscState;
  @override
  final ClientState? clientState;
  @override
  final ConnectivityState? connectivityState;
  @override
  final ContentState? contentState;
  @override
  final SavedContentState? savedContentState;
  @override
  @JsonKey(ignore: true)
  final Wait? wait;

  @override
  String toString() {
    return 'AppState(credentials: $credentials, onboardingState: $onboardingState, homeState: $homeState, bottomNavigationState: $bottomNavigationState, miscState: $miscState, clientState: $clientState, connectivityState: $connectivityState, contentState: $contentState, savedContentState: $savedContentState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.credentials, credentials) ||
                const DeepCollectionEquality()
                    .equals(other.credentials, credentials)) &&
            (identical(other.onboardingState, onboardingState) ||
                const DeepCollectionEquality()
                    .equals(other.onboardingState, onboardingState)) &&
            (identical(other.homeState, homeState) ||
                const DeepCollectionEquality()
                    .equals(other.homeState, homeState)) &&
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
            (identical(other.contentState, contentState) ||
                const DeepCollectionEquality()
                    .equals(other.contentState, contentState)) &&
            (identical(other.savedContentState, savedContentState) ||
                const DeepCollectionEquality()
                    .equals(other.savedContentState, savedContentState)) &&
            (identical(other.wait, wait) ||
                const DeepCollectionEquality().equals(other.wait, wait)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(credentials) ^
      const DeepCollectionEquality().hash(onboardingState) ^
      const DeepCollectionEquality().hash(homeState) ^
      const DeepCollectionEquality().hash(bottomNavigationState) ^
      const DeepCollectionEquality().hash(miscState) ^
      const DeepCollectionEquality().hash(clientState) ^
      const DeepCollectionEquality().hash(connectivityState) ^
      const DeepCollectionEquality().hash(contentState) ^
      const DeepCollectionEquality().hash(savedContentState) ^
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
      OnboardingState? onboardingState,
      HomeState? homeState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      ClientState? clientState,
      ConnectivityState? connectivityState,
      ContentState? contentState,
      SavedContentState? savedContentState,
      @JsonKey(ignore: true) Wait? wait}) = _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  @override
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  @override
  HomeState? get homeState => throw _privateConstructorUsedError;
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
  ContentState? get contentState => throw _privateConstructorUsedError;
  @override
  SavedContentState? get savedContentState =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppStateCopyWith<_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
