// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medication_codeable_concept.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicationCodeableConcept _$MedicationCodeableConceptFromJson(
    Map<String, dynamic> json) {
  return _MedicationCodeableConcept.fromJson(json);
}

/// @nodoc
mixin _$MedicationCodeableConcept {
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicationCodeableConceptCopyWith<MedicationCodeableConcept> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationCodeableConceptCopyWith<$Res> {
  factory $MedicationCodeableConceptCopyWith(MedicationCodeableConcept value,
          $Res Function(MedicationCodeableConcept) then) =
      _$MedicationCodeableConceptCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class _$MedicationCodeableConceptCopyWithImpl<$Res>
    implements $MedicationCodeableConceptCopyWith<$Res> {
  _$MedicationCodeableConceptCopyWithImpl(this._value, this._then);

  final MedicationCodeableConcept _value;
  // ignore: unused_field
  final $Res Function(MedicationCodeableConcept) _then;

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
abstract class _$$_MedicationCodeableConceptCopyWith<$Res>
    implements $MedicationCodeableConceptCopyWith<$Res> {
  factory _$$_MedicationCodeableConceptCopyWith(
          _$_MedicationCodeableConcept value,
          $Res Function(_$_MedicationCodeableConcept) then) =
      __$$_MedicationCodeableConceptCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class __$$_MedicationCodeableConceptCopyWithImpl<$Res>
    extends _$MedicationCodeableConceptCopyWithImpl<$Res>
    implements _$$_MedicationCodeableConceptCopyWith<$Res> {
  __$$_MedicationCodeableConceptCopyWithImpl(
      _$_MedicationCodeableConcept _value,
      $Res Function(_$_MedicationCodeableConcept) _then)
      : super(_value, (v) => _then(v as _$_MedicationCodeableConcept));

  @override
  _$_MedicationCodeableConcept get _value =>
      super._value as _$_MedicationCodeableConcept;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_MedicationCodeableConcept(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicationCodeableConcept implements _MedicationCodeableConcept {
  _$_MedicationCodeableConcept({@JsonKey(name: 'Text') this.text});

  factory _$_MedicationCodeableConcept.fromJson(Map<String, dynamic> json) =>
      _$$_MedicationCodeableConceptFromJson(json);

  @override
  @JsonKey(name: 'Text')
  final String? text;

  @override
  String toString() {
    return 'MedicationCodeableConcept(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicationCodeableConcept &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$$_MedicationCodeableConceptCopyWith<_$_MedicationCodeableConcept>
      get copyWith => __$$_MedicationCodeableConceptCopyWithImpl<
          _$_MedicationCodeableConcept>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicationCodeableConceptToJson(this);
  }
}

abstract class _MedicationCodeableConcept implements MedicationCodeableConcept {
  factory _MedicationCodeableConcept(
          {@JsonKey(name: 'Text') final String? text}) =
      _$_MedicationCodeableConcept;

  factory _MedicationCodeableConcept.fromJson(Map<String, dynamic> json) =
      _$_MedicationCodeableConcept.fromJson;

  @override
  @JsonKey(name: 'Text')
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_MedicationCodeableConceptCopyWith<_$_MedicationCodeableConcept>
      get copyWith => throw _privateConstructorUsedError;
}
