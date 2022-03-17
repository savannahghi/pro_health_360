// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_pin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetPINState _$SetPINStateFromJson(Map<String, dynamic> json) {
  return _SetPINState.fromJson(json);
}

/// @nodoc
class _$SetPINStateTearOff {
  const _$SetPINStateTearOff();

  _SetPINState call({String? phone, bool? isPINSet}) {
    return _SetPINState(
      phone: phone,
      isPINSet: isPINSet,
    );
  }

  SetPINState fromJson(Map<String, Object?> json) {
    return SetPINState.fromJson(json);
  }
}

/// @nodoc
const $SetPINState = _$SetPINStateTearOff();

/// @nodoc
mixin _$SetPINState {
  String? get phone =>
      throw _privateConstructorUsedError; //If the user has set their PIN
  bool? get isPINSet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetPINStateCopyWith<SetPINState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetPINStateCopyWith<$Res> {
  factory $SetPINStateCopyWith(
          SetPINState value, $Res Function(SetPINState) then) =
      _$SetPINStateCopyWithImpl<$Res>;
  $Res call({String? phone, bool? isPINSet});
}

/// @nodoc
class _$SetPINStateCopyWithImpl<$Res> implements $SetPINStateCopyWith<$Res> {
  _$SetPINStateCopyWithImpl(this._value, this._then);

  final SetPINState _value;
  // ignore: unused_field
  final $Res Function(SetPINState) _then;

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
abstract class _$SetPINStateCopyWith<$Res>
    implements $SetPINStateCopyWith<$Res> {
  factory _$SetPINStateCopyWith(
          _SetPINState value, $Res Function(_SetPINState) then) =
      __$SetPINStateCopyWithImpl<$Res>;
  @override
  $Res call({String? phone, bool? isPINSet});
}

/// @nodoc
class __$SetPINStateCopyWithImpl<$Res> extends _$SetPINStateCopyWithImpl<$Res>
    implements _$SetPINStateCopyWith<$Res> {
  __$SetPINStateCopyWithImpl(
      _SetPINState _value, $Res Function(_SetPINState) _then)
      : super(_value, (v) => _then(v as _SetPINState));

  @override
  _SetPINState get _value => super._value as _SetPINState;

  @override
  $Res call({
    Object? phone = freezed,
    Object? isPINSet = freezed,
  }) {
    return _then(_SetPINState(
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
class _$_SetPINState implements _SetPINState {
  _$_SetPINState({this.phone, this.isPINSet});

  factory _$_SetPINState.fromJson(Map<String, dynamic> json) =>
      _$$_SetPINStateFromJson(json);

  @override
  final String? phone;
  @override //If the user has set their PIN
  final bool? isPINSet;

  @override
  String toString() {
    return 'SetPINState(phone: $phone, isPINSet: $isPINSet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetPINState &&
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
  _$SetPINStateCopyWith<_SetPINState> get copyWith =>
      __$SetPINStateCopyWithImpl<_SetPINState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetPINStateToJson(this);
  }
}

abstract class _SetPINState implements SetPINState {
  factory _SetPINState({String? phone, bool? isPINSet}) = _$_SetPINState;

  factory _SetPINState.fromJson(Map<String, dynamic> json) =
      _$_SetPINState.fromJson;

  @override
  String? get phone;
  @override //If the user has set their PIN
  bool? get isPINSet;
  @override
  @JsonKey(ignore: true)
  _$SetPINStateCopyWith<_SetPINState> get copyWith =>
      throw _privateConstructorUsedError;
}
