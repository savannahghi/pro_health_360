// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'confidential_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConfidentialState _$ConfidentialStateFromJson(Map<String, dynamic> json) {
  return _ConfidentialState.fromJson(json);
}

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
abstract class _$$_ConfidentialStateCopyWith<$Res> {
  factory _$$_ConfidentialStateCopyWith(_$_ConfidentialState value,
          $Res Function(_$_ConfidentialState) then) =
      __$$_ConfidentialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConfidentialStateCopyWithImpl<$Res>
    extends _$ConfidentialStateCopyWithImpl<$Res>
    implements _$$_ConfidentialStateCopyWith<$Res> {
  __$$_ConfidentialStateCopyWithImpl(
      _$_ConfidentialState _value, $Res Function(_$_ConfidentialState) _then)
      : super(_value, (v) => _then(v as _$_ConfidentialState));

  @override
  _$_ConfidentialState get _value => super._value as _$_ConfidentialState;
}

/// @nodoc
@JsonSerializable()
class _$_ConfidentialState implements _ConfidentialState {
  _$_ConfidentialState();

  factory _$_ConfidentialState.fromJson(Map<String, dynamic> json) =>
      _$$_ConfidentialStateFromJson(json);

  @override
  String toString() {
    return 'ConfidentialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ConfidentialState);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfidentialStateToJson(this);
  }
}

abstract class _ConfidentialState implements ConfidentialState {
  factory _ConfidentialState() = _$_ConfidentialState;

  factory _ConfidentialState.fromJson(Map<String, dynamic> json) =
      _$_ConfidentialState.fromJson;
}
