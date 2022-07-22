// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coding _$CodingFromJson(Map<String, dynamic> json) {
  return _Coding.fromJson(json);
}

/// @nodoc
mixin _$Coding {
  /// The identification of the code system that defines the meaning of the
  ///  symbol in the code.
  @JsonKey(name: 'system')
  String? get system => throw _privateConstructorUsedError;

  /// A symbol in syntax defined by the system. The symbol may be a
  ///  predefined code or an expression in a syntax defined by the coding
  ///  system (e.g. post-coordination).
  @JsonKey(name: 'code')
  String? get code => throw _privateConstructorUsedError;

  /// A representation of the meaning of the code in the system, following
  ///  the rules of the system.
  @JsonKey(name: 'display')
  String? get display => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CodingCopyWith<Coding> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodingCopyWith<$Res> {
  factory $CodingCopyWith(Coding value, $Res Function(Coding) then) =
      _$CodingCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'system') String? system,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'display') String? display});
}

/// @nodoc
class _$CodingCopyWithImpl<$Res> implements $CodingCopyWith<$Res> {
  _$CodingCopyWithImpl(this._value, this._then);

  final Coding _value;
  // ignore: unused_field
  final $Res Function(Coding) _then;

  @override
  $Res call({
    Object? system = freezed,
    Object? code = freezed,
    Object? display = freezed,
  }) {
    return _then(_value.copyWith(
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      display: display == freezed
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CodingCopyWith<$Res> implements $CodingCopyWith<$Res> {
  factory _$$_CodingCopyWith(_$_Coding value, $Res Function(_$_Coding) then) =
      __$$_CodingCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'system') String? system,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'display') String? display});
}

/// @nodoc
class __$$_CodingCopyWithImpl<$Res> extends _$CodingCopyWithImpl<$Res>
    implements _$$_CodingCopyWith<$Res> {
  __$$_CodingCopyWithImpl(_$_Coding _value, $Res Function(_$_Coding) _then)
      : super(_value, (v) => _then(v as _$_Coding));

  @override
  _$_Coding get _value => super._value as _$_Coding;

  @override
  $Res call({
    Object? system = freezed,
    Object? code = freezed,
    Object? display = freezed,
  }) {
    return _then(_$_Coding(
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      display: display == freezed
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coding implements _Coding {
  _$_Coding(
      {@JsonKey(name: 'system') this.system,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'display') this.display});

  factory _$_Coding.fromJson(Map<String, dynamic> json) =>
      _$$_CodingFromJson(json);

  /// The identification of the code system that defines the meaning of the
  ///  symbol in the code.
  @override
  @JsonKey(name: 'system')
  final String? system;

  /// A symbol in syntax defined by the system. The symbol may be a
  ///  predefined code or an expression in a syntax defined by the coding
  ///  system (e.g. post-coordination).
  @override
  @JsonKey(name: 'code')
  final String? code;

  /// A representation of the meaning of the code in the system, following
  ///  the rules of the system.
  @override
  @JsonKey(name: 'display')
  final String? display;

  @override
  String toString() {
    return 'Coding(system: $system, code: $code, display: $display)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Coding &&
            const DeepCollectionEquality().equals(other.system, system) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.display, display));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(system),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(display));

  @JsonKey(ignore: true)
  @override
  _$$_CodingCopyWith<_$_Coding> get copyWith =>
      __$$_CodingCopyWithImpl<_$_Coding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CodingToJson(this);
  }
}

abstract class _Coding implements Coding {
  factory _Coding(
      {@JsonKey(name: 'system') final String? system,
      @JsonKey(name: 'code') final String? code,
      @JsonKey(name: 'display') final String? display}) = _$_Coding;

  factory _Coding.fromJson(Map<String, dynamic> json) = _$_Coding.fromJson;

  @override

  /// The identification of the code system that defines the meaning of the
  ///  symbol in the code.
  @JsonKey(name: 'system')
  String? get system;
  @override

  /// A symbol in syntax defined by the system. The symbol may be a
  ///  predefined code or an expression in a syntax defined by the coding
  ///  system (e.g. post-coordination).
  @JsonKey(name: 'code')
  String? get code;
  @override

  /// A representation of the meaning of the code in the system, following
  ///  the rules of the system.
  @JsonKey(name: 'display')
  String? get display;
  @override
  @JsonKey(ignore: true)
  _$$_CodingCopyWith<_$_Coding> get copyWith =>
      throw _privateConstructorUsedError;
}
