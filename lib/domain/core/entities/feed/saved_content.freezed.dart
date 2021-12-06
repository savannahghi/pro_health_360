// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'saved_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedContent _$SavedContentFromJson(Map<String, dynamic> json) {
  return _SavedContent.fromJson(json);
}

/// @nodoc
class _$SavedContentTearOff {
  const _$SavedContentTearOff();

  _SavedContent call(
      {@JsonKey(name: 'getUserBookmarkedContent') FeedItems? savedContent}) {
    return _SavedContent(
      savedContent: savedContent,
    );
  }

  SavedContent fromJson(Map<String, Object> json) {
    return SavedContent.fromJson(json);
  }
}

/// @nodoc
const $SavedContent = _$SavedContentTearOff();

/// @nodoc
mixin _$SavedContent {
  @JsonKey(name: 'getUserBookmarkedContent')
  FeedItems? get savedContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedContentCopyWith<SavedContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedContentCopyWith<$Res> {
  factory $SavedContentCopyWith(
          SavedContent value, $Res Function(SavedContent) then) =
      _$SavedContentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getUserBookmarkedContent') FeedItems? savedContent});

  $FeedItemsCopyWith<$Res>? get savedContent;
}

/// @nodoc
class _$SavedContentCopyWithImpl<$Res> implements $SavedContentCopyWith<$Res> {
  _$SavedContentCopyWithImpl(this._value, this._then);

  final SavedContent _value;
  // ignore: unused_field
  final $Res Function(SavedContent) _then;

  @override
  $Res call({
    Object? savedContent = freezed,
  }) {
    return _then(_value.copyWith(
      savedContent: savedContent == freezed
          ? _value.savedContent
          : savedContent // ignore: cast_nullable_to_non_nullable
              as FeedItems?,
    ));
  }

  @override
  $FeedItemsCopyWith<$Res>? get savedContent {
    if (_value.savedContent == null) {
      return null;
    }

    return $FeedItemsCopyWith<$Res>(_value.savedContent!, (value) {
      return _then(_value.copyWith(savedContent: value));
    });
  }
}

/// @nodoc
abstract class _$SavedContentCopyWith<$Res>
    implements $SavedContentCopyWith<$Res> {
  factory _$SavedContentCopyWith(
          _SavedContent value, $Res Function(_SavedContent) then) =
      __$SavedContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getUserBookmarkedContent') FeedItems? savedContent});

  @override
  $FeedItemsCopyWith<$Res>? get savedContent;
}

/// @nodoc
class __$SavedContentCopyWithImpl<$Res> extends _$SavedContentCopyWithImpl<$Res>
    implements _$SavedContentCopyWith<$Res> {
  __$SavedContentCopyWithImpl(
      _SavedContent _value, $Res Function(_SavedContent) _then)
      : super(_value, (v) => _then(v as _SavedContent));

  @override
  _SavedContent get _value => super._value as _SavedContent;

  @override
  $Res call({
    Object? savedContent = freezed,
  }) {
    return _then(_SavedContent(
      savedContent: savedContent == freezed
          ? _value.savedContent
          : savedContent // ignore: cast_nullable_to_non_nullable
              as FeedItems?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavedContent implements _SavedContent {
  _$_SavedContent(
      {@JsonKey(name: 'getUserBookmarkedContent') this.savedContent});

  factory _$_SavedContent.fromJson(Map<String, dynamic> json) =>
      _$_$_SavedContentFromJson(json);

  @override
  @JsonKey(name: 'getUserBookmarkedContent')
  final FeedItems? savedContent;

  @override
  String toString() {
    return 'SavedContent(savedContent: $savedContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SavedContent &&
            (identical(other.savedContent, savedContent) ||
                const DeepCollectionEquality()
                    .equals(other.savedContent, savedContent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(savedContent);

  @JsonKey(ignore: true)
  @override
  _$SavedContentCopyWith<_SavedContent> get copyWith =>
      __$SavedContentCopyWithImpl<_SavedContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SavedContentToJson(this);
  }
}

abstract class _SavedContent implements SavedContent {
  factory _SavedContent(
      {@JsonKey(name: 'getUserBookmarkedContent')
          FeedItems? savedContent}) = _$_SavedContent;

  factory _SavedContent.fromJson(Map<String, dynamic> json) =
      _$_SavedContent.fromJson;

  @override
  @JsonKey(name: 'getUserBookmarkedContent')
  FeedItems? get savedContent => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SavedContentCopyWith<_SavedContent> get copyWith =>
      throw _privateConstructorUsedError;
}
