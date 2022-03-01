// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationState _$NotificationStateFromJson(Map<String, dynamic> json) {
  return _NotificationState.fromJson(json);
}

/// @nodoc
class _$NotificationStateTearOff {
  const _$NotificationStateTearOff();

  _NotificationState call() {
    return _NotificationState();
  }

  NotificationState fromJson(Map<String, Object?> json) {
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
      _$$_NotificationStateFromJson(json);

  @override
  String toString() {
    return 'NotificationState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NotificationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationStateToJson(this);
  }
}

abstract class _NotificationState implements NotificationState {
  factory _NotificationState() = _$_NotificationState;

  factory _NotificationState.fromJson(Map<String, dynamic> json) =
      _$_NotificationState.fromJson;
}
