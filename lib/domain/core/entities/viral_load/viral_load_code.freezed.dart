// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'viral_load_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViralLoadCode _$ViralLoadCodeFromJson(Map<String, dynamic> json) {
  return _ViralLoadCode.fromJson(json);
}

/// @nodoc
class _$ViralLoadCodeTearOff {
  const _$ViralLoadCodeTearOff();

  _ViralLoadCode call({@JsonKey(name: 'Text') String? text}) {
    return _ViralLoadCode(
      text: text,
    );
  }

  ViralLoadCode fromJson(Map<String, Object?> json) {
    return ViralLoadCode.fromJson(json);
  }
}

/// @nodoc
const $ViralLoadCode = _$ViralLoadCodeTearOff();

/// @nodoc
mixin _$ViralLoadCode {
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViralLoadCodeCopyWith<ViralLoadCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViralLoadCodeCopyWith<$Res> {
  factory $ViralLoadCodeCopyWith(
          ViralLoadCode value, $Res Function(ViralLoadCode) then) =
      _$ViralLoadCodeCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class _$ViralLoadCodeCopyWithImpl<$Res>
    implements $ViralLoadCodeCopyWith<$Res> {
  _$ViralLoadCodeCopyWithImpl(this._value, this._then);

  final ViralLoadCode _value;
  // ignore: unused_field
  final $Res Function(ViralLoadCode) _then;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ViralLoadCodeCopyWith<$Res>
    implements $ViralLoadCodeCopyWith<$Res> {
  factory _$ViralLoadCodeCopyWith(
          _ViralLoadCode value, $Res Function(_ViralLoadCode) then) =
      __$ViralLoadCodeCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class __$ViralLoadCodeCopyWithImpl<$Res>
    extends _$ViralLoadCodeCopyWithImpl<$Res>
    implements _$ViralLoadCodeCopyWith<$Res> {
  __$ViralLoadCodeCopyWithImpl(
      _ViralLoadCode _value, $Res Function(_ViralLoadCode) _then)
      : super(_value, (v) => _then(v as _ViralLoadCode));

  @override
  _ViralLoadCode get _value => super._value as _ViralLoadCode;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_ViralLoadCode(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViralLoadCode implements _ViralLoadCode {
  _$_ViralLoadCode({@JsonKey(name: 'Text') this.text});

  factory _$_ViralLoadCode.fromJson(Map<String, dynamic> json) =>
      _$$_ViralLoadCodeFromJson(json);

  @override
  @JsonKey(name: 'Text')
  final String? text;

  @override
  String toString() {
    return 'ViralLoadCode(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViralLoadCode &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$ViralLoadCodeCopyWith<_ViralLoadCode> get copyWith =>
      __$ViralLoadCodeCopyWithImpl<_ViralLoadCode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViralLoadCodeToJson(this);
  }
}

abstract class _ViralLoadCode implements ViralLoadCode {
  factory _ViralLoadCode({@JsonKey(name: 'Text') String? text}) =
      _$_ViralLoadCode;

  factory _ViralLoadCode.fromJson(Map<String, dynamic> json) =
      _$_ViralLoadCode.fromJson;

  @override
  @JsonKey(name: 'Text')
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$ViralLoadCodeCopyWith<_ViralLoadCode> get copyWith =>
      throw _privateConstructorUsedError;
}
