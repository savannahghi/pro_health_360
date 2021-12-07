// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentState _$ContentStateFromJson(Map<String, dynamic> json) {
  return _ContentState.fromJson(json);
}

/// @nodoc
class _$ContentStateTearOff {
  const _$ContentStateTearOff();

  _ContentState call(
      {FeedContentState? feedContentState,
      SavedContentState? savedContentState}) {
    return _ContentState(
      feedContentState: feedContentState,
      savedContentState: savedContentState,
    );
  }

  ContentState fromJson(Map<String, Object> json) {
    return ContentState.fromJson(json);
  }
}

/// @nodoc
const $ContentState = _$ContentStateTearOff();

/// @nodoc
mixin _$ContentState {
  FeedContentState? get feedContentState => throw _privateConstructorUsedError;
  SavedContentState? get savedContentState =>
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
      SavedContentState? savedContentState});

  $FeedContentStateCopyWith<$Res>? get feedContentState;
  $SavedContentStateCopyWith<$Res>? get savedContentState;
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
}

/// @nodoc
abstract class _$ContentStateCopyWith<$Res>
    implements $ContentStateCopyWith<$Res> {
  factory _$ContentStateCopyWith(
          _ContentState value, $Res Function(_ContentState) then) =
      __$ContentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FeedContentState? feedContentState,
      SavedContentState? savedContentState});

  @override
  $FeedContentStateCopyWith<$Res>? get feedContentState;
  @override
  $SavedContentStateCopyWith<$Res>? get savedContentState;
}

/// @nodoc
class __$ContentStateCopyWithImpl<$Res> extends _$ContentStateCopyWithImpl<$Res>
    implements _$ContentStateCopyWith<$Res> {
  __$ContentStateCopyWithImpl(
      _ContentState _value, $Res Function(_ContentState) _then)
      : super(_value, (v) => _then(v as _ContentState));

  @override
  _ContentState get _value => super._value as _ContentState;

  @override
  $Res call({
    Object? feedContentState = freezed,
    Object? savedContentState = freezed,
  }) {
    return _then(_ContentState(
      feedContentState: feedContentState == freezed
          ? _value.feedContentState
          : feedContentState // ignore: cast_nullable_to_non_nullable
              as FeedContentState?,
      savedContentState: savedContentState == freezed
          ? _value.savedContentState
          : savedContentState // ignore: cast_nullable_to_non_nullable
              as SavedContentState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentState implements _ContentState {
  _$_ContentState({this.feedContentState, this.savedContentState});

  factory _$_ContentState.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentStateFromJson(json);

  @override
  final FeedContentState? feedContentState;
  @override
  final SavedContentState? savedContentState;

  @override
  String toString() {
    return 'ContentState(feedContentState: $feedContentState, savedContentState: $savedContentState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContentState &&
            (identical(other.feedContentState, feedContentState) ||
                const DeepCollectionEquality()
                    .equals(other.feedContentState, feedContentState)) &&
            (identical(other.savedContentState, savedContentState) ||
                const DeepCollectionEquality()
                    .equals(other.savedContentState, savedContentState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(feedContentState) ^
      const DeepCollectionEquality().hash(savedContentState);

  @JsonKey(ignore: true)
  @override
  _$ContentStateCopyWith<_ContentState> get copyWith =>
      __$ContentStateCopyWithImpl<_ContentState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContentStateToJson(this);
  }
}

abstract class _ContentState implements ContentState {
  factory _ContentState(
      {FeedContentState? feedContentState,
      SavedContentState? savedContentState}) = _$_ContentState;

  factory _ContentState.fromJson(Map<String, dynamic> json) =
      _$_ContentState.fromJson;

  @override
  FeedContentState? get feedContentState => throw _privateConstructorUsedError;
  @override
  SavedContentState? get savedContentState =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentStateCopyWith<_ContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
