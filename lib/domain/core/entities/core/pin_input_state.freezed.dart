// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pin_input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PINInputState _$PINInputStateFromJson(Map<String, dynamic> json) {
  return _PINInputState.fromJson(json);
}

/// @nodoc
class _$PINInputStateTearOff {
  const _$PINInputStateTearOff();

  _PINInputState call(
      {String? healthPagePINInputTime, int? tries, String? maxTryTime}) {
    return _PINInputState(
      healthPagePINInputTime: healthPagePINInputTime,
      tries: tries,
      maxTryTime: maxTryTime,
    );
  }

  PINInputState fromJson(Map<String, Object> json) {
    return PINInputState.fromJson(json);
  }
}

/// @nodoc
const $PINInputState = _$PINInputStateTearOff();

/// @nodoc
mixin _$PINInputState {
  String? get healthPagePINInputTime => throw _privateConstructorUsedError;
  int? get tries => throw _privateConstructorUsedError;
  String? get maxTryTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PINInputStateCopyWith<PINInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PINInputStateCopyWith<$Res> {
  factory $PINInputStateCopyWith(
          PINInputState value, $Res Function(PINInputState) then) =
      _$PINInputStateCopyWithImpl<$Res>;
  $Res call({String? healthPagePINInputTime, int? tries, String? maxTryTime});
}

/// @nodoc
class _$PINInputStateCopyWithImpl<$Res>
    implements $PINInputStateCopyWith<$Res> {
  _$PINInputStateCopyWithImpl(this._value, this._then);

  final PINInputState _value;
  // ignore: unused_field
  final $Res Function(PINInputState) _then;

  @override
  $Res call({
    Object? healthPagePINInputTime = freezed,
    Object? tries = freezed,
    Object? maxTryTime = freezed,
  }) {
    return _then(_value.copyWith(
      healthPagePINInputTime: healthPagePINInputTime == freezed
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
      tries: tries == freezed
          ? _value.tries
          : tries // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTryTime: maxTryTime == freezed
          ? _value.maxTryTime
          : maxTryTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PINInputStateCopyWith<$Res>
    implements $PINInputStateCopyWith<$Res> {
  factory _$PINInputStateCopyWith(
          _PINInputState value, $Res Function(_PINInputState) then) =
      __$PINInputStateCopyWithImpl<$Res>;
  @override
  $Res call({String? healthPagePINInputTime, int? tries, String? maxTryTime});
}

/// @nodoc
class __$PINInputStateCopyWithImpl<$Res>
    extends _$PINInputStateCopyWithImpl<$Res>
    implements _$PINInputStateCopyWith<$Res> {
  __$PINInputStateCopyWithImpl(
      _PINInputState _value, $Res Function(_PINInputState) _then)
      : super(_value, (v) => _then(v as _PINInputState));

  @override
  _PINInputState get _value => super._value as _PINInputState;

  @override
  $Res call({
    Object? healthPagePINInputTime = freezed,
    Object? tries = freezed,
    Object? maxTryTime = freezed,
  }) {
    return _then(_PINInputState(
      healthPagePINInputTime: healthPagePINInputTime == freezed
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
      tries: tries == freezed
          ? _value.tries
          : tries // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTryTime: maxTryTime == freezed
          ? _value.maxTryTime
          : maxTryTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PINInputState implements _PINInputState {
  _$_PINInputState({this.healthPagePINInputTime, this.tries, this.maxTryTime});

  factory _$_PINInputState.fromJson(Map<String, dynamic> json) =>
      _$_$_PINInputStateFromJson(json);

  @override
  final String? healthPagePINInputTime;
  @override
  final int? tries;
  @override
  final String? maxTryTime;

  @override
  String toString() {
    return 'PINInputState(healthPagePINInputTime: $healthPagePINInputTime, tries: $tries, maxTryTime: $maxTryTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PINInputState &&
            (identical(other.healthPagePINInputTime, healthPagePINInputTime) ||
                const DeepCollectionEquality().equals(
                    other.healthPagePINInputTime, healthPagePINInputTime)) &&
            (identical(other.tries, tries) ||
                const DeepCollectionEquality().equals(other.tries, tries)) &&
            (identical(other.maxTryTime, maxTryTime) ||
                const DeepCollectionEquality()
                    .equals(other.maxTryTime, maxTryTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(healthPagePINInputTime) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(maxTryTime);

  @JsonKey(ignore: true)
  @override
  _$PINInputStateCopyWith<_PINInputState> get copyWith =>
      __$PINInputStateCopyWithImpl<_PINInputState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PINInputStateToJson(this);
  }
}

abstract class _PINInputState implements PINInputState {
  factory _PINInputState(
      {String? healthPagePINInputTime,
      int? tries,
      String? maxTryTime}) = _$_PINInputState;

  factory _PINInputState.fromJson(Map<String, dynamic> json) =
      _$_PINInputState.fromJson;

  @override
  String? get healthPagePINInputTime => throw _privateConstructorUsedError;
  @override
  int? get tries => throw _privateConstructorUsedError;
  @override
  String? get maxTryTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PINInputStateCopyWith<_PINInputState> get copyWith =>
      throw _privateConstructorUsedError;
}
