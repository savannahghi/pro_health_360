// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'groups_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupState _$GroupStateFromJson(Map<String, dynamic> json) {
  return _GroupState.fromJson(json);
}

/// @nodoc
class _$GroupStateTearOff {
  const _$GroupStateTearOff();

  _GroupState call(
      {@JsonKey(name: 'recommendedCommunities')
          List<Group?>? recommendedGroups}) {
    return _GroupState(
      recommendedGroups: recommendedGroups,
    );
  }

  GroupState fromJson(Map<String, Object?> json) {
    return GroupState.fromJson(json);
  }
}

/// @nodoc
const $GroupState = _$GroupStateTearOff();

/// @nodoc
mixin _$GroupState {
  @JsonKey(name: 'recommendedCommunities')
  List<Group?>? get recommendedGroups => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupStateCopyWith<GroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupStateCopyWith<$Res> {
  factory $GroupStateCopyWith(
          GroupState value, $Res Function(GroupState) then) =
      _$GroupStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'recommendedCommunities')
          List<Group?>? recommendedGroups});
}

/// @nodoc
class _$GroupStateCopyWithImpl<$Res> implements $GroupStateCopyWith<$Res> {
  _$GroupStateCopyWithImpl(this._value, this._then);

  final GroupState _value;
  // ignore: unused_field
  final $Res Function(GroupState) _then;

  @override
  $Res call({
    Object? recommendedGroups = freezed,
  }) {
    return _then(_value.copyWith(
      recommendedGroups: recommendedGroups == freezed
          ? _value.recommendedGroups
          : recommendedGroups // ignore: cast_nullable_to_non_nullable
              as List<Group?>?,
    ));
  }
}

/// @nodoc
abstract class _$GroupStateCopyWith<$Res> implements $GroupStateCopyWith<$Res> {
  factory _$GroupStateCopyWith(
          _GroupState value, $Res Function(_GroupState) then) =
      __$GroupStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'recommendedCommunities')
          List<Group?>? recommendedGroups});
}

/// @nodoc
class __$GroupStateCopyWithImpl<$Res> extends _$GroupStateCopyWithImpl<$Res>
    implements _$GroupStateCopyWith<$Res> {
  __$GroupStateCopyWithImpl(
      _GroupState _value, $Res Function(_GroupState) _then)
      : super(_value, (v) => _then(v as _GroupState));

  @override
  _GroupState get _value => super._value as _GroupState;

  @override
  $Res call({
    Object? recommendedGroups = freezed,
  }) {
    return _then(_GroupState(
      recommendedGroups: recommendedGroups == freezed
          ? _value.recommendedGroups
          : recommendedGroups // ignore: cast_nullable_to_non_nullable
              as List<Group?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupState implements _GroupState {
  _$_GroupState(
      {@JsonKey(name: 'recommendedCommunities') this.recommendedGroups});

  factory _$_GroupState.fromJson(Map<String, dynamic> json) =>
      _$$_GroupStateFromJson(json);

  @override
  @JsonKey(name: 'recommendedCommunities')
  final List<Group?>? recommendedGroups;

  @override
  String toString() {
    return 'GroupState(recommendedGroups: $recommendedGroups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupState &&
            const DeepCollectionEquality()
                .equals(other.recommendedGroups, recommendedGroups));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(recommendedGroups));

  @JsonKey(ignore: true)
  @override
  _$GroupStateCopyWith<_GroupState> get copyWith =>
      __$GroupStateCopyWithImpl<_GroupState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupStateToJson(this);
  }
}

abstract class _GroupState implements GroupState {
  factory _GroupState(
      {@JsonKey(name: 'recommendedCommunities')
          List<Group?>? recommendedGroups}) = _$_GroupState;

  factory _GroupState.fromJson(Map<String, dynamic> json) =
      _$_GroupState.fromJson;

  @override
  @JsonKey(name: 'recommendedCommunities')
  List<Group?>? get recommendedGroups;
  @override
  @JsonKey(ignore: true)
  _$GroupStateCopyWith<_GroupState> get copyWith =>
      throw _privateConstructorUsedError;
}
