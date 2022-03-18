// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reset_pin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResetPINState _$ResetPINStateFromJson(Map<String, dynamic> json) {
  return _ResetPINState.fromJson(json);
}

/// @nodoc
class _$ResetPINStateTearOff {
  const _$ResetPINStateTearOff();

  _ResetPINState call({String? phone, bool? isPINSet}) {
    return _ResetPINState(
      phone: phone,
      isPINSet: isPINSet,
    );
  }

  ResetPINState fromJson(Map<String, Object?> json) {
    return ResetPINState.fromJson(json);
  }
}

/// @nodoc
const $ResetPINState = _$ResetPINStateTearOff();

/// @nodoc
mixin _$ResetPINState {
  String? get phone =>
      throw _privateConstructorUsedError; //If the user has set their PIN
  bool? get isPINSet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPINStateCopyWith<ResetPINState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPINStateCopyWith<$Res> {
  factory $ResetPINStateCopyWith(
          ResetPINState value, $Res Function(ResetPINState) then) =
      _$ResetPINStateCopyWithImpl<$Res>;
  $Res call({String? phone, bool? isPINSet});
}

/// @nodoc
class _$ResetPINStateCopyWithImpl<$Res>
    implements $ResetPINStateCopyWith<$Res> {
  _$ResetPINStateCopyWithImpl(this._value, this._then);

  final ResetPINState _value;
  // ignore: unused_field
  final $Res Function(ResetPINState) _then;

  @override
  $Res call({
    Object? phone = freezed,
    Object? isPINSet = freezed,
  }) {
    return _then(_value.copyWith(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isPINSet: isPINSet == freezed
          ? _value.isPINSet
          : isPINSet // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ResetPINStateCopyWith<$Res>
    implements $ResetPINStateCopyWith<$Res> {
  factory _$ResetPINStateCopyWith(
          _ResetPINState value, $Res Function(_ResetPINState) then) =
      __$ResetPINStateCopyWithImpl<$Res>;
  @override
  $Res call({String? phone, bool? isPINSet});
}

/// @nodoc
class __$ResetPINStateCopyWithImpl<$Res>
    extends _$ResetPINStateCopyWithImpl<$Res>
    implements _$ResetPINStateCopyWith<$Res> {
  __$ResetPINStateCopyWithImpl(
      _ResetPINState _value, $Res Function(_ResetPINState) _then)
      : super(_value, (v) => _then(v as _ResetPINState));

  @override
  _ResetPINState get _value => super._value as _ResetPINState;

  @override
  $Res call({
    Object? phone = freezed,
    Object? isPINSet = freezed,
  }) {
    return _then(_ResetPINState(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isPINSet: isPINSet == freezed
          ? _value.isPINSet
          : isPINSet // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResetPINState implements _ResetPINState {
  _$_ResetPINState({this.phone, this.isPINSet});

  factory _$_ResetPINState.fromJson(Map<String, dynamic> json) =>
      _$$_ResetPINStateFromJson(json);

  @override
  final String? phone;
  @override //If the user has set their PIN
  final bool? isPINSet;

  @override
  String toString() {
    return 'ResetPINState(phone: $phone, isPINSet: $isPINSet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResetPINState &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.isPINSet, isPINSet));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(isPINSet));

  @JsonKey(ignore: true)
  @override
  _$ResetPINStateCopyWith<_ResetPINState> get copyWith =>
      __$ResetPINStateCopyWithImpl<_ResetPINState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResetPINStateToJson(this);
  }
}

abstract class _ResetPINState implements ResetPINState {
  factory _ResetPINState({String? phone, bool? isPINSet}) = _$_ResetPINState;

  factory _ResetPINState.fromJson(Map<String, dynamic> json) =
      _$_ResetPINState.fromJson;

  @override
  String? get phone;
  @override //If the user has set their PIN
  bool? get isPINSet;
  @override
  @JsonKey(ignore: true)
  _$ResetPINStateCopyWith<_ResetPINState> get copyWith =>
      throw _privateConstructorUsedError;
}