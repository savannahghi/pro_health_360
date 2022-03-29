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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FhirResource _$FhirResourceFromJson(Map<String, dynamic> json) {
  switch (json['resourceType']) {
    case 'Observation':
      return Observation.fromJson(json);
    case 'AllergyIntolerance':
      return Medication.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'resourceType', 'FhirResource',
          'Invalid union type "${json['resourceType']}"!');
  }
}

/// @nodoc
class _$FhirResourceTearOff {
  const _$FhirResourceTearOff();

  Observation observation(
      {@JsonKey(name: 'category')
          List<CodeableConcept>? category,
      @JsonKey(name: 'code')
          CodeableConcept? code,
      @JsonKey(name: 'effectiveDateTime')
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
          String? value}) {
    return Observation(
      category: category,
      code: code,
      date: date,
      resourceType: resourceType,
      status: status,
      patient: patient,
      timelineDate: timelineDate,
      value: value,
    );
  }

  Medication medication(
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
          CodeableConcept? verificationStatus}) {
    return Medication(
      category: category,
      clinicalStatus: clinicalStatus,
      code: code,
      patient: patient,
      reaction: reaction,
      recordedDate: recordedDate,
      resourceType: resourceType,
      timelineDate: timelineDate,
      type: type,
      verificationStatus: verificationStatus,
    );
  }

  FhirResource fromJson(Map<String, Object?> json) {
    return FhirResource.fromJson(json);
  }
}

/// @nodoc
const $FhirResource = _$FhirResourceTearOff();

/// @nodoc
mixin _$FhirResource {
  @JsonKey(name: 'code')
  CodeableConcept? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'resourceType')
  ReferenceType? get resourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject')
  Reference? get patient => throw _privateConstructorUsedError;
  @JsonKey(name: 'timelineDate')
  String? get timelineDate => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
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
        medication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
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
        medication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
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
        medication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Observation value) observation,
    required TResult Function(Medication value) medication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(Medication value)? medication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(Medication value)? medication,
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
      @JsonKey(name: 'subject') Reference? patient,
      @JsonKey(name: 'timelineDate') String? timelineDate});

  $CodeableConceptCopyWith<$Res>? get code;
  $ReferenceCopyWith<$Res>? get patient;
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
    Object? patient = freezed,
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
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Reference?,
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
abstract class $ObservationCopyWith<$Res>
    implements $FhirResourceCopyWith<$Res> {
  factory $ObservationCopyWith(
          Observation value, $Res Function(Observation) then) =
      _$ObservationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'category')
          List<CodeableConcept>? category,
      @JsonKey(name: 'code')
          CodeableConcept? code,
      @JsonKey(name: 'effectiveDateTime')
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
  @override
  $ReferenceCopyWith<$Res>? get patient;
}

/// @nodoc
class _$ObservationCopyWithImpl<$Res> extends _$FhirResourceCopyWithImpl<$Res>
    implements $ObservationCopyWith<$Res> {
  _$ObservationCopyWithImpl(
      Observation _value, $Res Function(Observation) _then)
      : super(_value, (v) => _then(v as Observation));

  @override
  Observation get _value => super._value as Observation;

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
    return _then(Observation(
      category: category == freezed
          ? _value.category
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
}

/// @nodoc
@JsonSerializable()
@FreezedUnionValue('Observation')
@Implements<Resource>()
class _$Observation with DiagnosticableTreeMixin implements Observation {
  const _$Observation(
      {@JsonKey(name: 'category') this.category,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'effectiveDateTime') this.date,
      @JsonKey(name: 'resourceType') this.resourceType,
      @JsonKey(name: 'status', fromJson: observationStatusFromJson) this.status,
      @JsonKey(name: 'subject') this.patient,
      @JsonKey(name: 'timelineDate') this.timelineDate,
      @JsonKey(name: 'valueString') this.value});

  factory _$Observation.fromJson(Map<String, dynamic> json) =>
      _$$ObservationFromJson(json);

  @override
  @JsonKey(name: 'category')
  final List<CodeableConcept>? category;
  @override
  @JsonKey(name: 'code')
  final CodeableConcept? code;
  @override
  @JsonKey(name: 'effectiveDateTime')
  final String? date;
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
            other is Observation &&
            const DeepCollectionEquality().equals(other.category, category) &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(resourceType),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(patient),
      const DeepCollectionEquality().hash(timelineDate),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $ObservationCopyWith<Observation> get copyWith =>
      _$ObservationCopyWithImpl<Observation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
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
        medication,
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
            @JsonKey(name: 'effectiveDateTime')
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
        medication,
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
            @JsonKey(name: 'effectiveDateTime')
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
        medication,
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
    required TResult Function(Medication value) medication,
  }) {
    return observation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(Medication value)? medication,
  }) {
    return observation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(Medication value)? medication,
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
          List<CodeableConcept>? category,
      @JsonKey(name: 'code')
          CodeableConcept? code,
      @JsonKey(name: 'effectiveDateTime')
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
          String? value}) = _$Observation;

  factory Observation.fromJson(Map<String, dynamic> json) =
      _$Observation.fromJson;

  @JsonKey(name: 'category')
  List<CodeableConcept>? get category;
  @override
  @JsonKey(name: 'code')
  CodeableConcept? get code;
  @JsonKey(name: 'effectiveDateTime')
  String? get date;
  @override
  @JsonKey(name: 'resourceType')
  ReferenceType? get resourceType;
  @JsonKey(name: 'status', fromJson: observationStatusFromJson)
  ObservationStatus? get status;
  @override
  @JsonKey(name: 'subject')
  Reference? get patient;
  @override
  @JsonKey(name: 'timelineDate')
  String? get timelineDate;
  @JsonKey(name: 'valueString')
  String? get value;
  @override
  @JsonKey(ignore: true)
  $ObservationCopyWith<Observation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationCopyWith<$Res>
    implements $FhirResourceCopyWith<$Res> {
  factory $MedicationCopyWith(
          Medication value, $Res Function(Medication) then) =
      _$MedicationCopyWithImpl<$Res>;
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
  @override
  $ReferenceCopyWith<$Res>? get patient;
  $CodeableConceptCopyWith<$Res>? get verificationStatus;
}

/// @nodoc
class _$MedicationCopyWithImpl<$Res> extends _$FhirResourceCopyWithImpl<$Res>
    implements $MedicationCopyWith<$Res> {
  _$MedicationCopyWithImpl(Medication _value, $Res Function(Medication) _then)
      : super(_value, (v) => _then(v as Medication));

  @override
  Medication get _value => super._value as Medication;

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
    return _then(Medication(
      category: category == freezed
          ? _value.category
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
          ? _value.reaction
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
@FreezedUnionValue('AllergyIntolerance')
@Implements<Resource>()
class _$Medication with DiagnosticableTreeMixin implements Medication {
  const _$Medication(
      {@JsonKey(name: 'category') this.category,
      @JsonKey(name: 'clinicalStatus') this.clinicalStatus,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'patient') this.patient,
      @JsonKey(name: 'reaction') this.reaction,
      @JsonKey(name: 'recordedDate') this.recordedDate,
      @JsonKey(name: 'resourceType') this.resourceType,
      @JsonKey(name: 'timelineDate') this.timelineDate,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'verificationStatus') this.verificationStatus});

  factory _$Medication.fromJson(Map<String, dynamic> json) =>
      _$$MedicationFromJson(json);

  @override
  @JsonKey(name: 'category')
  final List<AllergyIntoleranceCategory>? category;
  @override
  @JsonKey(name: 'clinicalStatus')
  final CodeableConcept? clinicalStatus;
  @override
  @JsonKey(name: 'code')
  final CodeableConcept? code;
  @override
  @JsonKey(name: 'patient')
  final Reference? patient;
  @override
  @JsonKey(name: 'reaction')
  final List<Reaction>? reaction;
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
    return 'FhirResource.medication(category: $category, clinicalStatus: $clinicalStatus, code: $code, patient: $patient, reaction: $reaction, recordedDate: $recordedDate, resourceType: $resourceType, timelineDate: $timelineDate, type: $type, verificationStatus: $verificationStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FhirResource.medication'))
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
            other is Medication &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.clinicalStatus, clinicalStatus) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.patient, patient) &&
            const DeepCollectionEquality().equals(other.reaction, reaction) &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(clinicalStatus),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(patient),
      const DeepCollectionEquality().hash(reaction),
      const DeepCollectionEquality().hash(recordedDate),
      const DeepCollectionEquality().hash(resourceType),
      const DeepCollectionEquality().hash(timelineDate),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(verificationStatus));

  @JsonKey(ignore: true)
  @override
  $MedicationCopyWith<Medication> get copyWith =>
      _$MedicationCopyWithImpl<Medication>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
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
        medication,
  }) {
    return medication(category, clinicalStatus, code, patient, reaction,
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
            @JsonKey(name: 'effectiveDateTime')
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
        medication,
  }) {
    return medication?.call(category, clinicalStatus, code, patient, reaction,
        recordedDate, resourceType, timelineDate, type, verificationStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'category')
                List<CodeableConcept>? category,
            @JsonKey(name: 'code')
                CodeableConcept? code,
            @JsonKey(name: 'effectiveDateTime')
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
        medication,
    required TResult orElse(),
  }) {
    if (medication != null) {
      return medication(category, clinicalStatus, code, patient, reaction,
          recordedDate, resourceType, timelineDate, type, verificationStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Observation value) observation,
    required TResult Function(Medication value) medication,
  }) {
    return medication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(Medication value)? medication,
  }) {
    return medication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Observation value)? observation,
    TResult Function(Medication value)? medication,
    required TResult orElse(),
  }) {
    if (medication != null) {
      return medication(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationToJson(this);
  }
}

abstract class Medication implements FhirResource, Resource {
  const factory Medication(
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
          CodeableConcept? verificationStatus}) = _$Medication;

  factory Medication.fromJson(Map<String, dynamic> json) =
      _$Medication.fromJson;

  @JsonKey(name: 'category')
  List<AllergyIntoleranceCategory>? get category;
  @JsonKey(name: 'clinicalStatus')
  CodeableConcept? get clinicalStatus;
  @override
  @JsonKey(name: 'code')
  CodeableConcept? get code;
  @override
  @JsonKey(name: 'patient')
  Reference? get patient;
  @JsonKey(name: 'reaction')
  List<Reaction>? get reaction;
  @JsonKey(name: 'recordedDate')
  String? get recordedDate;
  @override
  @JsonKey(name: 'resourceType')
  ReferenceType? get resourceType;
  @override
  @JsonKey(name: 'timelineDate')
  String? get timelineDate;
  @JsonKey(name: 'type')
  AllergyIntoleranceType? get type;
  @JsonKey(name: 'verificationStatus')
  CodeableConcept? get verificationStatus;
  @override
  @JsonKey(ignore: true)
  $MedicationCopyWith<Medication> get copyWith =>
      throw _privateConstructorUsedError;
}
