// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'featured_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeaturedMedia _$FeaturedMediaFromJson(Map<String, dynamic> json) {
  return _FeaturedMedia.fromJson(json);
}

/// @nodoc
class _$FeaturedMediaTearOff {
  const _$FeaturedMediaTearOff();

  _FeaturedMedia call(
      {@JsonKey(name: 'ID')
          int? id,
      @JsonKey(name: 'url')
          String? mediaUrl,
      @JsonKey(name: 'title')
          String? title,
      @JsonKey(name: 'type', unknownEnumValue: FeaturedMediaType.UNKNOWN)
          FeaturedMediaType? featuredMediaType,
      @JsonKey(name: 'duration')
          double? duration,
      @JsonKey(name: 'width')
          int? width,
      @JsonKey(name: 'height')
          int? height,
      @JsonKey(name: 'thumbnail')
          String? thumbnail}) {
    return _FeaturedMedia(
      id: id,
      mediaUrl: mediaUrl,
      title: title,
      featuredMediaType: featuredMediaType,
      duration: duration,
      width: width,
      height: height,
      thumbnail: thumbnail,
    );
  }

  FeaturedMedia fromJson(Map<String, Object> json) {
    return FeaturedMedia.fromJson(json);
  }
}

/// @nodoc
const $FeaturedMedia = _$FeaturedMediaTearOff();

/// @nodoc
mixin _$FeaturedMedia {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', unknownEnumValue: FeaturedMediaType.UNKNOWN)
  FeaturedMediaType? get featuredMediaType =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  double? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'width')
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail')
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeaturedMediaCopyWith<FeaturedMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturedMediaCopyWith<$Res> {
  factory $FeaturedMediaCopyWith(
          FeaturedMedia value, $Res Function(FeaturedMedia) then) =
      _$FeaturedMediaCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID')
          int? id,
      @JsonKey(name: 'url')
          String? mediaUrl,
      @JsonKey(name: 'title')
          String? title,
      @JsonKey(name: 'type', unknownEnumValue: FeaturedMediaType.UNKNOWN)
          FeaturedMediaType? featuredMediaType,
      @JsonKey(name: 'duration')
          double? duration,
      @JsonKey(name: 'width')
          int? width,
      @JsonKey(name: 'height')
          int? height,
      @JsonKey(name: 'thumbnail')
          String? thumbnail});
}

/// @nodoc
class _$FeaturedMediaCopyWithImpl<$Res>
    implements $FeaturedMediaCopyWith<$Res> {
  _$FeaturedMediaCopyWithImpl(this._value, this._then);

  final FeaturedMedia _value;
  // ignore: unused_field
  final $Res Function(FeaturedMedia) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? mediaUrl = freezed,
    Object? title = freezed,
    Object? featuredMediaType = freezed,
    Object? duration = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaUrl: mediaUrl == freezed
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      featuredMediaType: featuredMediaType == freezed
          ? _value.featuredMediaType
          : featuredMediaType // ignore: cast_nullable_to_non_nullable
              as FeaturedMediaType?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$FeaturedMediaCopyWith<$Res>
    implements $FeaturedMediaCopyWith<$Res> {
  factory _$FeaturedMediaCopyWith(
          _FeaturedMedia value, $Res Function(_FeaturedMedia) then) =
      __$FeaturedMediaCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID')
          int? id,
      @JsonKey(name: 'url')
          String? mediaUrl,
      @JsonKey(name: 'title')
          String? title,
      @JsonKey(name: 'type', unknownEnumValue: FeaturedMediaType.UNKNOWN)
          FeaturedMediaType? featuredMediaType,
      @JsonKey(name: 'duration')
          double? duration,
      @JsonKey(name: 'width')
          int? width,
      @JsonKey(name: 'height')
          int? height,
      @JsonKey(name: 'thumbnail')
          String? thumbnail});
}

/// @nodoc
class __$FeaturedMediaCopyWithImpl<$Res>
    extends _$FeaturedMediaCopyWithImpl<$Res>
    implements _$FeaturedMediaCopyWith<$Res> {
  __$FeaturedMediaCopyWithImpl(
      _FeaturedMedia _value, $Res Function(_FeaturedMedia) _then)
      : super(_value, (v) => _then(v as _FeaturedMedia));

  @override
  _FeaturedMedia get _value => super._value as _FeaturedMedia;

  @override
  $Res call({
    Object? id = freezed,
    Object? mediaUrl = freezed,
    Object? title = freezed,
    Object? featuredMediaType = freezed,
    Object? duration = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_FeaturedMedia(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaUrl: mediaUrl == freezed
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      featuredMediaType: featuredMediaType == freezed
          ? _value.featuredMediaType
          : featuredMediaType // ignore: cast_nullable_to_non_nullable
              as FeaturedMediaType?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeaturedMedia implements _FeaturedMedia {
  _$_FeaturedMedia(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'url')
          this.mediaUrl,
      @JsonKey(name: 'title')
          this.title,
      @JsonKey(name: 'type', unknownEnumValue: FeaturedMediaType.UNKNOWN)
          this.featuredMediaType,
      @JsonKey(name: 'duration')
          this.duration,
      @JsonKey(name: 'width')
          this.width,
      @JsonKey(name: 'height')
          this.height,
      @JsonKey(name: 'thumbnail')
          this.thumbnail});

  factory _$_FeaturedMedia.fromJson(Map<String, dynamic> json) =>
      _$_$_FeaturedMediaFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'url')
  final String? mediaUrl;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'type', unknownEnumValue: FeaturedMediaType.UNKNOWN)
  final FeaturedMediaType? featuredMediaType;
  @override
  @JsonKey(name: 'duration')
  final double? duration;
  @override
  @JsonKey(name: 'width')
  final int? width;
  @override
  @JsonKey(name: 'height')
  final int? height;
  @override
  @JsonKey(name: 'thumbnail')
  final String? thumbnail;

  @override
  String toString() {
    return 'FeaturedMedia(id: $id, mediaUrl: $mediaUrl, title: $title, featuredMediaType: $featuredMediaType, duration: $duration, width: $width, height: $height, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FeaturedMedia &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.mediaUrl, mediaUrl) ||
                const DeepCollectionEquality()
                    .equals(other.mediaUrl, mediaUrl)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.featuredMediaType, featuredMediaType) ||
                const DeepCollectionEquality()
                    .equals(other.featuredMediaType, featuredMediaType)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.thumbnail, thumbnail) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnail, thumbnail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(mediaUrl) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(featuredMediaType) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(thumbnail);

  @JsonKey(ignore: true)
  @override
  _$FeaturedMediaCopyWith<_FeaturedMedia> get copyWith =>
      __$FeaturedMediaCopyWithImpl<_FeaturedMedia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeaturedMediaToJson(this);
  }
}

abstract class _FeaturedMedia implements FeaturedMedia {
  factory _FeaturedMedia(
      {@JsonKey(name: 'ID')
          int? id,
      @JsonKey(name: 'url')
          String? mediaUrl,
      @JsonKey(name: 'title')
          String? title,
      @JsonKey(name: 'type', unknownEnumValue: FeaturedMediaType.UNKNOWN)
          FeaturedMediaType? featuredMediaType,
      @JsonKey(name: 'duration')
          double? duration,
      @JsonKey(name: 'width')
          int? width,
      @JsonKey(name: 'height')
          int? height,
      @JsonKey(name: 'thumbnail')
          String? thumbnail}) = _$_FeaturedMedia;

  factory _FeaturedMedia.fromJson(Map<String, dynamic> json) =
      _$_FeaturedMedia.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'url')
  String? get mediaUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'type', unknownEnumValue: FeaturedMediaType.UNKNOWN)
  FeaturedMediaType? get featuredMediaType =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'duration')
  double? get duration => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'width')
  int? get width => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'height')
  int? get height => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'thumbnail')
  String? get thumbnail => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FeaturedMediaCopyWith<_FeaturedMedia> get copyWith =>
      throw _privateConstructorUsedError;
}
