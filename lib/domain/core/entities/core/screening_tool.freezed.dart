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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningTool _$ScreeningToolFromJson(Map<String, dynamic> json) {
  return _ScreeningTool.fromJson(json);
}

/// @nodoc
mixin _$ScreeningTool {
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'toolType')
  ScreeningToolsType? get toolType => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'toolType') ScreeningToolsType? toolType});
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
    Object? toolType = freezed,
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
      toolType: toolType == freezed
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsType?,
    ));
  }
}

/// @nodoc
abstract class _$$_ScreeningToolCopyWith<$Res>
    implements $ScreeningToolCopyWith<$Res> {
  factory _$$_ScreeningToolCopyWith(
          _$_ScreeningTool value, $Res Function(_$_ScreeningTool) then) =
      __$$_ScreeningToolCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'toolType') ScreeningToolsType? toolType});
}

/// @nodoc
class __$$_ScreeningToolCopyWithImpl<$Res>
    extends _$ScreeningToolCopyWithImpl<$Res>
    implements _$$_ScreeningToolCopyWith<$Res> {
  __$$_ScreeningToolCopyWithImpl(
      _$_ScreeningTool _value, $Res Function(_$_ScreeningTool) _then)
      : super(_value, (v) => _then(v as _$_ScreeningTool));

  @override
  _$_ScreeningTool get _value => super._value as _$_ScreeningTool;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? toolType = freezed,
  }) {
    return _then(_$_ScreeningTool(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      toolType: toolType == freezed
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningTool implements _ScreeningTool {
  _$_ScreeningTool(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'toolType') this.toolType});

  factory _$_ScreeningTool.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningToolFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'toolType')
  final ScreeningToolsType? toolType;

  @override
  String toString() {
    return 'ScreeningTool(title: $title, description: $description, toolType: $toolType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningTool &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.toolType, toolType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(toolType));

  @JsonKey(ignore: true)
  @override
  _$$_ScreeningToolCopyWith<_$_ScreeningTool> get copyWith =>
      __$$_ScreeningToolCopyWithImpl<_$_ScreeningTool>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningToolToJson(this);
  }
}

abstract class _ScreeningTool implements ScreeningTool {
  factory _ScreeningTool(
          {@JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'toolType') final ScreeningToolsType? toolType}) =
      _$_ScreeningTool;

  factory _ScreeningTool.fromJson(Map<String, dynamic> json) =
      _$_ScreeningTool.fromJson;

  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'toolType')
  ScreeningToolsType? get toolType;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningToolCopyWith<_$_ScreeningTool> get copyWith =>
      throw _privateConstructorUsedError;
}
