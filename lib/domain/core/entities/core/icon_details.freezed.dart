// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'icon_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IconDetails _$IconDetailsFromJson(Map<String, dynamic> json) {
  return _IconDetails.fromJson(json);
}

/// @nodoc
class _$IconDetailsTearOff {
  const _$IconDetailsTearOff();

  _IconDetails call({@JsonKey(name: 'url') required String iconUrlSvgPath}) {
    return _IconDetails(
      iconUrlSvgPath: iconUrlSvgPath,
    );
  }

  IconDetails fromJson(Map<String, Object> json) {
    return IconDetails.fromJson(json);
  }
}

/// @nodoc
const $IconDetails = _$IconDetailsTearOff();

/// @nodoc
mixin _$IconDetails {
  @JsonKey(name: 'url')
  String get iconUrlSvgPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IconDetailsCopyWith<IconDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconDetailsCopyWith<$Res> {
  factory $IconDetailsCopyWith(
          IconDetails value, $Res Function(IconDetails) then) =
      _$IconDetailsCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'url') String iconUrlSvgPath});
}

/// @nodoc
class _$IconDetailsCopyWithImpl<$Res> implements $IconDetailsCopyWith<$Res> {
  _$IconDetailsCopyWithImpl(this._value, this._then);

  final IconDetails _value;
  // ignore: unused_field
  final $Res Function(IconDetails) _then;

  @override
  $Res call({
    Object? iconUrlSvgPath = freezed,
  }) {
    return _then(_value.copyWith(
      iconUrlSvgPath: iconUrlSvgPath == freezed
          ? _value.iconUrlSvgPath
          : iconUrlSvgPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$IconDetailsCopyWith<$Res>
    implements $IconDetailsCopyWith<$Res> {
  factory _$IconDetailsCopyWith(
          _IconDetails value, $Res Function(_IconDetails) then) =
      __$IconDetailsCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'url') String iconUrlSvgPath});
}

/// @nodoc
class __$IconDetailsCopyWithImpl<$Res> extends _$IconDetailsCopyWithImpl<$Res>
    implements _$IconDetailsCopyWith<$Res> {
  __$IconDetailsCopyWithImpl(
      _IconDetails _value, $Res Function(_IconDetails) _then)
      : super(_value, (v) => _then(v as _IconDetails));

  @override
  _IconDetails get _value => super._value as _IconDetails;

  @override
  $Res call({
    Object? iconUrlSvgPath = freezed,
  }) {
    return _then(_IconDetails(
      iconUrlSvgPath: iconUrlSvgPath == freezed
          ? _value.iconUrlSvgPath
          : iconUrlSvgPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IconDetails implements _IconDetails {
  _$_IconDetails({@JsonKey(name: 'url') required this.iconUrlSvgPath});

  factory _$_IconDetails.fromJson(Map<String, dynamic> json) =>
      _$_$_IconDetailsFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String iconUrlSvgPath;

  @override
  String toString() {
    return 'IconDetails(iconUrlSvgPath: $iconUrlSvgPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IconDetails &&
            (identical(other.iconUrlSvgPath, iconUrlSvgPath) ||
                const DeepCollectionEquality()
                    .equals(other.iconUrlSvgPath, iconUrlSvgPath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(iconUrlSvgPath);

  @JsonKey(ignore: true)
  @override
  _$IconDetailsCopyWith<_IconDetails> get copyWith =>
      __$IconDetailsCopyWithImpl<_IconDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IconDetailsToJson(this);
  }
}

abstract class _IconDetails implements IconDetails {
  factory _IconDetails({@JsonKey(name: 'url') required String iconUrlSvgPath}) =
      _$_IconDetails;

  factory _IconDetails.fromJson(Map<String, dynamic> json) =
      _$_IconDetails.fromJson;

  @override
  @JsonKey(name: 'url')
  String get iconUrlSvgPath => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IconDetailsCopyWith<_IconDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
