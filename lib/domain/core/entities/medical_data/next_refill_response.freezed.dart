// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'next_refill_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NextRefillResponse _$NextRefillResponseFromJson(Map<String, dynamic> json) {
  return _NextRefillResponse.fromJson(json);
}

/// @nodoc
mixin _$NextRefillResponse {
  @JsonKey(name: 'data')
  NextRefillData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NextRefillResponseCopyWith<NextRefillResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextRefillResponseCopyWith<$Res> {
  factory $NextRefillResponseCopyWith(
          NextRefillResponse value, $Res Function(NextRefillResponse) then) =
      _$NextRefillResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'data') NextRefillData? data});

  $NextRefillDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$NextRefillResponseCopyWithImpl<$Res>
    implements $NextRefillResponseCopyWith<$Res> {
  _$NextRefillResponseCopyWithImpl(this._value, this._then);

  final NextRefillResponse _value;
  // ignore: unused_field
  final $Res Function(NextRefillResponse) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NextRefillData?,
    ));
  }

  @override
  $NextRefillDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $NextRefillDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_NextRefillResponseCopyWith<$Res>
    implements $NextRefillResponseCopyWith<$Res> {
  factory _$$_NextRefillResponseCopyWith(_$_NextRefillResponse value,
          $Res Function(_$_NextRefillResponse) then) =
      __$$_NextRefillResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'data') NextRefillData? data});

  @override
  $NextRefillDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_NextRefillResponseCopyWithImpl<$Res>
    extends _$NextRefillResponseCopyWithImpl<$Res>
    implements _$$_NextRefillResponseCopyWith<$Res> {
  __$$_NextRefillResponseCopyWithImpl(
      _$_NextRefillResponse _value, $Res Function(_$_NextRefillResponse) _then)
      : super(_value, (v) => _then(v as _$_NextRefillResponse));

  @override
  _$_NextRefillResponse get _value => super._value as _$_NextRefillResponse;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_NextRefillResponse(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NextRefillData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NextRefillResponse implements _NextRefillResponse {
  _$_NextRefillResponse({@JsonKey(name: 'data') this.data});

  factory _$_NextRefillResponse.fromJson(Map<String, dynamic> json) =>
      _$$_NextRefillResponseFromJson(json);

  @override
  @JsonKey(name: 'data')
  final NextRefillData? data;

  @override
  String toString() {
    return 'NextRefillResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NextRefillResponse &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_NextRefillResponseCopyWith<_$_NextRefillResponse> get copyWith =>
      __$$_NextRefillResponseCopyWithImpl<_$_NextRefillResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NextRefillResponseToJson(this);
  }
}

abstract class _NextRefillResponse implements NextRefillResponse {
  factory _NextRefillResponse(
          {@JsonKey(name: 'data') final NextRefillData? data}) =
      _$_NextRefillResponse;

  factory _NextRefillResponse.fromJson(Map<String, dynamic> json) =
      _$_NextRefillResponse.fromJson;

  @override
  @JsonKey(name: 'data')
  NextRefillData? get data;
  @override
  @JsonKey(ignore: true)
  _$$_NextRefillResponseCopyWith<_$_NextRefillResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
