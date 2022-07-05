// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedState _$FeedStateFromJson(Map<String, dynamic> json) {
  return _FeedState.fromJson(json);
}

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
abstract class _$$_FeedStateCopyWith<$Res> {
  factory _$$_FeedStateCopyWith(
          _$_FeedState value, $Res Function(_$_FeedState) then) =
      __$$_FeedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FeedStateCopyWithImpl<$Res> extends _$FeedStateCopyWithImpl<$Res>
    implements _$$_FeedStateCopyWith<$Res> {
  __$$_FeedStateCopyWithImpl(
      _$_FeedState _value, $Res Function(_$_FeedState) _then)
      : super(_value, (v) => _then(v as _$_FeedState));

  @override
  _$_FeedState get _value => super._value as _$_FeedState;
}

/// @nodoc
@JsonSerializable()
class _$_FeedState implements _FeedState {
  _$_FeedState();

  factory _$_FeedState.fromJson(Map<String, dynamic> json) =>
      _$$_FeedStateFromJson(json);

  @override
  String toString() {
    return 'FeedState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FeedState);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedStateToJson(this);
  }
}

abstract class _FeedState implements FeedState {
  factory _FeedState() = _$_FeedState;

  factory _FeedState.fromJson(Map<String, dynamic> json) =
      _$_FeedState.fromJson;
}
