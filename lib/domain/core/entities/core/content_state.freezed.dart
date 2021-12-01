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
      {@JsonKey(name: 'items') List<Content?>? contentItems,
      ContentCategory? selectedCategory,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) {
    return _ContentState(
      contentItems: contentItems,
      selectedCategory: selectedCategory,
      errorFetchingContent: errorFetchingContent,
      timeoutFetchingContent: timeoutFetchingContent,
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
  @JsonKey(name: 'items')
  List<Content?>? get contentItems => throw _privateConstructorUsedError;
  ContentCategory? get selectedCategory => throw _privateConstructorUsedError;
  bool? get errorFetchingContent => throw _privateConstructorUsedError;
  bool? get timeoutFetchingContent => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'items') List<Content?>? contentItems,
      ContentCategory? selectedCategory,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});

  $ContentCategoryCopyWith<$Res>? get selectedCategory;
}

/// @nodoc
class _$ContentStateCopyWithImpl<$Res> implements $ContentStateCopyWith<$Res> {
  _$ContentStateCopyWithImpl(this._value, this._then);

  final ContentState _value;
  // ignore: unused_field
  final $Res Function(ContentState) _then;

  @override
  $Res call({
    Object? contentItems = freezed,
    Object? selectedCategory = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_value.copyWith(
      contentItems: contentItems == freezed
          ? _value.contentItems
          : contentItems // ignore: cast_nullable_to_non_nullable
              as List<Content?>?,
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as ContentCategory?,
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

  @override
  $ContentCategoryCopyWith<$Res>? get selectedCategory {
    if (_value.selectedCategory == null) {
      return null;
    }

    return $ContentCategoryCopyWith<$Res>(_value.selectedCategory!, (value) {
      return _then(_value.copyWith(selectedCategory: value));
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
      {@JsonKey(name: 'items') List<Content?>? contentItems,
      ContentCategory? selectedCategory,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});

  @override
  $ContentCategoryCopyWith<$Res>? get selectedCategory;
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
    Object? contentItems = freezed,
    Object? selectedCategory = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_ContentState(
      contentItems: contentItems == freezed
          ? _value.contentItems
          : contentItems // ignore: cast_nullable_to_non_nullable
              as List<Content?>?,
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as ContentCategory?,
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
class _$_ContentState implements _ContentState {
  _$_ContentState(
      {@JsonKey(name: 'items') this.contentItems,
      this.selectedCategory,
      this.errorFetchingContent,
      this.timeoutFetchingContent});

  factory _$_ContentState.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentStateFromJson(json);

  @override
  @JsonKey(name: 'items')
  final List<Content?>? contentItems;
  @override
  final ContentCategory? selectedCategory;
  @override
  final bool? errorFetchingContent;
  @override
  final bool? timeoutFetchingContent;

  @override
  String toString() {
    return 'ContentState(contentItems: $contentItems, selectedCategory: $selectedCategory, errorFetchingContent: $errorFetchingContent, timeoutFetchingContent: $timeoutFetchingContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContentState &&
            (identical(other.contentItems, contentItems) ||
                const DeepCollectionEquality()
                    .equals(other.contentItems, contentItems)) &&
            (identical(other.selectedCategory, selectedCategory) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCategory, selectedCategory)) &&
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
      const DeepCollectionEquality().hash(selectedCategory) ^
      const DeepCollectionEquality().hash(errorFetchingContent) ^
      const DeepCollectionEquality().hash(timeoutFetchingContent);

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
      {@JsonKey(name: 'items') List<Content?>? contentItems,
      ContentCategory? selectedCategory,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) = _$_ContentState;

  factory _ContentState.fromJson(Map<String, dynamic> json) =
      _$_ContentState.fromJson;

  @override
  @JsonKey(name: 'items')
  List<Content?>? get contentItems => throw _privateConstructorUsedError;
  @override
  ContentCategory? get selectedCategory => throw _privateConstructorUsedError;
  @override
  bool? get errorFetchingContent => throw _privateConstructorUsedError;
  @override
  bool? get timeoutFetchingContent => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentStateCopyWith<_ContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
