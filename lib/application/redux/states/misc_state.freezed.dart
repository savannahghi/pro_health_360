// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'misc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MiscState _$MiscStateFromJson(Map<String, dynamic> json) {
  return _MiscState.fromJson(json);
}

/// @nodoc
class _$MiscStateTearOff {
  const _$MiscStateTearOff();

  _MiscState call(
      {PhoneLogin? phoneLogin,
      CreatePIN? createPIN,
      UserPin? userPin,
      Set<AppErrorState>? appErrorState,
      BottomNavObj? bottomNavObj,
      List<dynamic>? libraryListItems,
      String? healthPagePINInputTime,
      TermsAndConditions? termsAndConditions}) {
    return _MiscState(
      phoneLogin: phoneLogin,
      createPIN: createPIN,
      userPin: userPin,
      appErrorState: appErrorState,
      bottomNavObj: bottomNavObj,
      libraryListItems: libraryListItems,
      healthPagePINInputTime: healthPagePINInputTime,
      termsAndConditions: termsAndConditions,
    );
  }

  MiscState fromJson(Map<String, Object> json) {
    return MiscState.fromJson(json);
  }
}

/// @nodoc
const $MiscState = _$MiscStateTearOff();

/// @nodoc
mixin _$MiscState {
  PhoneLogin? get phoneLogin => throw _privateConstructorUsedError;
  CreatePIN? get createPIN => throw _privateConstructorUsedError;
  UserPin? get userPin => throw _privateConstructorUsedError;
  Set<AppErrorState>? get appErrorState => throw _privateConstructorUsedError;
  BottomNavObj? get bottomNavObj => throw _privateConstructorUsedError;
  List<dynamic>? get libraryListItems => throw _privateConstructorUsedError;
  String? get healthPagePINInputTime => throw _privateConstructorUsedError;
  TermsAndConditions? get termsAndConditions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MiscStateCopyWith<MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiscStateCopyWith<$Res> {
  factory $MiscStateCopyWith(MiscState value, $Res Function(MiscState) then) =
      _$MiscStateCopyWithImpl<$Res>;
  $Res call(
      {PhoneLogin? phoneLogin,
      CreatePIN? createPIN,
      UserPin? userPin,
      Set<AppErrorState>? appErrorState,
      BottomNavObj? bottomNavObj,
      List<dynamic>? libraryListItems,
      String? healthPagePINInputTime,
      TermsAndConditions? termsAndConditions});

  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
}

/// @nodoc
class _$MiscStateCopyWithImpl<$Res> implements $MiscStateCopyWith<$Res> {
  _$MiscStateCopyWithImpl(this._value, this._then);

  final MiscState _value;
  // ignore: unused_field
  final $Res Function(MiscState) _then;

  @override
  $Res call({
    Object? phoneLogin = freezed,
    Object? createPIN = freezed,
    Object? userPin = freezed,
    Object? appErrorState = freezed,
    Object? bottomNavObj = freezed,
    Object? libraryListItems = freezed,
    Object? healthPagePINInputTime = freezed,
    Object? termsAndConditions = freezed,
  }) {
    return _then(_value.copyWith(
      phoneLogin: phoneLogin == freezed
          ? _value.phoneLogin
          : phoneLogin // ignore: cast_nullable_to_non_nullable
              as PhoneLogin?,
      createPIN: createPIN == freezed
          ? _value.createPIN
          : createPIN // ignore: cast_nullable_to_non_nullable
              as CreatePIN?,
      userPin: userPin == freezed
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as UserPin?,
      appErrorState: appErrorState == freezed
          ? _value.appErrorState
          : appErrorState // ignore: cast_nullable_to_non_nullable
              as Set<AppErrorState>?,
      bottomNavObj: bottomNavObj == freezed
          ? _value.bottomNavObj
          : bottomNavObj // ignore: cast_nullable_to_non_nullable
              as BottomNavObj?,
      libraryListItems: libraryListItems == freezed
          ? _value.libraryListItems
          : libraryListItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      healthPagePINInputTime: healthPagePINInputTime == freezed
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions?,
    ));
  }

  @override
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions {
    if (_value.termsAndConditions == null) {
      return null;
    }

    return $TermsAndConditionsCopyWith<$Res>(_value.termsAndConditions!,
        (value) {
      return _then(_value.copyWith(termsAndConditions: value));
    });
  }
}

/// @nodoc
abstract class _$MiscStateCopyWith<$Res> implements $MiscStateCopyWith<$Res> {
  factory _$MiscStateCopyWith(
          _MiscState value, $Res Function(_MiscState) then) =
      __$MiscStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {PhoneLogin? phoneLogin,
      CreatePIN? createPIN,
      UserPin? userPin,
      Set<AppErrorState>? appErrorState,
      BottomNavObj? bottomNavObj,
      List<dynamic>? libraryListItems,
      String? healthPagePINInputTime,
      TermsAndConditions? termsAndConditions});

  @override
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
}

/// @nodoc
class __$MiscStateCopyWithImpl<$Res> extends _$MiscStateCopyWithImpl<$Res>
    implements _$MiscStateCopyWith<$Res> {
  __$MiscStateCopyWithImpl(_MiscState _value, $Res Function(_MiscState) _then)
      : super(_value, (v) => _then(v as _MiscState));

  @override
  _MiscState get _value => super._value as _MiscState;

  @override
  $Res call({
    Object? phoneLogin = freezed,
    Object? createPIN = freezed,
    Object? userPin = freezed,
    Object? appErrorState = freezed,
    Object? bottomNavObj = freezed,
    Object? libraryListItems = freezed,
    Object? healthPagePINInputTime = freezed,
    Object? termsAndConditions = freezed,
  }) {
    return _then(_MiscState(
      phoneLogin: phoneLogin == freezed
          ? _value.phoneLogin
          : phoneLogin // ignore: cast_nullable_to_non_nullable
              as PhoneLogin?,
      createPIN: createPIN == freezed
          ? _value.createPIN
          : createPIN // ignore: cast_nullable_to_non_nullable
              as CreatePIN?,
      userPin: userPin == freezed
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as UserPin?,
      appErrorState: appErrorState == freezed
          ? _value.appErrorState
          : appErrorState // ignore: cast_nullable_to_non_nullable
              as Set<AppErrorState>?,
      bottomNavObj: bottomNavObj == freezed
          ? _value.bottomNavObj
          : bottomNavObj // ignore: cast_nullable_to_non_nullable
              as BottomNavObj?,
      libraryListItems: libraryListItems == freezed
          ? _value.libraryListItems
          : libraryListItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      healthPagePINInputTime: healthPagePINInputTime == freezed
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MiscState implements _MiscState {
  _$_MiscState(
      {this.phoneLogin,
      this.createPIN,
      this.userPin,
      this.appErrorState,
      this.bottomNavObj,
      this.libraryListItems,
      this.healthPagePINInputTime,
      this.termsAndConditions});

  factory _$_MiscState.fromJson(Map<String, dynamic> json) =>
      _$_$_MiscStateFromJson(json);

  @override
  final PhoneLogin? phoneLogin;
  @override
  final CreatePIN? createPIN;
  @override
  final UserPin? userPin;
  @override
  final Set<AppErrorState>? appErrorState;
  @override
  final BottomNavObj? bottomNavObj;
  @override
  final List<dynamic>? libraryListItems;
  @override
  final String? healthPagePINInputTime;
  @override
  final TermsAndConditions? termsAndConditions;

  @override
  String toString() {
    return 'MiscState(phoneLogin: $phoneLogin, createPIN: $createPIN, userPin: $userPin, appErrorState: $appErrorState, bottomNavObj: $bottomNavObj, libraryListItems: $libraryListItems, healthPagePINInputTime: $healthPagePINInputTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MiscState &&
            (identical(other.phoneLogin, phoneLogin) ||
                const DeepCollectionEquality()
                    .equals(other.phoneLogin, phoneLogin)) &&
            (identical(other.createPIN, createPIN) ||
                const DeepCollectionEquality()
                    .equals(other.createPIN, createPIN)) &&
            (identical(other.userPin, userPin) ||
                const DeepCollectionEquality()
                    .equals(other.userPin, userPin)) &&
            (identical(other.appErrorState, appErrorState) ||
                const DeepCollectionEquality()
                    .equals(other.appErrorState, appErrorState)) &&
            (identical(other.bottomNavObj, bottomNavObj) ||
                const DeepCollectionEquality()
                    .equals(other.bottomNavObj, bottomNavObj)) &&
            (identical(other.libraryListItems, libraryListItems) ||
                const DeepCollectionEquality()
                    .equals(other.libraryListItems, libraryListItems)) &&
            (identical(other.healthPagePINInputTime, healthPagePINInputTime) ||
                const DeepCollectionEquality().equals(
                    other.healthPagePINInputTime, healthPagePINInputTime)) &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                const DeepCollectionEquality()
                    .equals(other.termsAndConditions, termsAndConditions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneLogin) ^
      const DeepCollectionEquality().hash(createPIN) ^
      const DeepCollectionEquality().hash(userPin) ^
      const DeepCollectionEquality().hash(appErrorState) ^
      const DeepCollectionEquality().hash(bottomNavObj) ^
      const DeepCollectionEquality().hash(libraryListItems) ^
      const DeepCollectionEquality().hash(healthPagePINInputTime) ^
      const DeepCollectionEquality().hash(termsAndConditions);

  @JsonKey(ignore: true)
  @override
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      __$MiscStateCopyWithImpl<_MiscState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MiscStateToJson(this);
  }
}

abstract class _MiscState implements MiscState {
  factory _MiscState(
      {PhoneLogin? phoneLogin,
      CreatePIN? createPIN,
      UserPin? userPin,
      Set<AppErrorState>? appErrorState,
      BottomNavObj? bottomNavObj,
      List<dynamic>? libraryListItems,
      String? healthPagePINInputTime,
      TermsAndConditions? termsAndConditions}) = _$_MiscState;

  factory _MiscState.fromJson(Map<String, dynamic> json) =
      _$_MiscState.fromJson;

  @override
  PhoneLogin? get phoneLogin => throw _privateConstructorUsedError;
  @override
  CreatePIN? get createPIN => throw _privateConstructorUsedError;
  @override
  UserPin? get userPin => throw _privateConstructorUsedError;
  @override
  Set<AppErrorState>? get appErrorState => throw _privateConstructorUsedError;
  @override
  BottomNavObj? get bottomNavObj => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get libraryListItems => throw _privateConstructorUsedError;
  @override
  String? get healthPagePINInputTime => throw _privateConstructorUsedError;
  @override
  TermsAndConditions? get termsAndConditions =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
