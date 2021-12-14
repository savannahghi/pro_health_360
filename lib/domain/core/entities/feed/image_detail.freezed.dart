// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'image_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageDetail _$ImageDetailFromJson(Map<String, dynamic> json) {
  return _ImageDetail.fromJson(json);
}

/// @nodoc
class _$ImageDetailTearOff {
  const _$ImageDetailTearOff();

  _ImageDetail call({int? id, String? title, ImageMeta? meta}) {
    return _ImageDetail(
      id: id,
      title: title,
      meta: meta,
    );
  }

  ImageDetail fromJson(Map<String, Object> json) {
    return ImageDetail.fromJson(json);
  }
}

/// @nodoc
const $ImageDetail = _$ImageDetailTearOff();

/// @nodoc
mixin _$ImageDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  ImageMeta? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageDetailCopyWith<ImageDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDetailCopyWith<$Res> {
  factory $ImageDetailCopyWith(
          ImageDetail value, $Res Function(ImageDetail) then) =
      _$ImageDetailCopyWithImpl<$Res>;
  $Res call({int? id, String? title, ImageMeta? meta});

  $ImageMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ImageDetailCopyWithImpl<$Res> implements $ImageDetailCopyWith<$Res> {
  _$ImageDetailCopyWithImpl(this._value, this._then);

  final ImageDetail _value;
  // ignore: unused_field
  final $Res Function(ImageDetail) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ImageMeta?,
    ));
  }

  @override
  $ImageMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $ImageMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value));
    });
  }
}

/// @nodoc
abstract class _$ImageDetailCopyWith<$Res>
    implements $ImageDetailCopyWith<$Res> {
  factory _$ImageDetailCopyWith(
          _ImageDetail value, $Res Function(_ImageDetail) then) =
      __$ImageDetailCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? title, ImageMeta? meta});

  @override
  $ImageMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$ImageDetailCopyWithImpl<$Res> extends _$ImageDetailCopyWithImpl<$Res>
    implements _$ImageDetailCopyWith<$Res> {
  __$ImageDetailCopyWithImpl(
      _ImageDetail _value, $Res Function(_ImageDetail) _then)
      : super(_value, (v) => _then(v as _ImageDetail));

  @override
  _ImageDetail get _value => super._value as _ImageDetail;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? meta = freezed,
  }) {
    return _then(_ImageDetail(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ImageMeta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageDetail implements _ImageDetail {
  _$_ImageDetail({this.id, this.title, this.meta});

  factory _$_ImageDetail.fromJson(Map<String, dynamic> json) =>
      _$_$_ImageDetailFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final ImageMeta? meta;

  @override
  String toString() {
    return 'ImageDetail(id: $id, title: $title, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.meta, meta) ||
                const DeepCollectionEquality().equals(other.meta, meta)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(meta);

  @JsonKey(ignore: true)
  @override
  _$ImageDetailCopyWith<_ImageDetail> get copyWith =>
      __$ImageDetailCopyWithImpl<_ImageDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ImageDetailToJson(this);
  }
}

abstract class _ImageDetail implements ImageDetail {
  factory _ImageDetail({int? id, String? title, ImageMeta? meta}) =
      _$_ImageDetail;

  factory _ImageDetail.fromJson(Map<String, dynamic> json) =
      _$_ImageDetail.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  ImageMeta? get meta => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ImageDetailCopyWith<_ImageDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
