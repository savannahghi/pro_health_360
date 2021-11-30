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
      {String? initialRoute,
      UserPin? userPin,
      List<dynamic>? libraryListItems,
      String? healthPagePINInputTime}) {
    return _MiscState(
      initialRoute: initialRoute,
      userPin: userPin,
      libraryListItems: libraryListItems,
      healthPagePINInputTime: healthPagePINInputTime,
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
  String? get initialRoute => throw _privateConstructorUsedError;
  UserPin? get userPin => throw _privateConstructorUsedError;
  List<dynamic>? get libraryListItems => throw _privateConstructorUsedError;
  String? get healthPagePINInputTime => throw _privateConstructorUsedError;

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
      {String? initialRoute,
      UserPin? userPin,
      List<dynamic>? libraryListItems,
      String? healthPagePINInputTime});
}

/// @nodoc
class _$MiscStateCopyWithImpl<$Res> implements $MiscStateCopyWith<$Res> {
  _$MiscStateCopyWithImpl(this._value, this._then);

  final MiscState _value;
  // ignore: unused_field
  final $Res Function(MiscState) _then;

  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? userPin = freezed,
    Object? libraryListItems = freezed,
    Object? healthPagePINInputTime = freezed,
  }) {
    return _then(_value.copyWith(
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      userPin: userPin == freezed
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as UserPin?,
      libraryListItems: libraryListItems == freezed
          ? _value.libraryListItems
          : libraryListItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      healthPagePINInputTime: healthPagePINInputTime == freezed
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MiscStateCopyWith<$Res> implements $MiscStateCopyWith<$Res> {
  factory _$MiscStateCopyWith(
          _MiscState value, $Res Function(_MiscState) then) =
      __$MiscStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? initialRoute,
      UserPin? userPin,
      List<dynamic>? libraryListItems,
      String? healthPagePINInputTime});
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
    Object? initialRoute = freezed,
    Object? userPin = freezed,
    Object? libraryListItems = freezed,
    Object? healthPagePINInputTime = freezed,
  }) {
    return _then(_MiscState(
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      userPin: userPin == freezed
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as UserPin?,
      libraryListItems: libraryListItems == freezed
          ? _value.libraryListItems
          : libraryListItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      healthPagePINInputTime: healthPagePINInputTime == freezed
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MiscState implements _MiscState {
  _$_MiscState(
      {this.initialRoute,
      this.userPin,
      this.libraryListItems,
      this.healthPagePINInputTime});

  factory _$_MiscState.fromJson(Map<String, dynamic> json) =>
      _$_$_MiscStateFromJson(json);

  @override
  final String? initialRoute;
  @override
  final UserPin? userPin;
  @override
  final List<dynamic>? libraryListItems;
  @override
  final String? healthPagePINInputTime;

  @override
  String toString() {
    return 'MiscState(initialRoute: $initialRoute, userPin: $userPin, libraryListItems: $libraryListItems, healthPagePINInputTime: $healthPagePINInputTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MiscState &&
            (identical(other.initialRoute, initialRoute) ||
                const DeepCollectionEquality()
                    .equals(other.initialRoute, initialRoute)) &&
            (identical(other.userPin, userPin) ||
                const DeepCollectionEquality()
                    .equals(other.userPin, userPin)) &&
            (identical(other.libraryListItems, libraryListItems) ||
                const DeepCollectionEquality()
                    .equals(other.libraryListItems, libraryListItems)) &&
            (identical(other.healthPagePINInputTime, healthPagePINInputTime) ||
                const DeepCollectionEquality().equals(
                    other.healthPagePINInputTime, healthPagePINInputTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialRoute) ^
      const DeepCollectionEquality().hash(userPin) ^
      const DeepCollectionEquality().hash(libraryListItems) ^
      const DeepCollectionEquality().hash(healthPagePINInputTime);

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
      {String? initialRoute,
      UserPin? userPin,
      List<dynamic>? libraryListItems,
      String? healthPagePINInputTime}) = _$_MiscState;

  factory _MiscState.fromJson(Map<String, dynamic> json) =
      _$_MiscState.fromJson;

  @override
  String? get initialRoute => throw _privateConstructorUsedError;
  @override
  UserPin? get userPin => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get libraryListItems => throw _privateConstructorUsedError;
  @override
  String? get healthPagePINInputTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
