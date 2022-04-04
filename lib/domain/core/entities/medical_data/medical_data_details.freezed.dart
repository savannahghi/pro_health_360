// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medical_data_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicalDataDetails _$MedicalDataDetailsFromJson(Map<String, dynamic> json) {
  return _MedicalDataDetails.fromJson(json);
}

/// @nodoc
class _$MedicalDataDetailsTearOff {
  const _$MedicalDataDetailsTearOff();

  _MedicalDataDetails call(
      {@JsonKey(name: 'ValueString')
          String? valueString,
      @JsonKey(name: 'ClinicalStatus')
          MedicalDataClinicalStatus? clinicalStatus,
      @JsonKey(name: 'Category')
          MedicalDataCategory? category,
      @JsonKey(name: 'MedicationCodeableConcept')
          MedicationCodeableConcept? medicationCodeableConcept}) {
    return _MedicalDataDetails(
      valueString: valueString,
      clinicalStatus: clinicalStatus,
      category: category,
      medicationCodeableConcept: medicationCodeableConcept,
    );
  }

  MedicalDataDetails fromJson(Map<String, Object?> json) {
    return MedicalDataDetails.fromJson(json);
  }
}

/// @nodoc
const $MedicalDataDetails = _$MedicalDataDetailsTearOff();

/// @nodoc
mixin _$MedicalDataDetails {
  @JsonKey(name: 'ValueString')
  String? get valueString => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClinicalStatus')
  MedicalDataClinicalStatus? get clinicalStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Category')
  MedicalDataCategory? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'MedicationCodeableConcept')
  MedicationCodeableConcept? get medicationCodeableConcept =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicalDataDetailsCopyWith<MedicalDataDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalDataDetailsCopyWith<$Res> {
  factory $MedicalDataDetailsCopyWith(
          MedicalDataDetails value, $Res Function(MedicalDataDetails) then) =
      _$MedicalDataDetailsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ValueString')
          String? valueString,
      @JsonKey(name: 'ClinicalStatus')
          MedicalDataClinicalStatus? clinicalStatus,
      @JsonKey(name: 'Category')
          MedicalDataCategory? category,
      @JsonKey(name: 'MedicationCodeableConcept')
          MedicationCodeableConcept? medicationCodeableConcept});

  $MedicalDataClinicalStatusCopyWith<$Res>? get clinicalStatus;
  $MedicalDataCategoryCopyWith<$Res>? get category;
  $MedicationCodeableConceptCopyWith<$Res>? get medicationCodeableConcept;
}

/// @nodoc
class _$MedicalDataDetailsCopyWithImpl<$Res>
    implements $MedicalDataDetailsCopyWith<$Res> {
  _$MedicalDataDetailsCopyWithImpl(this._value, this._then);

  final MedicalDataDetails _value;
  // ignore: unused_field
  final $Res Function(MedicalDataDetails) _then;

  @override
  $Res call({
    Object? valueString = freezed,
    Object? clinicalStatus = freezed,
    Object? category = freezed,
    Object? medicationCodeableConcept = freezed,
  }) {
    return _then(_value.copyWith(
      valueString: valueString == freezed
          ? _value.valueString
          : valueString // ignore: cast_nullable_to_non_nullable
              as String?,
      clinicalStatus: clinicalStatus == freezed
          ? _value.clinicalStatus
          : clinicalStatus // ignore: cast_nullable_to_non_nullable
              as MedicalDataClinicalStatus?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MedicalDataCategory?,
      medicationCodeableConcept: medicationCodeableConcept == freezed
          ? _value.medicationCodeableConcept
          : medicationCodeableConcept // ignore: cast_nullable_to_non_nullable
              as MedicationCodeableConcept?,
    ));
  }

  @override
  $MedicalDataClinicalStatusCopyWith<$Res>? get clinicalStatus {
    if (_value.clinicalStatus == null) {
      return null;
    }

    return $MedicalDataClinicalStatusCopyWith<$Res>(_value.clinicalStatus!,
        (value) {
      return _then(_value.copyWith(clinicalStatus: value));
    });
  }

  @override
  $MedicalDataCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $MedicalDataCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
    });
  }

  @override
  $MedicationCodeableConceptCopyWith<$Res>? get medicationCodeableConcept {
    if (_value.medicationCodeableConcept == null) {
      return null;
    }

    return $MedicationCodeableConceptCopyWith<$Res>(
        _value.medicationCodeableConcept!, (value) {
      return _then(_value.copyWith(medicationCodeableConcept: value));
    });
  }
}

/// @nodoc
abstract class _$MedicalDataDetailsCopyWith<$Res>
    implements $MedicalDataDetailsCopyWith<$Res> {
  factory _$MedicalDataDetailsCopyWith(
          _MedicalDataDetails value, $Res Function(_MedicalDataDetails) then) =
      __$MedicalDataDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ValueString')
          String? valueString,
      @JsonKey(name: 'ClinicalStatus')
          MedicalDataClinicalStatus? clinicalStatus,
      @JsonKey(name: 'Category')
          MedicalDataCategory? category,
      @JsonKey(name: 'MedicationCodeableConcept')
          MedicationCodeableConcept? medicationCodeableConcept});

  @override
  $MedicalDataClinicalStatusCopyWith<$Res>? get clinicalStatus;
  @override
  $MedicalDataCategoryCopyWith<$Res>? get category;
  @override
  $MedicationCodeableConceptCopyWith<$Res>? get medicationCodeableConcept;
}

/// @nodoc
class __$MedicalDataDetailsCopyWithImpl<$Res>
    extends _$MedicalDataDetailsCopyWithImpl<$Res>
    implements _$MedicalDataDetailsCopyWith<$Res> {
  __$MedicalDataDetailsCopyWithImpl(
      _MedicalDataDetails _value, $Res Function(_MedicalDataDetails) _then)
      : super(_value, (v) => _then(v as _MedicalDataDetails));

  @override
  _MedicalDataDetails get _value => super._value as _MedicalDataDetails;

  @override
  $Res call({
    Object? valueString = freezed,
    Object? clinicalStatus = freezed,
    Object? category = freezed,
    Object? medicationCodeableConcept = freezed,
  }) {
    return _then(_MedicalDataDetails(
      valueString: valueString == freezed
          ? _value.valueString
          : valueString // ignore: cast_nullable_to_non_nullable
              as String?,
      clinicalStatus: clinicalStatus == freezed
          ? _value.clinicalStatus
          : clinicalStatus // ignore: cast_nullable_to_non_nullable
              as MedicalDataClinicalStatus?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MedicalDataCategory?,
      medicationCodeableConcept: medicationCodeableConcept == freezed
          ? _value.medicationCodeableConcept
          : medicationCodeableConcept // ignore: cast_nullable_to_non_nullable
              as MedicationCodeableConcept?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicalDataDetails implements _MedicalDataDetails {
  _$_MedicalDataDetails(
      {@JsonKey(name: 'ValueString')
          this.valueString,
      @JsonKey(name: 'ClinicalStatus')
          this.clinicalStatus,
      @JsonKey(name: 'Category')
          this.category,
      @JsonKey(name: 'MedicationCodeableConcept')
          this.medicationCodeableConcept});

  factory _$_MedicalDataDetails.fromJson(Map<String, dynamic> json) =>
      _$$_MedicalDataDetailsFromJson(json);

  @override
  @JsonKey(name: 'ValueString')
  final String? valueString;
  @override
  @JsonKey(name: 'ClinicalStatus')
  final MedicalDataClinicalStatus? clinicalStatus;
  @override
  @JsonKey(name: 'Category')
  final MedicalDataCategory? category;
  @override
  @JsonKey(name: 'MedicationCodeableConcept')
  final MedicationCodeableConcept? medicationCodeableConcept;

  @override
  String toString() {
    return 'MedicalDataDetails(valueString: $valueString, clinicalStatus: $clinicalStatus, category: $category, medicationCodeableConcept: $medicationCodeableConcept)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MedicalDataDetails &&
            const DeepCollectionEquality()
                .equals(other.valueString, valueString) &&
            const DeepCollectionEquality()
                .equals(other.clinicalStatus, clinicalStatus) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(
                other.medicationCodeableConcept, medicationCodeableConcept));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(valueString),
      const DeepCollectionEquality().hash(clinicalStatus),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(medicationCodeableConcept));

  @JsonKey(ignore: true)
  @override
  _$MedicalDataDetailsCopyWith<_MedicalDataDetails> get copyWith =>
      __$MedicalDataDetailsCopyWithImpl<_MedicalDataDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicalDataDetailsToJson(this);
  }
}

abstract class _MedicalDataDetails implements MedicalDataDetails {
  factory _MedicalDataDetails(
          {@JsonKey(name: 'ValueString')
              String? valueString,
          @JsonKey(name: 'ClinicalStatus')
              MedicalDataClinicalStatus? clinicalStatus,
          @JsonKey(name: 'Category')
              MedicalDataCategory? category,
          @JsonKey(name: 'MedicationCodeableConcept')
              MedicationCodeableConcept? medicationCodeableConcept}) =
      _$_MedicalDataDetails;

  factory _MedicalDataDetails.fromJson(Map<String, dynamic> json) =
      _$_MedicalDataDetails.fromJson;

  @override
  @JsonKey(name: 'ValueString')
  String? get valueString;
  @override
  @JsonKey(name: 'ClinicalStatus')
  MedicalDataClinicalStatus? get clinicalStatus;
  @override
  @JsonKey(name: 'Category')
  MedicalDataCategory? get category;
  @override
  @JsonKey(name: 'MedicationCodeableConcept')
  MedicationCodeableConcept? get medicationCodeableConcept;
  @override
  @JsonKey(ignore: true)
  _$MedicalDataDetailsCopyWith<_MedicalDataDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
