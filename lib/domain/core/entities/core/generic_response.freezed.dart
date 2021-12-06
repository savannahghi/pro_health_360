// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'generic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericResponse _$GenericResponseFromJson(Map<String, dynamic> json) {
  return _GenericResponse.fromJson(json);
}

/// @nodoc
class _$GenericResponseTearOff {
  const _$GenericResponseTearOff();

  _GenericResponse call(
      {@JsonKey(name: 'errors') List<Map<String, dynamic>>? errors,
      @JsonKey(name: 'data') Map<String, dynamic>? data}) {
    return _GenericResponse(
      errors: errors,
      data: data,
    );
  }

  GenericResponse fromJson(Map<String, Object> json) {
    return GenericResponse.fromJson(json);
  }
}

/// @nodoc
const $GenericResponse = _$GenericResponseTearOff();

/// @nodoc
mixin _$GenericResponse {
  @JsonKey(name: 'errors')
  List<Map<String, dynamic>>? get errors => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericResponseCopyWith<GenericResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericResponseCopyWith<$Res> {
  factory $GenericResponseCopyWith(
          GenericResponse value, $Res Function(GenericResponse) then) =
      _$GenericResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'errors') List<Map<String, dynamic>>? errors,
      @JsonKey(name: 'data') Map<String, dynamic>? data});
}

/// @nodoc
class _$GenericResponseCopyWithImpl<$Res>
    implements $GenericResponseCopyWith<$Res> {
  _$GenericResponseCopyWithImpl(this._value, this._then);

  final GenericResponse _value;
  // ignore: unused_field
  final $Res Function(GenericResponse) _then;

  @override
  $Res call({
    Object? errors = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$GenericResponseCopyWith<$Res>
    implements $GenericResponseCopyWith<$Res> {
  factory _$GenericResponseCopyWith(
          _GenericResponse value, $Res Function(_GenericResponse) then) =
      __$GenericResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'errors') List<Map<String, dynamic>>? errors,
      @JsonKey(name: 'data') Map<String, dynamic>? data});
}

/// @nodoc
class __$GenericResponseCopyWithImpl<$Res>
    extends _$GenericResponseCopyWithImpl<$Res>
    implements _$GenericResponseCopyWith<$Res> {
  __$GenericResponseCopyWithImpl(
      _GenericResponse _value, $Res Function(_GenericResponse) _then)
      : super(_value, (v) => _then(v as _GenericResponse));

  @override
  _GenericResponse get _value => super._value as _GenericResponse;

  @override
  $Res call({
    Object? errors = freezed,
    Object? data = freezed,
  }) {
    return _then(_GenericResponse(
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenericResponse implements _GenericResponse {
  _$_GenericResponse(
      {@JsonKey(name: 'errors') this.errors, @JsonKey(name: 'data') this.data});

  factory _$_GenericResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GenericResponseFromJson(json);

  @override
  @JsonKey(name: 'errors')
  final List<Map<String, dynamic>>? errors;
  @override
  @JsonKey(name: 'data')
  final Map<String, dynamic>? data;

  @override
  String toString() {
    return 'GenericResponse(errors: $errors, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenericResponse &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(errors) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$GenericResponseCopyWith<_GenericResponse> get copyWith =>
      __$GenericResponseCopyWithImpl<_GenericResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GenericResponseToJson(this);
  }
}

abstract class _GenericResponse implements GenericResponse {
  factory _GenericResponse(
      {@JsonKey(name: 'errors') List<Map<String, dynamic>>? errors,
      @JsonKey(name: 'data') Map<String, dynamic>? data}) = _$_GenericResponse;

  factory _GenericResponse.fromJson(Map<String, dynamic> json) =
      _$_GenericResponse.fromJson;

  @override
  @JsonKey(name: 'errors')
  List<Map<String, dynamic>>? get errors => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GenericResponseCopyWith<_GenericResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
