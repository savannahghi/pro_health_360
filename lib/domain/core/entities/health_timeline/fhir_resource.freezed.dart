// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fhir_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FhirResource _$FhirResourceFromJson(Map<String, dynamic> json) {
  switch (json['resourceType']) {
    case 'Observation':
      return Observation.fromJson(json);
    case 'AllergyIntolerance':
      return AllergyIntolerance.fromJson(json);
    case 'MedicationStatement':
      return MedicationStatement.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'resourceType', 'FhirResource',
          'Invalid union type "${json['resourceType']}"!');
  }
}

/// @nodoc
mixin _$FhirResource {
  @JsonKey(name: 'code')
  CodeableConcept? get code => throw _privateConstructorUsedError; // distinct
  @JsonKey(name: 'resourceType')
  ReferenceType? get resourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'timelineDate')
  String? get timelineDate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)
        observation,
    required TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)
        allergyIntolerance,
    required TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)
        medicationStatement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)?
        observation,
    TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)?
        allergyIntolerance,
    TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)?
        medicationStatement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)?
        observation,
    TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)?
        allergyIntolerance,
    TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)?
        medicationStatement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Observation value) observation,
    required TResult Function(AllergyIntolerance value) allergyIntolerance,
    required TResult Function(MedicationStatement value) medicationStatement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(AllergyIntolerance value)? allergyIntolerance,
    TResult Function(MedicationStatement value)? medicationStatement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(AllergyIntolerance value)? allergyIntolerance,
    TResult Function(MedicationStatement value)? medicationStatement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FhirResourceCopyWith<FhirResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FhirResourceCopyWith<$Res> {
  factory $FhirResourceCopyWith(
          FhirResource value, $Res Function(FhirResource) then) =
      _$FhirResourceCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'code') CodeableConcept? code,
      @JsonKey(name: 'resourceType') ReferenceType? resourceType,
      @JsonKey(name: 'timelineDate') String? timelineDate});

  $CodeableConceptCopyWith<$Res>? get code;
}

/// @nodoc
class _$FhirResourceCopyWithImpl<$Res> implements $FhirResourceCopyWith<$Res> {
  _$FhirResourceCopyWithImpl(this._value, this._then);

  final FhirResource _value;
  // ignore: unused_field
  final $Res Function(FhirResource) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? resourceType = freezed,
    Object? timelineDate = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ReferenceType?,
      timelineDate: timelineDate == freezed
          ? _value.timelineDate
          : timelineDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get code {
    if (_value.code == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.code!, (value) {
      return _then(_value.copyWith(code: value));
    });
  }
}

/// @nodoc
abstract class _$$ObservationCopyWith<$Res>
    implements $FhirResourceCopyWith<$Res> {
  factory _$$ObservationCopyWith(
          _$Observation value, $Res Function(_$Observation) then) =
      __$$ObservationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'category')
          List<CodeableConcept>? category,
      @JsonKey(name: 'code')
          CodeableConcept? code,
      @JsonKey(name: 'effectiveInstant')
          String? date,
      @JsonKey(name: 'resourceType')
          ReferenceType? resourceType,
      @JsonKey(name: 'status', fromJson: observationStatusFromJson)
          ObservationStatus? status,
      @JsonKey(name: 'subject')
          Reference? patient,
      @JsonKey(name: 'timelineDate')
          String? timelineDate,
      @JsonKey(name: 'valueString')
          String? value});

  @override
  $CodeableConceptCopyWith<$Res>? get code;
  $ReferenceCopyWith<$Res>? get patient;
}

/// @nodoc
class __$$ObservationCopyWithImpl<$Res> extends _$FhirResourceCopyWithImpl<$Res>
    implements _$$ObservationCopyWith<$Res> {
  __$$ObservationCopyWithImpl(
      _$Observation _value, $Res Function(_$Observation) _then)
      : super(_value, (v) => _then(v as _$Observation));

  @override
  _$Observation get _value => super._value as _$Observation;

  @override
  $Res call({
    Object? category = freezed,
    Object? code = freezed,
    Object? date = freezed,
    Object? resourceType = freezed,
    Object? status = freezed,
    Object? patient = freezed,
    Object? timelineDate = freezed,
    Object? value = freezed,
  }) {
    return _then(_$Observation(
      category: category == freezed
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept>?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ReferenceType?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ObservationStatus?,
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Reference?,
      timelineDate: timelineDate == freezed
          ? _value.timelineDate
          : timelineDate // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ReferenceCopyWith<$Res>? get patient {
    if (_value.patient == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.patient!, (value) {
      return _then(_value.copyWith(patient: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$Observation with DiagnosticableTreeMixin implements Observation {
  const _$Observation(
      {@JsonKey(name: 'category') final List<CodeableConcept>? category,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'effectiveInstant') this.date,
      @JsonKey(name: 'resourceType') this.resourceType,
      @JsonKey(name: 'status', fromJson: observationStatusFromJson) this.status,
      @JsonKey(name: 'subject') this.patient,
      @JsonKey(name: 'timelineDate') this.timelineDate,
      @JsonKey(name: 'valueString') this.value})
      : _category = category;

  factory _$Observation.fromJson(Map<String, dynamic> json) =>
      _$$ObservationFromJson(json);

  final List<CodeableConcept>? _category;
  @override
  @JsonKey(name: 'category')
  List<CodeableConcept>? get category {
    final value = _category;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'code')
  final CodeableConcept? code;
  @override
  @JsonKey(name: 'effectiveInstant')
  final String? date;
// distinct
  @override
  @JsonKey(name: 'resourceType')
  final ReferenceType? resourceType;
  @override
  @JsonKey(name: 'status', fromJson: observationStatusFromJson)
  final ObservationStatus? status;
  @override
  @JsonKey(name: 'subject')
  final Reference? patient;
  @override
  @JsonKey(name: 'timelineDate')
  final String? timelineDate;
  @override
  @JsonKey(name: 'valueString')
  final String? value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FhirResource.observation(category: $category, code: $code, date: $date, resourceType: $resourceType, status: $status, patient: $patient, timelineDate: $timelineDate, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FhirResource.observation'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('resourceType', resourceType))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('patient', patient))
      ..add(DiagnosticsProperty('timelineDate', timelineDate))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Observation &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.resourceType, resourceType) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.patient, patient) &&
            const DeepCollectionEquality()
                .equals(other.timelineDate, timelineDate) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_category),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(resourceType),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(patient),
      const DeepCollectionEquality().hash(timelineDate),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$ObservationCopyWith<_$Observation> get copyWith =>
      __$$ObservationCopyWithImpl<_$Observation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)
        observation,
    required TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)
        allergyIntolerance,
    required TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)
        medicationStatement,
  }) {
    return observation(category, code, date, resourceType, status, patient,
        timelineDate, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)?
        observation,
    TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)?
        allergyIntolerance,
    TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)?
        medicationStatement,
  }) {
    return observation?.call(category, code, date, resourceType, status,
        patient, timelineDate, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)?
        observation,
    TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)?
        allergyIntolerance,
    TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)?
        medicationStatement,
    required TResult orElse(),
  }) {
    if (observation != null) {
      return observation(category, code, date, resourceType, status, patient,
          timelineDate, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Observation value) observation,
    required TResult Function(AllergyIntolerance value) allergyIntolerance,
    required TResult Function(MedicationStatement value) medicationStatement,
  }) {
    return observation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(AllergyIntolerance value)? allergyIntolerance,
    TResult Function(MedicationStatement value)? medicationStatement,
  }) {
    return observation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(AllergyIntolerance value)? allergyIntolerance,
    TResult Function(MedicationStatement value)? medicationStatement,
    required TResult orElse(),
  }) {
    if (observation != null) {
      return observation(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ObservationToJson(this);
  }
}

abstract class Observation implements FhirResource, Resource {
  const factory Observation(
      {@JsonKey(name: 'category')
          final List<CodeableConcept>? category,
      @JsonKey(name: 'code')
          final CodeableConcept? code,
      @JsonKey(name: 'effectiveInstant')
          final String? date,
      @JsonKey(name: 'resourceType')
          final ReferenceType? resourceType,
      @JsonKey(name: 'status', fromJson: observationStatusFromJson)
          final ObservationStatus? status,
      @JsonKey(name: 'subject')
          final Reference? patient,
      @JsonKey(name: 'timelineDate')
          final String? timelineDate,
      @JsonKey(name: 'valueString')
          final String? value}) = _$Observation;

  factory Observation.fromJson(Map<String, dynamic> json) =
      _$Observation.fromJson;

  @JsonKey(name: 'category')
  List<CodeableConcept>? get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'code')
  CodeableConcept? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'effectiveInstant')
  String? get date => throw _privateConstructorUsedError;
  @override // distinct
  @JsonKey(name: 'resourceType')
  ReferenceType? get resourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', fromJson: observationStatusFromJson)
  ObservationStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject')
  Reference? get patient => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'timelineDate')
  String? get timelineDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'valueString')
  String? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$ObservationCopyWith<_$Observation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AllergyIntoleranceCopyWith<$Res>
    implements $FhirResourceCopyWith<$Res> {
  factory _$$AllergyIntoleranceCopyWith(_$AllergyIntolerance value,
          $Res Function(_$AllergyIntolerance) then) =
      __$$AllergyIntoleranceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'category')
          List<AllergyIntoleranceCategory>? category,
      @JsonKey(name: 'clinicalStatus')
          CodeableConcept? clinicalStatus,
      @JsonKey(name: 'code')
          CodeableConcept? code,
      @JsonKey(name: 'patient')
          Reference? patient,
      @JsonKey(name: 'reaction')
          List<Reaction>? reaction,
      @JsonKey(name: 'recordedDate')
          String? recordedDate,
      @JsonKey(name: 'resourceType')
          ReferenceType? resourceType,
      @JsonKey(name: 'timelineDate')
          String? timelineDate,
      @JsonKey(name: 'type')
          AllergyIntoleranceType? type,
      @JsonKey(name: 'verificationStatus')
          CodeableConcept? verificationStatus});

  $CodeableConceptCopyWith<$Res>? get clinicalStatus;
  @override
  $CodeableConceptCopyWith<$Res>? get code;
  $ReferenceCopyWith<$Res>? get patient;
  $CodeableConceptCopyWith<$Res>? get verificationStatus;
}

/// @nodoc
class __$$AllergyIntoleranceCopyWithImpl<$Res>
    extends _$FhirResourceCopyWithImpl<$Res>
    implements _$$AllergyIntoleranceCopyWith<$Res> {
  __$$AllergyIntoleranceCopyWithImpl(
      _$AllergyIntolerance _value, $Res Function(_$AllergyIntolerance) _then)
      : super(_value, (v) => _then(v as _$AllergyIntolerance));

  @override
  _$AllergyIntolerance get _value => super._value as _$AllergyIntolerance;

  @override
  $Res call({
    Object? category = freezed,
    Object? clinicalStatus = freezed,
    Object? code = freezed,
    Object? patient = freezed,
    Object? reaction = freezed,
    Object? recordedDate = freezed,
    Object? resourceType = freezed,
    Object? timelineDate = freezed,
    Object? type = freezed,
    Object? verificationStatus = freezed,
  }) {
    return _then(_$AllergyIntolerance(
      category: category == freezed
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<AllergyIntoleranceCategory>?,
      clinicalStatus: clinicalStatus == freezed
          ? _value.clinicalStatus
          : clinicalStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Reference?,
      reaction: reaction == freezed
          ? _value._reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as List<Reaction>?,
      recordedDate: recordedDate == freezed
          ? _value.recordedDate
          : recordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ReferenceType?,
      timelineDate: timelineDate == freezed
          ? _value.timelineDate
          : timelineDate // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceType?,
      verificationStatus: verificationStatus == freezed
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get clinicalStatus {
    if (_value.clinicalStatus == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.clinicalStatus!, (value) {
      return _then(_value.copyWith(clinicalStatus: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get patient {
    if (_value.patient == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.patient!, (value) {
      return _then(_value.copyWith(patient: value));
    });
  }

  @override
  $CodeableConceptCopyWith<$Res>? get verificationStatus {
    if (_value.verificationStatus == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.verificationStatus!, (value) {
      return _then(_value.copyWith(verificationStatus: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$AllergyIntolerance
    with DiagnosticableTreeMixin
    implements AllergyIntolerance {
  const _$AllergyIntolerance(
      {@JsonKey(name: 'category')
          final List<AllergyIntoleranceCategory>? category,
      @JsonKey(name: 'clinicalStatus')
          this.clinicalStatus,
      @JsonKey(name: 'code')
          this.code,
      @JsonKey(name: 'patient')
          this.patient,
      @JsonKey(name: 'reaction')
          final List<Reaction>? reaction,
      @JsonKey(name: 'recordedDate')
          this.recordedDate,
      @JsonKey(name: 'resourceType')
          this.resourceType,
      @JsonKey(name: 'timelineDate')
          this.timelineDate,
      @JsonKey(name: 'type')
          this.type,
      @JsonKey(name: 'verificationStatus')
          this.verificationStatus})
      : _category = category,
        _reaction = reaction;

  factory _$AllergyIntolerance.fromJson(Map<String, dynamic> json) =>
      _$$AllergyIntoleranceFromJson(json);

  final List<AllergyIntoleranceCategory>? _category;
  @override
  @JsonKey(name: 'category')
  List<AllergyIntoleranceCategory>? get category {
    final value = _category;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'clinicalStatus')
  final CodeableConcept? clinicalStatus;
  @override
  @JsonKey(name: 'code')
  final CodeableConcept? code;
  @override
  @JsonKey(name: 'patient')
  final Reference? patient;
  final List<Reaction>? _reaction;
  @override
  @JsonKey(name: 'reaction')
  List<Reaction>? get reaction {
    final value = _reaction;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'recordedDate')
  final String? recordedDate;
  @override
  @JsonKey(name: 'resourceType')
  final ReferenceType? resourceType;
  @override
  @JsonKey(name: 'timelineDate')
  final String? timelineDate;
  @override
  @JsonKey(name: 'type')
  final AllergyIntoleranceType? type;
  @override
  @JsonKey(name: 'verificationStatus')
  final CodeableConcept? verificationStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FhirResource.allergyIntolerance(category: $category, clinicalStatus: $clinicalStatus, code: $code, patient: $patient, reaction: $reaction, recordedDate: $recordedDate, resourceType: $resourceType, timelineDate: $timelineDate, type: $type, verificationStatus: $verificationStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FhirResource.allergyIntolerance'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('clinicalStatus', clinicalStatus))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('patient', patient))
      ..add(DiagnosticsProperty('reaction', reaction))
      ..add(DiagnosticsProperty('recordedDate', recordedDate))
      ..add(DiagnosticsProperty('resourceType', resourceType))
      ..add(DiagnosticsProperty('timelineDate', timelineDate))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('verificationStatus', verificationStatus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllergyIntolerance &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            const DeepCollectionEquality()
                .equals(other.clinicalStatus, clinicalStatus) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.patient, patient) &&
            const DeepCollectionEquality().equals(other._reaction, _reaction) &&
            const DeepCollectionEquality()
                .equals(other.recordedDate, recordedDate) &&
            const DeepCollectionEquality()
                .equals(other.resourceType, resourceType) &&
            const DeepCollectionEquality()
                .equals(other.timelineDate, timelineDate) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.verificationStatus, verificationStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_category),
      const DeepCollectionEquality().hash(clinicalStatus),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(patient),
      const DeepCollectionEquality().hash(_reaction),
      const DeepCollectionEquality().hash(recordedDate),
      const DeepCollectionEquality().hash(resourceType),
      const DeepCollectionEquality().hash(timelineDate),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(verificationStatus));

  @JsonKey(ignore: true)
  @override
  _$$AllergyIntoleranceCopyWith<_$AllergyIntolerance> get copyWith =>
      __$$AllergyIntoleranceCopyWithImpl<_$AllergyIntolerance>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)
        observation,
    required TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)
        allergyIntolerance,
    required TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)
        medicationStatement,
  }) {
    return allergyIntolerance(category, clinicalStatus, code, patient, reaction,
        recordedDate, resourceType, timelineDate, type, verificationStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)?
        observation,
    TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)?
        allergyIntolerance,
    TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)?
        medicationStatement,
  }) {
    return allergyIntolerance?.call(
        category,
        clinicalStatus,
        code,
        patient,
        reaction,
        recordedDate,
        resourceType,
        timelineDate,
        type,
        verificationStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)?
        observation,
    TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)?
        allergyIntolerance,
    TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)?
        medicationStatement,
    required TResult orElse(),
  }) {
    if (allergyIntolerance != null) {
      return allergyIntolerance(
          category,
          clinicalStatus,
          code,
          patient,
          reaction,
          recordedDate,
          resourceType,
          timelineDate,
          type,
          verificationStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Observation value) observation,
    required TResult Function(AllergyIntolerance value) allergyIntolerance,
    required TResult Function(MedicationStatement value) medicationStatement,
  }) {
    return allergyIntolerance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(AllergyIntolerance value)? allergyIntolerance,
    TResult Function(MedicationStatement value)? medicationStatement,
  }) {
    return allergyIntolerance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(AllergyIntolerance value)? allergyIntolerance,
    TResult Function(MedicationStatement value)? medicationStatement,
    required TResult orElse(),
  }) {
    if (allergyIntolerance != null) {
      return allergyIntolerance(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AllergyIntoleranceToJson(this);
  }
}

abstract class AllergyIntolerance implements FhirResource, Resource {
  const factory AllergyIntolerance(
      {@JsonKey(name: 'category')
          final List<AllergyIntoleranceCategory>? category,
      @JsonKey(name: 'clinicalStatus')
          final CodeableConcept? clinicalStatus,
      @JsonKey(name: 'code')
          final CodeableConcept? code,
      @JsonKey(name: 'patient')
          final Reference? patient,
      @JsonKey(name: 'reaction')
          final List<Reaction>? reaction,
      @JsonKey(name: 'recordedDate')
          final String? recordedDate,
      @JsonKey(name: 'resourceType')
          final ReferenceType? resourceType,
      @JsonKey(name: 'timelineDate')
          final String? timelineDate,
      @JsonKey(name: 'type')
          final AllergyIntoleranceType? type,
      @JsonKey(name: 'verificationStatus')
          final CodeableConcept? verificationStatus}) = _$AllergyIntolerance;

  factory AllergyIntolerance.fromJson(Map<String, dynamic> json) =
      _$AllergyIntolerance.fromJson;

  @JsonKey(name: 'category')
  List<AllergyIntoleranceCategory>? get category =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'clinicalStatus')
  CodeableConcept? get clinicalStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'code')
  CodeableConcept? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient')
  Reference? get patient => throw _privateConstructorUsedError;
  @JsonKey(name: 'reaction')
  List<Reaction>? get reaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'recordedDate')
  String? get recordedDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'resourceType')
  ReferenceType? get resourceType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'timelineDate')
  String? get timelineDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  AllergyIntoleranceType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'verificationStatus')
  CodeableConcept? get verificationStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$AllergyIntoleranceCopyWith<_$AllergyIntolerance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MedicationStatementCopyWith<$Res>
    implements $FhirResourceCopyWith<$Res> {
  factory _$$MedicationStatementCopyWith(_$MedicationStatement value,
          $Res Function(_$MedicationStatement) then) =
      __$$MedicationStatementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'category')
          CodeableConcept? category,
      @JsonKey(name: 'code')
          CodeableConcept? code,
      @JsonKey(name: 'effectiveDateTime')
          String? date,
      @JsonKey(name: 'medicationCodeableConcept')
          CodeableConcept? medication,
      @JsonKey(name: 'resourceType')
          ReferenceType? resourceType,
      @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
          MedicationStatusCodes? status,
      @JsonKey(name: 'subject')
          Reference? subject,
      @JsonKey(name: 'timelineDate')
          String? timelineDate});

  $CodeableConceptCopyWith<$Res>? get category;
  @override
  $CodeableConceptCopyWith<$Res>? get code;
  $CodeableConceptCopyWith<$Res>? get medication;
  $ReferenceCopyWith<$Res>? get subject;
}

/// @nodoc
class __$$MedicationStatementCopyWithImpl<$Res>
    extends _$FhirResourceCopyWithImpl<$Res>
    implements _$$MedicationStatementCopyWith<$Res> {
  __$$MedicationStatementCopyWithImpl(
      _$MedicationStatement _value, $Res Function(_$MedicationStatement) _then)
      : super(_value, (v) => _then(v as _$MedicationStatement));

  @override
  _$MedicationStatement get _value => super._value as _$MedicationStatement;

  @override
  $Res call({
    Object? category = freezed,
    Object? code = freezed,
    Object? date = freezed,
    Object? medication = freezed,
    Object? resourceType = freezed,
    Object? status = freezed,
    Object? subject = freezed,
    Object? timelineDate = freezed,
  }) {
    return _then(_$MedicationStatement(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      medication: medication == freezed
          ? _value.medication
          : medication // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ReferenceType?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MedicationStatusCodes?,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      timelineDate: timelineDate == freezed
          ? _value.timelineDate
          : timelineDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
    });
  }

  @override
  $CodeableConceptCopyWith<$Res>? get medication {
    if (_value.medication == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.medication!, (value) {
      return _then(_value.copyWith(medication: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicationStatement
    with DiagnosticableTreeMixin
    implements MedicationStatement {
  const _$MedicationStatement(
      {@JsonKey(name: 'category')
          this.category,
      @JsonKey(name: 'code')
          this.code,
      @JsonKey(name: 'effectiveDateTime')
          this.date,
      @JsonKey(name: 'medicationCodeableConcept')
          this.medication,
      @JsonKey(name: 'resourceType')
          this.resourceType,
      @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
          this.status,
      @JsonKey(name: 'subject')
          this.subject,
      @JsonKey(name: 'timelineDate')
          this.timelineDate});

  factory _$MedicationStatement.fromJson(Map<String, dynamic> json) =>
      _$$MedicationStatementFromJson(json);

  @override
  @JsonKey(name: 'category')
  final CodeableConcept? category;
  @override
  @JsonKey(name: 'code')
  final CodeableConcept? code;
  @override
  @JsonKey(name: 'effectiveDateTime')
  final String? date;
  @override
  @JsonKey(name: 'medicationCodeableConcept')
  final CodeableConcept? medication;
  @override
  @JsonKey(name: 'resourceType')
  final ReferenceType? resourceType;
  @override
  @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
  final MedicationStatusCodes? status;
  @override
  @JsonKey(name: 'subject')
  final Reference? subject;
  @override
  @JsonKey(name: 'timelineDate')
  final String? timelineDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FhirResource.medicationStatement(category: $category, code: $code, date: $date, medication: $medication, resourceType: $resourceType, status: $status, subject: $subject, timelineDate: $timelineDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FhirResource.medicationStatement'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('medication', medication))
      ..add(DiagnosticsProperty('resourceType', resourceType))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('subject', subject))
      ..add(DiagnosticsProperty('timelineDate', timelineDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationStatement &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.medication, medication) &&
            const DeepCollectionEquality()
                .equals(other.resourceType, resourceType) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.subject, subject) &&
            const DeepCollectionEquality()
                .equals(other.timelineDate, timelineDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(medication),
      const DeepCollectionEquality().hash(resourceType),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(subject),
      const DeepCollectionEquality().hash(timelineDate));

  @JsonKey(ignore: true)
  @override
  _$$MedicationStatementCopyWith<_$MedicationStatement> get copyWith =>
      __$$MedicationStatementCopyWithImpl<_$MedicationStatement>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)
        observation,
    required TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)
        allergyIntolerance,
    required TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)
        medicationStatement,
  }) {
    return medicationStatement(category, code, date, medication, resourceType,
        status, subject, timelineDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)?
        observation,
    TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)?
        allergyIntolerance,
    TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)?
        medicationStatement,
  }) {
    return medicationStatement?.call(category, code, date, medication,
        resourceType, status, subject, timelineDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveInstant')
                String? date,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: observationStatusFromJson)
                ObservationStatus? status,
            @JsonKey(name: 'subject')
                Reference? patient,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'valueString')
                String? value)?
        observation,
    TResult Function(
            @JsonKey(name: 'category')
                List<AllergyIntoleranceCategory>? category,
            @JsonKey(name: 'clinicalStatus')
                CodeableConcept? clinicalStatus,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'patient')
                Reference? patient,
            @JsonKey(name: 'reaction')
                List<Reaction>? reaction,
            @JsonKey(name: 'recordedDate')
                String? recordedDate,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'timelineDate')
                String? timelineDate,
            @JsonKey(name: 'type')
                AllergyIntoleranceType? type,
            @JsonKey(name: 'verificationStatus')
                CodeableConcept? verificationStatus)?
        allergyIntolerance,
    TResult Function(
            @JsonKey(name: 'category')
                CodeableConcept? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
                String? date,
            @JsonKey(name: 'medicationCodeableConcept')
                CodeableConcept? medication,
            @JsonKey(name: 'resourceType')
                ReferenceType? resourceType,
            @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
                MedicationStatusCodes? status,
            @JsonKey(name: 'subject')
                Reference? subject,
            @JsonKey(name: 'timelineDate')
                String? timelineDate)?
        medicationStatement,
    required TResult orElse(),
  }) {
    if (medicationStatement != null) {
      return medicationStatement(category, code, date, medication, resourceType,
          status, subject, timelineDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Observation value) observation,
    required TResult Function(AllergyIntolerance value) allergyIntolerance,
    required TResult Function(MedicationStatement value) medicationStatement,
  }) {
    return medicationStatement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(AllergyIntolerance value)? allergyIntolerance,
    TResult Function(MedicationStatement value)? medicationStatement,
  }) {
    return medicationStatement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(AllergyIntolerance value)? allergyIntolerance,
    TResult Function(MedicationStatement value)? medicationStatement,
    required TResult orElse(),
  }) {
    if (medicationStatement != null) {
      return medicationStatement(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationStatementToJson(this);
  }
}

abstract class MedicationStatement implements FhirResource, Resource {
  const factory MedicationStatement(
      {@JsonKey(name: 'category')
          final CodeableConcept? category,
      @JsonKey(name: 'code')
          final CodeableConcept? code,
      @JsonKey(name: 'effectiveDateTime')
          final String? date,
      @JsonKey(name: 'medicationCodeableConcept')
          final CodeableConcept? medication,
      @JsonKey(name: 'resourceType')
          final ReferenceType? resourceType,
      @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
          final MedicationStatusCodes? status,
      @JsonKey(name: 'subject')
          final Reference? subject,
      @JsonKey(name: 'timelineDate')
          final String? timelineDate}) = _$MedicationStatement;

  factory MedicationStatement.fromJson(Map<String, dynamic> json) =
      _$MedicationStatement.fromJson;

  @JsonKey(name: 'category')
  CodeableConcept? get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'code')
  CodeableConcept? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'effectiveDateTime')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'medicationCodeableConcept')
  CodeableConcept? get medication => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'resourceType')
  ReferenceType? get resourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', fromJson: medicationStatusCodesFromJson)
  MedicationStatusCodes? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject')
  Reference? get subject => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'timelineDate')
  String? get timelineDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$MedicationStatementCopyWith<_$MedicationStatement> get copyWith =>
      throw _privateConstructorUsedError;
}
