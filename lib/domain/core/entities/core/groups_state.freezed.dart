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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupState _$GroupStateFromJson(Map<String, dynamic> json) {
  return _GroupState.fromJson(json);
}

/// @nodoc
mixin _$GroupState {
  @JsonKey(name: 'recommendedCommunities')
  List<Group?>? get recommendedGroups => throw _privateConstructorUsedError;
  @JsonKey(name: 'listCommunityMembers')
  List<GroupMember?>? get groupMembers => throw _privateConstructorUsedError;
  List<Community?>? get communities => throw _privateConstructorUsedError;
  bool? get isModerator => throw _privateConstructorUsedError;
  bool? get isOwner => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'recommendedCommunities') List<Group?>? recommendedGroups,
      @JsonKey(name: 'listCommunityMembers') List<GroupMember?>? groupMembers,
      List<Community?>? communities,
      bool? isModerator,
      bool? isOwner});
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
    Object? groupMembers = freezed,
    Object? communities = freezed,
    Object? isModerator = freezed,
    Object? isOwner = freezed,
  }) {
    return _then(_value.copyWith(
      recommendedGroups: recommendedGroups == freezed
          ? _value.recommendedGroups
          : recommendedGroups // ignore: cast_nullable_to_non_nullable
              as List<Group?>?,
      groupMembers: groupMembers == freezed
          ? _value.groupMembers
          : groupMembers // ignore: cast_nullable_to_non_nullable
              as List<GroupMember?>?,
      communities: communities == freezed
          ? _value.communities
          : communities // ignore: cast_nullable_to_non_nullable
              as List<Community?>?,
      isModerator: isModerator == freezed
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOwner: isOwner == freezed
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_GroupStateCopyWith<$Res>
    implements $GroupStateCopyWith<$Res> {
  factory _$$_GroupStateCopyWith(
          _$_GroupState value, $Res Function(_$_GroupState) then) =
      __$$_GroupStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'recommendedCommunities') List<Group?>? recommendedGroups,
      @JsonKey(name: 'listCommunityMembers') List<GroupMember?>? groupMembers,
      List<Community?>? communities,
      bool? isModerator,
      bool? isOwner});
}

/// @nodoc
class __$$_GroupStateCopyWithImpl<$Res> extends _$GroupStateCopyWithImpl<$Res>
    implements _$$_GroupStateCopyWith<$Res> {
  __$$_GroupStateCopyWithImpl(
      _$_GroupState _value, $Res Function(_$_GroupState) _then)
      : super(_value, (v) => _then(v as _$_GroupState));

  @override
  _$_GroupState get _value => super._value as _$_GroupState;

  @override
  $Res call({
    Object? recommendedGroups = freezed,
    Object? groupMembers = freezed,
    Object? communities = freezed,
    Object? isModerator = freezed,
    Object? isOwner = freezed,
  }) {
    return _then(_$_GroupState(
      recommendedGroups: recommendedGroups == freezed
          ? _value._recommendedGroups
          : recommendedGroups // ignore: cast_nullable_to_non_nullable
              as List<Group?>?,
      groupMembers: groupMembers == freezed
          ? _value._groupMembers
          : groupMembers // ignore: cast_nullable_to_non_nullable
              as List<GroupMember?>?,
      communities: communities == freezed
          ? _value._communities
          : communities // ignore: cast_nullable_to_non_nullable
              as List<Community?>?,
      isModerator: isModerator == freezed
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOwner: isOwner == freezed
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupState implements _GroupState {
  _$_GroupState(
      {@JsonKey(name: 'recommendedCommunities')
          final List<Group?>? recommendedGroups,
      @JsonKey(name: 'listCommunityMembers')
          final List<GroupMember?>? groupMembers,
      final List<Community?>? communities,
      this.isModerator,
      this.isOwner})
      : _recommendedGroups = recommendedGroups,
        _groupMembers = groupMembers,
        _communities = communities;

  factory _$_GroupState.fromJson(Map<String, dynamic> json) =>
      _$$_GroupStateFromJson(json);

  final List<Group?>? _recommendedGroups;
  @override
  @JsonKey(name: 'recommendedCommunities')
  List<Group?>? get recommendedGroups {
    final value = _recommendedGroups;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<GroupMember?>? _groupMembers;
  @override
  @JsonKey(name: 'listCommunityMembers')
  List<GroupMember?>? get groupMembers {
    final value = _groupMembers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Community?>? _communities;
  @override
  List<Community?>? get communities {
    final value = _communities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isModerator;
  @override
  final bool? isOwner;

  @override
  String toString() {
    return 'GroupState(recommendedGroups: $recommendedGroups, groupMembers: $groupMembers, communities: $communities, isModerator: $isModerator, isOwner: $isOwner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroupState &&
            const DeepCollectionEquality()
                .equals(other._recommendedGroups, _recommendedGroups) &&
            const DeepCollectionEquality()
                .equals(other._groupMembers, _groupMembers) &&
            const DeepCollectionEquality()
                .equals(other._communities, _communities) &&
            const DeepCollectionEquality()
                .equals(other.isModerator, isModerator) &&
            const DeepCollectionEquality().equals(other.isOwner, isOwner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recommendedGroups),
      const DeepCollectionEquality().hash(_groupMembers),
      const DeepCollectionEquality().hash(_communities),
      const DeepCollectionEquality().hash(isModerator),
      const DeepCollectionEquality().hash(isOwner));

  @JsonKey(ignore: true)
  @override
  _$$_GroupStateCopyWith<_$_GroupState> get copyWith =>
      __$$_GroupStateCopyWithImpl<_$_GroupState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupStateToJson(this);
  }
}

abstract class _GroupState implements GroupState {
  factory _GroupState(
      {@JsonKey(name: 'recommendedCommunities')
          final List<Group?>? recommendedGroups,
      @JsonKey(name: 'listCommunityMembers')
          final List<GroupMember?>? groupMembers,
      final List<Community?>? communities,
      final bool? isModerator,
      final bool? isOwner}) = _$_GroupState;

  factory _GroupState.fromJson(Map<String, dynamic> json) =
      _$_GroupState.fromJson;

  @override
  @JsonKey(name: 'recommendedCommunities')
  List<Group?>? get recommendedGroups => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'listCommunityMembers')
  List<GroupMember?>? get groupMembers => throw _privateConstructorUsedError;
  @override
  List<Community?>? get communities => throw _privateConstructorUsedError;
  @override
  bool? get isModerator => throw _privateConstructorUsedError;
  @override
  bool? get isOwner => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GroupStateCopyWith<_$_GroupState> get copyWith =>
      throw _privateConstructorUsedError;
}
