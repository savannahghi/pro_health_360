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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChannelMembersState _$ChannelMembersStateFromJson(Map<String, dynamic> json) {
  return _ChannelMembersState.fromJson(json);
}

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
abstract class _$$_ChannelMembersStateCopyWith<$Res>
    implements $ChannelMembersStateCopyWith<$Res> {
  factory _$$_ChannelMembersStateCopyWith(_$_ChannelMembersState value,
          $Res Function(_$_ChannelMembersState) then) =
      __$$_ChannelMembersStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Member>? members});
}

/// @nodoc
class __$$_ChannelMembersStateCopyWithImpl<$Res>
    extends _$ChannelMembersStateCopyWithImpl<$Res>
    implements _$$_ChannelMembersStateCopyWith<$Res> {
  __$$_ChannelMembersStateCopyWithImpl(_$_ChannelMembersState _value,
      $Res Function(_$_ChannelMembersState) _then)
      : super(_value, (v) => _then(v as _$_ChannelMembersState));

  @override
  _$_ChannelMembersState get _value => super._value as _$_ChannelMembersState;

  @override
  $Res call({
    Object? members = freezed,
  }) {
    return _then(_$_ChannelMembersState(
      members: members == freezed
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChannelMembersState implements _ChannelMembersState {
  _$_ChannelMembersState({final List<Member>? members}) : _members = members;

  factory _$_ChannelMembersState.fromJson(Map<String, dynamic> json) =>
      _$$_ChannelMembersStateFromJson(json);

  final List<Member>? _members;
  @override
  List<Member>? get members {
    final value = _members;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChannelMembersState(members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChannelMembersState &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  _$$_ChannelMembersStateCopyWith<_$_ChannelMembersState> get copyWith =>
      __$$_ChannelMembersStateCopyWithImpl<_$_ChannelMembersState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChannelMembersStateToJson(this);
  }
}

abstract class _ChannelMembersState implements ChannelMembersState {
  factory _ChannelMembersState({final List<Member>? members}) =
      _$_ChannelMembersState;

  factory _ChannelMembersState.fromJson(Map<String, dynamic> json) =
      _$_ChannelMembersState.fromJson;

  @override
  List<Member>? get members => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChannelMembersStateCopyWith<_$_ChannelMembersState> get copyWith =>
      throw _privateConstructorUsedError;
}
