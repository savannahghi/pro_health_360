// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'recent_content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentContentState _$RecentContentStateFromJson(Map<String, dynamic> json) {
  return _FeedContentState.fromJson(json);
}

/// @nodoc
class _$RecentContentStateTearOff {
  const _$RecentContentStateTearOff();

  _FeedContentState call(
      {@JsonKey(name: 'items') List<Content?>? contentItems,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) {
    return _FeedContentState(
      contentItems: contentItems,
      errorFetchingContent: errorFetchingContent,
      timeoutFetchingContent: timeoutFetchingContent,
    );
  }

  RecentContentState fromJson(Map<String, Object> json) {
    return RecentContentState.fromJson(json);
  }
}

/// @nodoc
const $RecentContentState = _$RecentContentStateTearOff();

/// @nodoc
mixin _$RecentContentState {
  @JsonKey(name: 'items')
  List<Content?>? get contentItems => throw _privateConstructorUsedError;
  bool? get errorFetchingContent => throw _privateConstructorUsedError;
  bool? get timeoutFetchingContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentContentStateCopyWith<RecentContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentContentStateCopyWith<$Res> {
  factory $RecentContentStateCopyWith(
          RecentContentState value, $Res Function(RecentContentState) then) =
      _$RecentContentStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'items') List<Content?>? contentItems,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});
}

/// @nodoc
class _$RecentContentStateCopyWithImpl<$Res>
    implements $RecentContentStateCopyWith<$Res> {
  _$RecentContentStateCopyWithImpl(this._value, this._then);

  final RecentContentState _value;
  // ignore: unused_field
  final $Res Function(RecentContentState) _then;

  @override
  $Res call({
    Object? contentItems = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_value.copyWith(
      contentItems: contentItems == freezed
          ? _value.contentItems
          : contentItems // ignore: cast_nullable_to_non_nullable
              as List<Content?>?,
      errorFetchingContent: errorFetchingContent == freezed
          ? _value.errorFetchingContent
          : errorFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingContent: timeoutFetchingContent == freezed
          ? _value.timeoutFetchingContent
          : timeoutFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$FeedContentStateCopyWith<$Res>
    implements $RecentContentStateCopyWith<$Res> {
  factory _$FeedContentStateCopyWith(
          _FeedContentState value, $Res Function(_FeedContentState) then) =
      __$FeedContentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'items') List<Content?>? contentItems,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});
}

/// @nodoc
class __$FeedContentStateCopyWithImpl<$Res>
    extends _$RecentContentStateCopyWithImpl<$Res>
    implements _$FeedContentStateCopyWith<$Res> {
  __$FeedContentStateCopyWithImpl(
      _FeedContentState _value, $Res Function(_FeedContentState) _then)
      : super(_value, (v) => _then(v as _FeedContentState));

  @override
  _FeedContentState get _value => super._value as _FeedContentState;

  @override
  $Res call({
    Object? contentItems = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_FeedContentState(
      contentItems: contentItems == freezed
          ? _value.contentItems
          : contentItems // ignore: cast_nullable_to_non_nullable
              as List<Content?>?,
      errorFetchingContent: errorFetchingContent == freezed
          ? _value.errorFetchingContent
          : errorFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingContent: timeoutFetchingContent == freezed
          ? _value.timeoutFetchingContent
          : timeoutFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeedContentState implements _FeedContentState {
  _$_FeedContentState(
      {@JsonKey(name: 'items') this.contentItems,
      this.errorFetchingContent,
      this.timeoutFetchingContent});

  factory _$_FeedContentState.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedContentStateFromJson(json);

  @override
  @JsonKey(name: 'items')
  final List<Content?>? contentItems;
  @override
  final bool? errorFetchingContent;
  @override
  final bool? timeoutFetchingContent;

  @override
  String toString() {
    return 'RecentContentState(contentItems: $contentItems, errorFetchingContent: $errorFetchingContent, timeoutFetchingContent: $timeoutFetchingContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FeedContentState &&
            (identical(other.contentItems, contentItems) ||
                const DeepCollectionEquality()
                    .equals(other.contentItems, contentItems)) &&
            (identical(other.errorFetchingContent, errorFetchingContent) ||
                const DeepCollectionEquality().equals(
                    other.errorFetchingContent, errorFetchingContent)) &&
            (identical(other.timeoutFetchingContent, timeoutFetchingContent) ||
                const DeepCollectionEquality().equals(
                    other.timeoutFetchingContent, timeoutFetchingContent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contentItems) ^
      const DeepCollectionEquality().hash(errorFetchingContent) ^
      const DeepCollectionEquality().hash(timeoutFetchingContent);

  @JsonKey(ignore: true)
  @override
  _$FeedContentStateCopyWith<_FeedContentState> get copyWith =>
      __$FeedContentStateCopyWithImpl<_FeedContentState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedContentStateToJson(this);
  }
}

abstract class _FeedContentState implements RecentContentState {
  factory _FeedContentState(
      {@JsonKey(name: 'items') List<Content?>? contentItems,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) = _$_FeedContentState;

  factory _FeedContentState.fromJson(Map<String, dynamic> json) =
      _$_FeedContentState.fromJson;

  @override
  @JsonKey(name: 'items')
  List<Content?>? get contentItems => throw _privateConstructorUsedError;
  @override
  bool? get errorFetchingContent => throw _privateConstructorUsedError;
  @override
  bool? get timeoutFetchingContent => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FeedContentStateCopyWith<_FeedContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
