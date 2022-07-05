// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pending_invites_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PendingInvitesResponse _$PendingInvitesResponseFromJson(
    Map<String, dynamic> json) {
  return _PendingInvites.fromJson(json);
}

/// @nodoc
mixin _$PendingInvitesResponse {
  @JsonKey(name: 'listPendingInvites')
  List<Community>? get communities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingInvitesResponseCopyWith<PendingInvitesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingInvitesResponseCopyWith<$Res> {
  factory $PendingInvitesResponseCopyWith(PendingInvitesResponse value,
          $Res Function(PendingInvitesResponse) then) =
      _$PendingInvitesResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'listPendingInvites') List<Community>? communities});
}

/// @nodoc
class _$PendingInvitesResponseCopyWithImpl<$Res>
    implements $PendingInvitesResponseCopyWith<$Res> {
  _$PendingInvitesResponseCopyWithImpl(this._value, this._then);

  final PendingInvitesResponse _value;
  // ignore: unused_field
  final $Res Function(PendingInvitesResponse) _then;

  @override
  $Res call({
    Object? communities = freezed,
  }) {
    return _then(_value.copyWith(
      communities: communities == freezed
          ? _value.communities
          : communities // ignore: cast_nullable_to_non_nullable
              as List<Community>?,
    ));
  }
}

/// @nodoc
abstract class _$$_PendingInvitesCopyWith<$Res>
    implements $PendingInvitesResponseCopyWith<$Res> {
  factory _$$_PendingInvitesCopyWith(
          _$_PendingInvites value, $Res Function(_$_PendingInvites) then) =
      __$$_PendingInvitesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'listPendingInvites') List<Community>? communities});
}

/// @nodoc
class __$$_PendingInvitesCopyWithImpl<$Res>
    extends _$PendingInvitesResponseCopyWithImpl<$Res>
    implements _$$_PendingInvitesCopyWith<$Res> {
  __$$_PendingInvitesCopyWithImpl(
      _$_PendingInvites _value, $Res Function(_$_PendingInvites) _then)
      : super(_value, (v) => _then(v as _$_PendingInvites));

  @override
  _$_PendingInvites get _value => super._value as _$_PendingInvites;

  @override
  $Res call({
    Object? communities = freezed,
  }) {
    return _then(_$_PendingInvites(
      communities: communities == freezed
          ? _value._communities
          : communities // ignore: cast_nullable_to_non_nullable
              as List<Community>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PendingInvites implements _PendingInvites {
  _$_PendingInvites(
      {@JsonKey(name: 'listPendingInvites') final List<Community>? communities})
      : _communities = communities;

  factory _$_PendingInvites.fromJson(Map<String, dynamic> json) =>
      _$$_PendingInvitesFromJson(json);

  final List<Community>? _communities;
  @override
  @JsonKey(name: 'listPendingInvites')
  List<Community>? get communities {
    final value = _communities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PendingInvitesResponse(communities: $communities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PendingInvites &&
            const DeepCollectionEquality()
                .equals(other._communities, _communities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_communities));

  @JsonKey(ignore: true)
  @override
  _$$_PendingInvitesCopyWith<_$_PendingInvites> get copyWith =>
      __$$_PendingInvitesCopyWithImpl<_$_PendingInvites>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PendingInvitesToJson(this);
  }
}

abstract class _PendingInvites implements PendingInvitesResponse {
  factory _PendingInvites(
      {@JsonKey(name: 'listPendingInvites')
          final List<Community>? communities}) = _$_PendingInvites;

  factory _PendingInvites.fromJson(Map<String, dynamic> json) =
      _$_PendingInvites.fromJson;

  @override
  @JsonKey(name: 'listPendingInvites')
  List<Community>? get communities => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PendingInvitesCopyWith<_$_PendingInvites> get copyWith =>
      throw _privateConstructorUsedError;
}
