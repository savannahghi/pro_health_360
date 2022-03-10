// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'channel_members_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChannelMembersState _$ChannelMembersStateFromJson(Map<String, dynamic> json) {
  return _ChannelMembersState.fromJson(json);
}

/// @nodoc
class _$ChannelMembersStateTearOff {
  const _$ChannelMembersStateTearOff();

  _ChannelMembersState call({List<Member>? members}) {
    return _ChannelMembersState(
      members: members,
    );
  }

  ChannelMembersState fromJson(Map<String, Object?> json) {
    return ChannelMembersState.fromJson(json);
  }
}

/// @nodoc
const $ChannelMembersState = _$ChannelMembersStateTearOff();

/// @nodoc
mixin _$ChannelMembersState {
  List<Member>? get members => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelMembersStateCopyWith<ChannelMembersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelMembersStateCopyWith<$Res> {
  factory $ChannelMembersStateCopyWith(
          ChannelMembersState value, $Res Function(ChannelMembersState) then) =
      _$ChannelMembersStateCopyWithImpl<$Res>;
  $Res call({List<Member>? members});
}

/// @nodoc
class _$ChannelMembersStateCopyWithImpl<$Res>
    implements $ChannelMembersStateCopyWith<$Res> {
  _$ChannelMembersStateCopyWithImpl(this._value, this._then);

  final ChannelMembersState _value;
  // ignore: unused_field
  final $Res Function(ChannelMembersState) _then;

  @override
  $Res call({
    Object? members = freezed,
  }) {
    return _then(_value.copyWith(
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
    ));
  }
}

/// @nodoc
abstract class _$ChannelMembersStateCopyWith<$Res>
    implements $ChannelMembersStateCopyWith<$Res> {
  factory _$ChannelMembersStateCopyWith(_ChannelMembersState value,
          $Res Function(_ChannelMembersState) then) =
      __$ChannelMembersStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Member>? members});
}

/// @nodoc
class __$ChannelMembersStateCopyWithImpl<$Res>
    extends _$ChannelMembersStateCopyWithImpl<$Res>
    implements _$ChannelMembersStateCopyWith<$Res> {
  __$ChannelMembersStateCopyWithImpl(
      _ChannelMembersState _value, $Res Function(_ChannelMembersState) _then)
      : super(_value, (v) => _then(v as _ChannelMembersState));

  @override
  _ChannelMembersState get _value => super._value as _ChannelMembersState;

  @override
  $Res call({
    Object? members = freezed,
  }) {
    return _then(_ChannelMembersState(
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChannelMembersState implements _ChannelMembersState {
  _$_ChannelMembersState({this.members});

  factory _$_ChannelMembersState.fromJson(Map<String, dynamic> json) =>
      _$$_ChannelMembersStateFromJson(json);

  @override
  final List<Member>? members;

  @override
  String toString() {
    return 'ChannelMembersState(members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelMembersState &&
            const DeepCollectionEquality().equals(other.members, members));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(members));

  @JsonKey(ignore: true)
  @override
  _$ChannelMembersStateCopyWith<_ChannelMembersState> get copyWith =>
      __$ChannelMembersStateCopyWithImpl<_ChannelMembersState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChannelMembersStateToJson(this);
  }
}

abstract class _ChannelMembersState implements ChannelMembersState {
  factory _ChannelMembersState({List<Member>? members}) =
      _$_ChannelMembersState;

  factory _ChannelMembersState.fromJson(Map<String, dynamic> json) =
      _$_ChannelMembersState.fromJson;

  @override
  List<Member>? get members;
  @override
  @JsonKey(ignore: true)
  _$ChannelMembersStateCopyWith<_ChannelMembersState> get copyWith =>
      throw _privateConstructorUsedError;
}
