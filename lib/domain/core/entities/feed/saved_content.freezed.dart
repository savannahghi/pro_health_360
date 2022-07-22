// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'saved_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedContent _$SavedContentFromJson(Map<String, dynamic> json) {
  return _SavedContent.fromJson(json);
}

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
abstract class _$$_SavedContentCopyWith<$Res>
    implements $SavedContentCopyWith<$Res> {
  factory _$$_SavedContentCopyWith(
          _$_SavedContent value, $Res Function(_$_SavedContent) then) =
      __$$_SavedContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getUserBookmarkedContent') FeedItems? savedContent});

  @override
  $FeedItemsCopyWith<$Res>? get savedContent;
}

/// @nodoc
class __$$_SavedContentCopyWithImpl<$Res>
    extends _$SavedContentCopyWithImpl<$Res>
    implements _$$_SavedContentCopyWith<$Res> {
  __$$_SavedContentCopyWithImpl(
      _$_SavedContent _value, $Res Function(_$_SavedContent) _then)
      : super(_value, (v) => _then(v as _$_SavedContent));

  @override
  _$_SavedContent get _value => super._value as _$_SavedContent;

  @override
  $Res call({
    Object? savedContent = freezed,
  }) {
    return _then(_$_SavedContent(
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
      _$$_SavedContentFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_SavedContent &&
            const DeepCollectionEquality()
                .equals(other.savedContent, savedContent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(savedContent));

  @JsonKey(ignore: true)
  @override
  _$$_SavedContentCopyWith<_$_SavedContent> get copyWith =>
      __$$_SavedContentCopyWithImpl<_$_SavedContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedContentToJson(this);
  }
}

abstract class _SavedContent implements SavedContent {
  factory _SavedContent(
      {@JsonKey(name: 'getUserBookmarkedContent')
          final FeedItems? savedContent}) = _$_SavedContent;

  factory _SavedContent.fromJson(Map<String, dynamic> json) =
      _$_SavedContent.fromJson;

  @override
  @JsonKey(name: 'getUserBookmarkedContent')
  FeedItems? get savedContent;
  @override
  @JsonKey(ignore: true)
  _$$_SavedContentCopyWith<_$_SavedContent> get copyWith =>
      throw _privateConstructorUsedError;
}
