// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
class _$GroupTearOff {
  const _$GroupTearOff();

  _Group call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'cid') String? messagingID,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'disabled') bool? disabled,
      @JsonKey(name: 'memberCount') int? memberCount,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'updatedAt') String? updatedAt,
      @JsonKey(name: 'gender') List<Gender>? gender,
      @JsonKey(name: 'clientType') List<ClientType>? clientType,
      @JsonKey(name: 'inviteOnly') bool? inviteOnly,
      @JsonKey(name: 'description') String? description}) {
    return _Group(
      id: id,
      messagingID: messagingID,
      name: name,
      disabled: disabled,
      memberCount: memberCount,
      avatar: avatar,
      createdAt: createdAt,
      updatedAt: updatedAt,
      gender: gender,
      clientType: clientType,
      inviteOnly: inviteOnly,
      description: description,
    );
  }

  Group fromJson(Map<String, Object?> json) {
    return Group.fromJson(json);
  }
}

/// @nodoc
const $Group = _$GroupTearOff();

/// @nodoc
mixin _$Group {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cid')
  String? get messagingID => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'disabled')
  bool? get disabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'memberCount')
  int? get memberCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  List<Gender>? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientType')
  List<ClientType>? get clientType => throw _privateConstructorUsedError;
  @JsonKey(name: 'inviteOnly')
  bool? get inviteOnly => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'cid') String? messagingID,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'disabled') bool? disabled,
      @JsonKey(name: 'memberCount') int? memberCount,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'updatedAt') String? updatedAt,
      @JsonKey(name: 'gender') List<Gender>? gender,
      @JsonKey(name: 'clientType') List<ClientType>? clientType,
      @JsonKey(name: 'inviteOnly') bool? inviteOnly,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res> implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  final Group _value;
  // ignore: unused_field
  final $Res Function(Group) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? messagingID = freezed,
    Object? name = freezed,
    Object? disabled = freezed,
    Object? memberCount = freezed,
    Object? avatar = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? gender = freezed,
    Object? clientType = freezed,
    Object? inviteOnly = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      messagingID: messagingID == freezed
          ? _value.messagingID
          : messagingID // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: disabled == freezed
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      memberCount: memberCount == freezed
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<Gender>?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      inviteOnly: inviteOnly == freezed
          ? _value.inviteOnly
          : inviteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$GroupCopyWith(_Group value, $Res Function(_Group) then) =
      __$GroupCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'cid') String? messagingID,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'disabled') bool? disabled,
      @JsonKey(name: 'memberCount') int? memberCount,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'updatedAt') String? updatedAt,
      @JsonKey(name: 'gender') List<Gender>? gender,
      @JsonKey(name: 'clientType') List<ClientType>? clientType,
      @JsonKey(name: 'inviteOnly') bool? inviteOnly,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$GroupCopyWithImpl<$Res> extends _$GroupCopyWithImpl<$Res>
    implements _$GroupCopyWith<$Res> {
  __$GroupCopyWithImpl(_Group _value, $Res Function(_Group) _then)
      : super(_value, (v) => _then(v as _Group));

  @override
  _Group get _value => super._value as _Group;

  @override
  $Res call({
    Object? id = freezed,
    Object? messagingID = freezed,
    Object? name = freezed,
    Object? disabled = freezed,
    Object? memberCount = freezed,
    Object? avatar = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? gender = freezed,
    Object? clientType = freezed,
    Object? inviteOnly = freezed,
    Object? description = freezed,
  }) {
    return _then(_Group(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      messagingID: messagingID == freezed
          ? _value.messagingID
          : messagingID // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: disabled == freezed
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      memberCount: memberCount == freezed
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<Gender>?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      inviteOnly: inviteOnly == freezed
          ? _value.inviteOnly
          : inviteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Group implements _Group {
  _$_Group(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'cid') this.messagingID,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'disabled') this.disabled,
      @JsonKey(name: 'memberCount') this.memberCount,
      @JsonKey(name: 'avatar') this.avatar,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'clientType') this.clientType,
      @JsonKey(name: 'inviteOnly') this.inviteOnly,
      @JsonKey(name: 'description') this.description});

  factory _$_Group.fromJson(Map<String, dynamic> json) =>
      _$$_GroupFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'cid')
  final String? messagingID;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'disabled')
  final bool? disabled;
  @override
  @JsonKey(name: 'memberCount')
  final int? memberCount;
  @override
  @JsonKey(name: 'avatar')
  final String? avatar;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @override
  @JsonKey(name: 'gender')
  final List<Gender>? gender;
  @override
  @JsonKey(name: 'clientType')
  final List<ClientType>? clientType;
  @override
  @JsonKey(name: 'inviteOnly')
  final bool? inviteOnly;
  @override
  @JsonKey(name: 'description')
  final String? description;

  @override
  String toString() {
    return 'Group(id: $id, messagingID: $messagingID, name: $name, disabled: $disabled, memberCount: $memberCount, avatar: $avatar, createdAt: $createdAt, updatedAt: $updatedAt, gender: $gender, clientType: $clientType, inviteOnly: $inviteOnly, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Group &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.messagingID, messagingID) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.disabled, disabled) &&
            const DeepCollectionEquality()
                .equals(other.memberCount, memberCount) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.clientType, clientType) &&
            const DeepCollectionEquality()
                .equals(other.inviteOnly, inviteOnly) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(messagingID),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(disabled),
      const DeepCollectionEquality().hash(memberCount),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(clientType),
      const DeepCollectionEquality().hash(inviteOnly),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$GroupCopyWith<_Group> get copyWith =>
      __$GroupCopyWithImpl<_Group>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupToJson(this);
  }
}

abstract class _Group implements Group {
  factory _Group(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'cid') String? messagingID,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'disabled') bool? disabled,
      @JsonKey(name: 'memberCount') int? memberCount,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'updatedAt') String? updatedAt,
      @JsonKey(name: 'gender') List<Gender>? gender,
      @JsonKey(name: 'clientType') List<ClientType>? clientType,
      @JsonKey(name: 'inviteOnly') bool? inviteOnly,
      @JsonKey(name: 'description') String? description}) = _$_Group;

  factory _Group.fromJson(Map<String, dynamic> json) = _$_Group.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'cid')
  String? get messagingID;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'disabled')
  bool? get disabled;
  @override
  @JsonKey(name: 'memberCount')
  int? get memberCount;
  @override
  @JsonKey(name: 'avatar')
  String? get avatar;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  String? get updatedAt;
  @override
  @JsonKey(name: 'gender')
  List<Gender>? get gender;
  @override
  @JsonKey(name: 'clientType')
  List<ClientType>? get clientType;
  @override
  @JsonKey(name: 'inviteOnly')
  bool? get inviteOnly;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$GroupCopyWith<_Group> get copyWith => throw _privateConstructorUsedError;
}
