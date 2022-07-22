// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_engagement_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentEngagementState _$ContentEngagementStateFromJson(
    Map<String, dynamic> json) {
  return _ContentEngagementState.fromJson(json);
}

/// @nodoc
mixin _$ContentEngagementState {
  @JsonKey(name: 'contentId')
  int? get contentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contentOpenedAt')
  String? get contentOpenedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentEngagementStateCopyWith<ContentEngagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentEngagementStateCopyWith<$Res> {
  factory $ContentEngagementStateCopyWith(ContentEngagementState value,
          $Res Function(ContentEngagementState) then) =
      _$ContentEngagementStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'contentId') int? contentId,
      @JsonKey(name: 'contentOpenedAt') String? contentOpenedAt});
}

/// @nodoc
class _$ContentEngagementStateCopyWithImpl<$Res>
    implements $ContentEngagementStateCopyWith<$Res> {
  _$ContentEngagementStateCopyWithImpl(this._value, this._then);

  final ContentEngagementState _value;
  // ignore: unused_field
  final $Res Function(ContentEngagementState) _then;

  @override
  $Res call({
    Object? contentId = freezed,
    Object? contentOpenedAt = freezed,
  }) {
    return _then(_value.copyWith(
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int?,
      contentOpenedAt: contentOpenedAt == freezed
          ? _value.contentOpenedAt
          : contentOpenedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ContentEngagementStateCopyWith<$Res>
    implements $ContentEngagementStateCopyWith<$Res> {
  factory _$$_ContentEngagementStateCopyWith(_$_ContentEngagementState value,
          $Res Function(_$_ContentEngagementState) then) =
      __$$_ContentEngagementStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'contentId') int? contentId,
      @JsonKey(name: 'contentOpenedAt') String? contentOpenedAt});
}

/// @nodoc
class __$$_ContentEngagementStateCopyWithImpl<$Res>
    extends _$ContentEngagementStateCopyWithImpl<$Res>
    implements _$$_ContentEngagementStateCopyWith<$Res> {
  __$$_ContentEngagementStateCopyWithImpl(_$_ContentEngagementState _value,
      $Res Function(_$_ContentEngagementState) _then)
      : super(_value, (v) => _then(v as _$_ContentEngagementState));

  @override
  _$_ContentEngagementState get _value =>
      super._value as _$_ContentEngagementState;

  @override
  $Res call({
    Object? contentId = freezed,
    Object? contentOpenedAt = freezed,
  }) {
    return _then(_$_ContentEngagementState(
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int?,
      contentOpenedAt: contentOpenedAt == freezed
          ? _value.contentOpenedAt
          : contentOpenedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentEngagementState implements _ContentEngagementState {
  _$_ContentEngagementState(
      {@JsonKey(name: 'contentId') this.contentId,
      @JsonKey(name: 'contentOpenedAt') this.contentOpenedAt});

  factory _$_ContentEngagementState.fromJson(Map<String, dynamic> json) =>
      _$$_ContentEngagementStateFromJson(json);

  @override
  @JsonKey(name: 'contentId')
  final int? contentId;
  @override
  @JsonKey(name: 'contentOpenedAt')
  final String? contentOpenedAt;

  @override
  String toString() {
    return 'ContentEngagementState(contentId: $contentId, contentOpenedAt: $contentOpenedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentEngagementState &&
            const DeepCollectionEquality().equals(other.contentId, contentId) &&
            const DeepCollectionEquality()
                .equals(other.contentOpenedAt, contentOpenedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(contentId),
      const DeepCollectionEquality().hash(contentOpenedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ContentEngagementStateCopyWith<_$_ContentEngagementState> get copyWith =>
      __$$_ContentEngagementStateCopyWithImpl<_$_ContentEngagementState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentEngagementStateToJson(this);
  }
}

abstract class _ContentEngagementState implements ContentEngagementState {
  factory _ContentEngagementState(
          {@JsonKey(name: 'contentId') final int? contentId,
          @JsonKey(name: 'contentOpenedAt') final String? contentOpenedAt}) =
      _$_ContentEngagementState;

  factory _ContentEngagementState.fromJson(Map<String, dynamic> json) =
      _$_ContentEngagementState.fromJson;

  @override
  @JsonKey(name: 'contentId')
  int? get contentId;
  @override
  @JsonKey(name: 'contentOpenedAt')
  String? get contentOpenedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ContentEngagementStateCopyWith<_$_ContentEngagementState> get copyWith =>
      throw _privateConstructorUsedError;
}
