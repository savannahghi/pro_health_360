// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medical_data_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicalDataCategory _$MedicalDataCategoryFromJson(Map<String, dynamic> json) {
  return _MedicalDataCategory.fromJson(json);
}

/// @nodoc
mixin _$MedicalDataCategory {
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicalDataCategoryCopyWith<MedicalDataCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalDataCategoryCopyWith<$Res> {
  factory $MedicalDataCategoryCopyWith(
          MedicalDataCategory value, $Res Function(MedicalDataCategory) then) =
      _$MedicalDataCategoryCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class _$MedicalDataCategoryCopyWithImpl<$Res>
    implements $MedicalDataCategoryCopyWith<$Res> {
  _$MedicalDataCategoryCopyWithImpl(this._value, this._then);

  final MedicalDataCategory _value;
  // ignore: unused_field
  final $Res Function(MedicalDataCategory) _then;

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
abstract class _$$_MedicalDataCategoryCopyWith<$Res>
    implements $MedicalDataCategoryCopyWith<$Res> {
  factory _$$_MedicalDataCategoryCopyWith(_$_MedicalDataCategory value,
          $Res Function(_$_MedicalDataCategory) then) =
      __$$_MedicalDataCategoryCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class __$$_MedicalDataCategoryCopyWithImpl<$Res>
    extends _$MedicalDataCategoryCopyWithImpl<$Res>
    implements _$$_MedicalDataCategoryCopyWith<$Res> {
  __$$_MedicalDataCategoryCopyWithImpl(_$_MedicalDataCategory _value,
      $Res Function(_$_MedicalDataCategory) _then)
      : super(_value, (v) => _then(v as _$_MedicalDataCategory));

  @override
  _$_MedicalDataCategory get _value => super._value as _$_MedicalDataCategory;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_MedicalDataCategory(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicalDataCategory implements _MedicalDataCategory {
  _$_MedicalDataCategory({@JsonKey(name: 'Text') this.text});

  factory _$_MedicalDataCategory.fromJson(Map<String, dynamic> json) =>
      _$$_MedicalDataCategoryFromJson(json);

  @override
  @JsonKey(name: 'Text')
  final String? text;

  @override
  String toString() {
    return 'MedicalDataCategory(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicalDataCategory &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$$_MedicalDataCategoryCopyWith<_$_MedicalDataCategory> get copyWith =>
      __$$_MedicalDataCategoryCopyWithImpl<_$_MedicalDataCategory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicalDataCategoryToJson(this);
  }
}

abstract class _MedicalDataCategory implements MedicalDataCategory {
  factory _MedicalDataCategory({@JsonKey(name: 'Text') final String? text}) =
      _$_MedicalDataCategory;

  factory _MedicalDataCategory.fromJson(Map<String, dynamic> json) =
      _$_MedicalDataCategory.fromJson;

  @override
  @JsonKey(name: 'Text')
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_MedicalDataCategoryCopyWith<_$_MedicalDataCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
