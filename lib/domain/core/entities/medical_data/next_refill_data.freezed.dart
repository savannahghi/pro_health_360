// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'next_refill_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NextRefillData _$NextRefillDataFromJson(Map<String, dynamic> json) {
  return _NextRefillData.fromJson(json);
}

/// @nodoc
mixin _$NextRefillData {
  @JsonKey(name: 'nextRefill')
  String? get nextRefill => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NextRefillDataCopyWith<NextRefillData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextRefillDataCopyWith<$Res> {
  factory $NextRefillDataCopyWith(
          NextRefillData value, $Res Function(NextRefillData) then) =
      _$NextRefillDataCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'nextRefill') String? nextRefill});
}

/// @nodoc
class _$NextRefillDataCopyWithImpl<$Res>
    implements $NextRefillDataCopyWith<$Res> {
  _$NextRefillDataCopyWithImpl(this._value, this._then);

  final NextRefillData _value;
  // ignore: unused_field
  final $Res Function(NextRefillData) _then;

  @override
  $Res call({
    Object? nextRefill = freezed,
  }) {
    return _then(_value.copyWith(
      nextRefill: nextRefill == freezed
          ? _value.nextRefill
          : nextRefill // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_NextRefillDataCopyWith<$Res>
    implements $NextRefillDataCopyWith<$Res> {
  factory _$$_NextRefillDataCopyWith(
          _$_NextRefillData value, $Res Function(_$_NextRefillData) then) =
      __$$_NextRefillDataCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'nextRefill') String? nextRefill});
}

/// @nodoc
class __$$_NextRefillDataCopyWithImpl<$Res>
    extends _$NextRefillDataCopyWithImpl<$Res>
    implements _$$_NextRefillDataCopyWith<$Res> {
  __$$_NextRefillDataCopyWithImpl(
      _$_NextRefillData _value, $Res Function(_$_NextRefillData) _then)
      : super(_value, (v) => _then(v as _$_NextRefillData));

  @override
  _$_NextRefillData get _value => super._value as _$_NextRefillData;

  @override
  $Res call({
    Object? nextRefill = freezed,
  }) {
    return _then(_$_NextRefillData(
      nextRefill: nextRefill == freezed
          ? _value.nextRefill
          : nextRefill // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NextRefillData implements _NextRefillData {
  _$_NextRefillData({@JsonKey(name: 'nextRefill') this.nextRefill});

  factory _$_NextRefillData.fromJson(Map<String, dynamic> json) =>
      _$$_NextRefillDataFromJson(json);

  @override
  @JsonKey(name: 'nextRefill')
  final String? nextRefill;

  @override
  String toString() {
    return 'NextRefillData(nextRefill: $nextRefill)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NextRefillData &&
            const DeepCollectionEquality()
                .equals(other.nextRefill, nextRefill));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(nextRefill));

  @JsonKey(ignore: true)
  @override
  _$$_NextRefillDataCopyWith<_$_NextRefillData> get copyWith =>
      __$$_NextRefillDataCopyWithImpl<_$_NextRefillData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NextRefillDataToJson(this);
  }
}

abstract class _NextRefillData implements NextRefillData {
  factory _NextRefillData(
          {@JsonKey(name: 'nextRefill') final String? nextRefill}) =
      _$_NextRefillData;

  factory _NextRefillData.fromJson(Map<String, dynamic> json) =
      _$_NextRefillData.fromJson;

  @override
  @JsonKey(name: 'nextRefill')
  String? get nextRefill;
  @override
  @JsonKey(ignore: true)
  _$$_NextRefillDataCopyWith<_$_NextRefillData> get copyWith =>
      throw _privateConstructorUsedError;
}
