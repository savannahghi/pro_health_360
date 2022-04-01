// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_tool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningTool _$ScreeningToolFromJson(Map<String, dynamic> json) {
  return _ScreeningTool.fromJson(json);
}

/// @nodoc
class _$ScreeningToolTearOff {
  const _$ScreeningToolTearOff();

  _ScreeningTool call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description}) {
    return _ScreeningTool(
      title: title,
      description: description,
    );
  }

  ScreeningTool fromJson(Map<String, Object?> json) {
    return ScreeningTool.fromJson(json);
  }
}

/// @nodoc
const $ScreeningTool = _$ScreeningToolTearOff();

/// @nodoc
mixin _$ScreeningTool {
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningToolCopyWith<ScreeningTool> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningToolCopyWith<$Res> {
  factory $ScreeningToolCopyWith(
          ScreeningTool value, $Res Function(ScreeningTool) then) =
      _$ScreeningToolCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$ScreeningToolCopyWithImpl<$Res>
    implements $ScreeningToolCopyWith<$Res> {
  _$ScreeningToolCopyWithImpl(this._value, this._then);

  final ScreeningTool _value;
  // ignore: unused_field
  final $Res Function(ScreeningTool) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ScreeningToolCopyWith<$Res>
    implements $ScreeningToolCopyWith<$Res> {
  factory _$ScreeningToolCopyWith(
          _ScreeningTool value, $Res Function(_ScreeningTool) then) =
      __$ScreeningToolCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$ScreeningToolCopyWithImpl<$Res>
    extends _$ScreeningToolCopyWithImpl<$Res>
    implements _$ScreeningToolCopyWith<$Res> {
  __$ScreeningToolCopyWithImpl(
      _ScreeningTool _value, $Res Function(_ScreeningTool) _then)
      : super(_value, (v) => _then(v as _ScreeningTool));

  @override
  _ScreeningTool get _value => super._value as _ScreeningTool;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_ScreeningTool(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningTool implements _ScreeningTool {
  _$_ScreeningTool(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description});

  factory _$_ScreeningTool.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningToolFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;

  @override
  String toString() {
    return 'ScreeningTool(title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScreeningTool &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$ScreeningToolCopyWith<_ScreeningTool> get copyWith =>
      __$ScreeningToolCopyWithImpl<_ScreeningTool>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningToolToJson(this);
  }
}

abstract class _ScreeningTool implements ScreeningTool {
  factory _ScreeningTool(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description}) = _$_ScreeningTool;

  factory _ScreeningTool.fromJson(Map<String, dynamic> json) =
      _$_ScreeningTool.fromJson;

  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$ScreeningToolCopyWith<_ScreeningTool> get copyWith =>
      throw _privateConstructorUsedError;
}
