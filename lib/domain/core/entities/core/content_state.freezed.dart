// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentState _$ContentStateFromJson(Map<String, dynamic> json) {
  return _ContentState.fromJson(json);
}

/// @nodoc
mixin _$ContentState {
  FeedContentState? get feedContentState => throw _privateConstructorUsedError;
  SavedContentState? get savedContentState =>
      throw _privateConstructorUsedError;
  RecentContentState? get recentContentState =>
      throw _privateConstructorUsedError;
  ListContentCategory? get categoriesList => throw _privateConstructorUsedError;
  ContentEngagementState? get contentEngagementState =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentStateCopyWith<ContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentStateCopyWith<$Res> {
  factory $ContentStateCopyWith(
          ContentState value, $Res Function(ContentState) then) =
      _$ContentStateCopyWithImpl<$Res>;
  $Res call(
      {FeedContentState? feedContentState,
      SavedContentState? savedContentState,
      RecentContentState? recentContentState,
      ListContentCategory? categoriesList,
      ContentEngagementState? contentEngagementState});

  $FeedContentStateCopyWith<$Res>? get feedContentState;
  $SavedContentStateCopyWith<$Res>? get savedContentState;
  $RecentContentStateCopyWith<$Res>? get recentContentState;
  $ListContentCategoryCopyWith<$Res>? get categoriesList;
  $ContentEngagementStateCopyWith<$Res>? get contentEngagementState;
}

/// @nodoc
class _$ContentStateCopyWithImpl<$Res> implements $ContentStateCopyWith<$Res> {
  _$ContentStateCopyWithImpl(this._value, this._then);

  final ContentState _value;
  // ignore: unused_field
  final $Res Function(ContentState) _then;

  @override
  $Res call({
    Object? feedContentState = freezed,
    Object? savedContentState = freezed,
    Object? recentContentState = freezed,
    Object? categoriesList = freezed,
    Object? contentEngagementState = freezed,
  }) {
    return _then(_value.copyWith(
      feedContentState: feedContentState == freezed
          ? _value.feedContentState
          : feedContentState // ignore: cast_nullable_to_non_nullable
              as FeedContentState?,
      savedContentState: savedContentState == freezed
          ? _value.savedContentState
          : savedContentState // ignore: cast_nullable_to_non_nullable
              as SavedContentState?,
      recentContentState: recentContentState == freezed
          ? _value.recentContentState
          : recentContentState // ignore: cast_nullable_to_non_nullable
              as RecentContentState?,
      categoriesList: categoriesList == freezed
          ? _value.categoriesList
          : categoriesList // ignore: cast_nullable_to_non_nullable
              as ListContentCategory?,
      contentEngagementState: contentEngagementState == freezed
          ? _value.contentEngagementState
          : contentEngagementState // ignore: cast_nullable_to_non_nullable
              as ContentEngagementState?,
    ));
  }

  @override
  $FeedContentStateCopyWith<$Res>? get feedContentState {
    if (_value.feedContentState == null) {
      return null;
    }

    return $FeedContentStateCopyWith<$Res>(_value.feedContentState!, (value) {
      return _then(_value.copyWith(feedContentState: value));
    });
  }

  @override
  $SavedContentStateCopyWith<$Res>? get savedContentState {
    if (_value.savedContentState == null) {
      return null;
    }

    return $SavedContentStateCopyWith<$Res>(_value.savedContentState!, (value) {
      return _then(_value.copyWith(savedContentState: value));
    });
  }

  @override
  $RecentContentStateCopyWith<$Res>? get recentContentState {
    if (_value.recentContentState == null) {
      return null;
    }

    return $RecentContentStateCopyWith<$Res>(_value.recentContentState!,
        (value) {
      return _then(_value.copyWith(recentContentState: value));
    });
  }

  @override
  $ListContentCategoryCopyWith<$Res>? get categoriesList {
    if (_value.categoriesList == null) {
      return null;
    }

    return $ListContentCategoryCopyWith<$Res>(_value.categoriesList!, (value) {
      return _then(_value.copyWith(categoriesList: value));
    });
  }

  @override
  $ContentEngagementStateCopyWith<$Res>? get contentEngagementState {
    if (_value.contentEngagementState == null) {
      return null;
    }

    return $ContentEngagementStateCopyWith<$Res>(_value.contentEngagementState!,
        (value) {
      return _then(_value.copyWith(contentEngagementState: value));
    });
  }
}

/// @nodoc
abstract class _$$_ContentStateCopyWith<$Res>
    implements $ContentStateCopyWith<$Res> {
  factory _$$_ContentStateCopyWith(
          _$_ContentState value, $Res Function(_$_ContentState) then) =
      __$$_ContentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FeedContentState? feedContentState,
      SavedContentState? savedContentState,
      RecentContentState? recentContentState,
      ListContentCategory? categoriesList,
      ContentEngagementState? contentEngagementState});

  @override
  $FeedContentStateCopyWith<$Res>? get feedContentState;
  @override
  $SavedContentStateCopyWith<$Res>? get savedContentState;
  @override
  $RecentContentStateCopyWith<$Res>? get recentContentState;
  @override
  $ListContentCategoryCopyWith<$Res>? get categoriesList;
  @override
  $ContentEngagementStateCopyWith<$Res>? get contentEngagementState;
}

/// @nodoc
class __$$_ContentStateCopyWithImpl<$Res>
    extends _$ContentStateCopyWithImpl<$Res>
    implements _$$_ContentStateCopyWith<$Res> {
  __$$_ContentStateCopyWithImpl(
      _$_ContentState _value, $Res Function(_$_ContentState) _then)
      : super(_value, (v) => _then(v as _$_ContentState));

  @override
  _$_ContentState get _value => super._value as _$_ContentState;

  @override
  $Res call({
    Object? feedContentState = freezed,
    Object? savedContentState = freezed,
    Object? recentContentState = freezed,
    Object? categoriesList = freezed,
    Object? contentEngagementState = freezed,
  }) {
    return _then(_$_ContentState(
      feedContentState: feedContentState == freezed
          ? _value.feedContentState
          : feedContentState // ignore: cast_nullable_to_non_nullable
              as FeedContentState?,
      savedContentState: savedContentState == freezed
          ? _value.savedContentState
          : savedContentState // ignore: cast_nullable_to_non_nullable
              as SavedContentState?,
      recentContentState: recentContentState == freezed
          ? _value.recentContentState
          : recentContentState // ignore: cast_nullable_to_non_nullable
              as RecentContentState?,
      categoriesList: categoriesList == freezed
          ? _value.categoriesList
          : categoriesList // ignore: cast_nullable_to_non_nullable
              as ListContentCategory?,
      contentEngagementState: contentEngagementState == freezed
          ? _value.contentEngagementState
          : contentEngagementState // ignore: cast_nullable_to_non_nullable
              as ContentEngagementState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentState implements _ContentState {
  _$_ContentState(
      {this.feedContentState,
      this.savedContentState,
      this.recentContentState,
      this.categoriesList,
      this.contentEngagementState});

  factory _$_ContentState.fromJson(Map<String, dynamic> json) =>
      _$$_ContentStateFromJson(json);

  @override
  final FeedContentState? feedContentState;
  @override
  final SavedContentState? savedContentState;
  @override
  final RecentContentState? recentContentState;
  @override
  final ListContentCategory? categoriesList;
  @override
  final ContentEngagementState? contentEngagementState;

  @override
  String toString() {
    return 'ContentState(feedContentState: $feedContentState, savedContentState: $savedContentState, recentContentState: $recentContentState, categoriesList: $categoriesList, contentEngagementState: $contentEngagementState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentState &&
            const DeepCollectionEquality()
                .equals(other.feedContentState, feedContentState) &&
            const DeepCollectionEquality()
                .equals(other.savedContentState, savedContentState) &&
            const DeepCollectionEquality()
                .equals(other.recentContentState, recentContentState) &&
            const DeepCollectionEquality()
                .equals(other.categoriesList, categoriesList) &&
            const DeepCollectionEquality()
                .equals(other.contentEngagementState, contentEngagementState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(feedContentState),
      const DeepCollectionEquality().hash(savedContentState),
      const DeepCollectionEquality().hash(recentContentState),
      const DeepCollectionEquality().hash(categoriesList),
      const DeepCollectionEquality().hash(contentEngagementState));

  @JsonKey(ignore: true)
  @override
  _$$_ContentStateCopyWith<_$_ContentState> get copyWith =>
      __$$_ContentStateCopyWithImpl<_$_ContentState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentStateToJson(this);
  }
}

abstract class _ContentState implements ContentState {
  factory _ContentState(
      {final FeedContentState? feedContentState,
      final SavedContentState? savedContentState,
      final RecentContentState? recentContentState,
      final ListContentCategory? categoriesList,
      final ContentEngagementState? contentEngagementState}) = _$_ContentState;

  factory _ContentState.fromJson(Map<String, dynamic> json) =
      _$_ContentState.fromJson;

  @override
  FeedContentState? get feedContentState => throw _privateConstructorUsedError;
  @override
  SavedContentState? get savedContentState =>
      throw _privateConstructorUsedError;
  @override
  RecentContentState? get recentContentState =>
      throw _privateConstructorUsedError;
  @override
  ListContentCategory? get categoriesList => throw _privateConstructorUsedError;
  @override
  ContentEngagementState? get contentEngagementState =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ContentStateCopyWith<_$_ContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
