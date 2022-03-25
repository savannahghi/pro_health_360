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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PendingInvitesResponse _$PendingInvitesResponseFromJson(
    Map<String, dynamic> json) {
  return _PendingInvites.fromJson(json);
}

/// @nodoc
class _$PendingInvitesResponseTearOff {
  const _$PendingInvitesResponseTearOff();

  _PendingInvites call({List<Community>? communities}) {
    return _PendingInvites(
      communities: communities,
    );
  }

  PendingInvitesResponse fromJson(Map<String, Object?> json) {
    return PendingInvitesResponse.fromJson(json);
  }
}

/// @nodoc
const $PendingInvitesResponse = _$PendingInvitesResponseTearOff();

/// @nodoc
mixin _$PendingInvitesResponse {
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
  $Res call({List<Community>? communities});
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
abstract class _$PendingInvitesCopyWith<$Res>
    implements $PendingInvitesResponseCopyWith<$Res> {
  factory _$PendingInvitesCopyWith(
          _PendingInvites value, $Res Function(_PendingInvites) then) =
      __$PendingInvitesCopyWithImpl<$Res>;
  @override
  $Res call({List<Community>? communities});
}

/// @nodoc
class __$PendingInvitesCopyWithImpl<$Res>
    extends _$PendingInvitesResponseCopyWithImpl<$Res>
    implements _$PendingInvitesCopyWith<$Res> {
  __$PendingInvitesCopyWithImpl(
      _PendingInvites _value, $Res Function(_PendingInvites) _then)
      : super(_value, (v) => _then(v as _PendingInvites));

  @override
  _PendingInvites get _value => super._value as _PendingInvites;

  @override
  $Res call({
    Object? communities = freezed,
  }) {
    return _then(_PendingInvites(
      communities: communities == freezed
          ? _value.communities
          : communities // ignore: cast_nullable_to_non_nullable
              as List<Community>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PendingInvites implements _PendingInvites {
  _$_PendingInvites({this.communities});

  factory _$_PendingInvites.fromJson(Map<String, dynamic> json) =>
      _$$_PendingInvitesFromJson(json);

  @override
  final List<Community>? communities;

  @override
  String toString() {
    return 'PendingInvitesResponse(communities: $communities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PendingInvites &&
            const DeepCollectionEquality()
                .equals(other.communities, communities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(communities));

  @JsonKey(ignore: true)
  @override
  _$PendingInvitesCopyWith<_PendingInvites> get copyWith =>
      __$PendingInvitesCopyWithImpl<_PendingInvites>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PendingInvitesToJson(this);
  }
}

abstract class _PendingInvites implements PendingInvitesResponse {
  factory _PendingInvites({List<Community>? communities}) = _$_PendingInvites;

  factory _PendingInvites.fromJson(Map<String, dynamic> json) =
      _$_PendingInvites.fromJson;

  @override
  List<Community>? get communities;
  @override
  @JsonKey(ignore: true)
  _$PendingInvitesCopyWith<_PendingInvites> get copyWith =>
      throw _privateConstructorUsedError;
}
