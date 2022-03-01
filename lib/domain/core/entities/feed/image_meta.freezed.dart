// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageMeta _$ImageMetaFromJson(Map<String, dynamic> json) {
  return _ImageMeta.fromJson(json);
}

/// @nodoc
class _$ImageMetaTearOff {
  const _$ImageMetaTearOff();

  _ImageMeta call({String? imageDownloadUrl}) {
    return _ImageMeta(
      imageDownloadUrl: imageDownloadUrl,
    );
  }

  ImageMeta fromJson(Map<String, Object?> json) {
    return ImageMeta.fromJson(json);
  }
}

/// @nodoc
const $ImageMeta = _$ImageMetaTearOff();

/// @nodoc
mixin _$ImageMeta {
  String? get imageDownloadUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageMetaCopyWith<ImageMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageMetaCopyWith<$Res> {
  factory $ImageMetaCopyWith(ImageMeta value, $Res Function(ImageMeta) then) =
      _$ImageMetaCopyWithImpl<$Res>;
  $Res call({String? imageDownloadUrl});
}

/// @nodoc
class _$ImageMetaCopyWithImpl<$Res> implements $ImageMetaCopyWith<$Res> {
  _$ImageMetaCopyWithImpl(this._value, this._then);

  final ImageMeta _value;
  // ignore: unused_field
  final $Res Function(ImageMeta) _then;

  @override
  $Res call({
    Object? imageDownloadUrl = freezed,
  }) {
    return _then(_value.copyWith(
      imageDownloadUrl: imageDownloadUrl == freezed
          ? _value.imageDownloadUrl
          : imageDownloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ImageMetaCopyWith<$Res> implements $ImageMetaCopyWith<$Res> {
  factory _$ImageMetaCopyWith(
          _ImageMeta value, $Res Function(_ImageMeta) then) =
      __$ImageMetaCopyWithImpl<$Res>;
  @override
  $Res call({String? imageDownloadUrl});
}

/// @nodoc
class __$ImageMetaCopyWithImpl<$Res> extends _$ImageMetaCopyWithImpl<$Res>
    implements _$ImageMetaCopyWith<$Res> {
  __$ImageMetaCopyWithImpl(_ImageMeta _value, $Res Function(_ImageMeta) _then)
      : super(_value, (v) => _then(v as _ImageMeta));

  @override
  _ImageMeta get _value => super._value as _ImageMeta;

  @override
  $Res call({
    Object? imageDownloadUrl = freezed,
  }) {
    return _then(_ImageMeta(
      imageDownloadUrl: imageDownloadUrl == freezed
          ? _value.imageDownloadUrl
          : imageDownloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageMeta implements _ImageMeta {
  _$_ImageMeta({this.imageDownloadUrl});

  factory _$_ImageMeta.fromJson(Map<String, dynamic> json) =>
      _$$_ImageMetaFromJson(json);

  @override
  final String? imageDownloadUrl;

  @override
  String toString() {
    return 'ImageMeta(imageDownloadUrl: $imageDownloadUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageMeta &&
            const DeepCollectionEquality()
                .equals(other.imageDownloadUrl, imageDownloadUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(imageDownloadUrl));

  @JsonKey(ignore: true)
  @override
  _$ImageMetaCopyWith<_ImageMeta> get copyWith =>
      __$ImageMetaCopyWithImpl<_ImageMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageMetaToJson(this);
  }
}

abstract class _ImageMeta implements ImageMeta {
  factory _ImageMeta({String? imageDownloadUrl}) = _$_ImageMeta;

  factory _ImageMeta.fromJson(Map<String, dynamic> json) =
      _$_ImageMeta.fromJson;

  @override
  String? get imageDownloadUrl;
  @override
  @JsonKey(ignore: true)
  _$ImageMetaCopyWith<_ImageMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
