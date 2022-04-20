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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NextRefillData _$NextRefillDataFromJson(Map<String, dynamic> json) {
  return _NextRefillData.fromJson(json);
}

/// @nodoc
class _$NextRefillDataTearOff {
  const _$NextRefillDataTearOff();

  _NextRefillData call({@JsonKey(name: 'nextRefill') String? nextRefill}) {
    return _NextRefillData(
      nextRefill: nextRefill,
    );
  }

  NextRefillData fromJson(Map<String, Object?> json) {
    return NextRefillData.fromJson(json);
  }
}

/// @nodoc
const $NextRefillData = _$NextRefillDataTearOff();

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
abstract class _$NextRefillDataCopyWith<$Res>
    implements $NextRefillDataCopyWith<$Res> {
  factory _$NextRefillDataCopyWith(
          _NextRefillData value, $Res Function(_NextRefillData) then) =
      __$NextRefillDataCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'nextRefill') String? nextRefill});
}

/// @nodoc
class __$NextRefillDataCopyWithImpl<$Res>
    extends _$NextRefillDataCopyWithImpl<$Res>
    implements _$NextRefillDataCopyWith<$Res> {
  __$NextRefillDataCopyWithImpl(
      _NextRefillData _value, $Res Function(_NextRefillData) _then)
      : super(_value, (v) => _then(v as _NextRefillData));

  @override
  _NextRefillData get _value => super._value as _NextRefillData;

  @override
  $Res call({
    Object? nextRefill = freezed,
  }) {
    return _then(_NextRefillData(
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
            other is _NextRefillData &&
            const DeepCollectionEquality()
                .equals(other.nextRefill, nextRefill));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(nextRefill));

  @JsonKey(ignore: true)
  @override
  _$NextRefillDataCopyWith<_NextRefillData> get copyWith =>
      __$NextRefillDataCopyWithImpl<_NextRefillData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NextRefillDataToJson(this);
  }
}

abstract class _NextRefillData implements NextRefillData {
  factory _NextRefillData({@JsonKey(name: 'nextRefill') String? nextRefill}) =
      _$_NextRefillData;

  factory _NextRefillData.fromJson(Map<String, dynamic> json) =
      _$_NextRefillData.fromJson;

  @override
  @JsonKey(name: 'nextRefill')
  String? get nextRefill;
  @override
  @JsonKey(ignore: true)
  _$NextRefillDataCopyWith<_NextRefillData> get copyWith =>
      throw _privateConstructorUsedError;
}
