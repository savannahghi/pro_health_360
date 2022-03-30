// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'codeable_concept.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CodeableConcept _$CodeableConceptFromJson(Map<String, dynamic> json) {
  return _CodeableConcept.fromJson(json);
}

/// @nodoc
class _$CodeableConceptTearOff {
  const _$CodeableConceptTearOff();

  _CodeableConcept call(
      {@JsonKey(name: 'coding') List<Coding?>? coding,
      @JsonKey(name: 'text') String? text}) {
    return _CodeableConcept(
      coding: coding,
      text: text,
    );
  }

  CodeableConcept fromJson(Map<String, Object?> json) {
    return CodeableConcept.fromJson(json);
  }
}

/// @nodoc
const $CodeableConcept = _$CodeableConceptTearOff();

/// @nodoc
mixin _$CodeableConcept {
  /// A reference to a code defined by a terminology system.
  @JsonKey(name: 'coding')
  List<Coding?>? get coding => throw _privateConstructorUsedError;

  /// A human language representation of the concept as seen/selected/uttered
  ///  by the user who entered the data and/or which represents the intended
  ///  meaning of the user.
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CodeableConceptCopyWith<CodeableConcept> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeableConceptCopyWith<$Res> {
  factory $CodeableConceptCopyWith(
          CodeableConcept value, $Res Function(CodeableConcept) then) =
      _$CodeableConceptCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'coding') List<Coding?>? coding,
      @JsonKey(name: 'text') String? text});
}

/// @nodoc
class _$CodeableConceptCopyWithImpl<$Res>
    implements $CodeableConceptCopyWith<$Res> {
  _$CodeableConceptCopyWithImpl(this._value, this._then);

  final CodeableConcept _value;
  // ignore: unused_field
  final $Res Function(CodeableConcept) _then;

  @override
  $Res call({
    Object? coding = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      coding: coding == freezed
          ? _value.coding
          : coding // ignore: cast_nullable_to_non_nullable
              as List<Coding?>?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CodeableConceptCopyWith<$Res>
    implements $CodeableConceptCopyWith<$Res> {
  factory _$CodeableConceptCopyWith(
          _CodeableConcept value, $Res Function(_CodeableConcept) then) =
      __$CodeableConceptCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'coding') List<Coding?>? coding,
      @JsonKey(name: 'text') String? text});
}

/// @nodoc
class __$CodeableConceptCopyWithImpl<$Res>
    extends _$CodeableConceptCopyWithImpl<$Res>
    implements _$CodeableConceptCopyWith<$Res> {
  __$CodeableConceptCopyWithImpl(
      _CodeableConcept _value, $Res Function(_CodeableConcept) _then)
      : super(_value, (v) => _then(v as _CodeableConcept));

  @override
  _CodeableConcept get _value => super._value as _CodeableConcept;

  @override
  $Res call({
    Object? coding = freezed,
    Object? text = freezed,
  }) {
    return _then(_CodeableConcept(
      coding: coding == freezed
          ? _value.coding
          : coding // ignore: cast_nullable_to_non_nullable
              as List<Coding?>?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CodeableConcept implements _CodeableConcept {
  _$_CodeableConcept(
      {@JsonKey(name: 'coding') this.coding, @JsonKey(name: 'text') this.text});

  factory _$_CodeableConcept.fromJson(Map<String, dynamic> json) =>
      _$$_CodeableConceptFromJson(json);

  @override

  /// A reference to a code defined by a terminology system.
  @JsonKey(name: 'coding')
  final List<Coding?>? coding;
  @override

  /// A human language representation of the concept as seen/selected/uttered
  ///  by the user who entered the data and/or which represents the intended
  ///  meaning of the user.
  @JsonKey(name: 'text')
  final String? text;

  @override
  String toString() {
    return 'CodeableConcept(coding: $coding, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CodeableConcept &&
            const DeepCollectionEquality().equals(other.coding, coding) &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(coding),
      const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$CodeableConceptCopyWith<_CodeableConcept> get copyWith =>
      __$CodeableConceptCopyWithImpl<_CodeableConcept>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CodeableConceptToJson(this);
  }
}

abstract class _CodeableConcept implements CodeableConcept {
  factory _CodeableConcept(
      {@JsonKey(name: 'coding') List<Coding?>? coding,
      @JsonKey(name: 'text') String? text}) = _$_CodeableConcept;

  factory _CodeableConcept.fromJson(Map<String, dynamic> json) =
      _$_CodeableConcept.fromJson;

  @override

  /// A reference to a code defined by a terminology system.
  @JsonKey(name: 'coding')
  List<Coding?>? get coding;
  @override

  /// A human language representation of the concept as seen/selected/uttered
  ///  by the user who entered the data and/or which represents the intended
  ///  meaning of the user.
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$CodeableConceptCopyWith<_CodeableConcept> get copyWith =>
      throw _privateConstructorUsedError;
}
