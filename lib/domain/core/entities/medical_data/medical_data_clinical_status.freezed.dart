// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medical_data_clinical_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicalDataClinicalStatus _$MedicalDataClinicalStatusFromJson(
    Map<String, dynamic> json) {
  return _MedicalDataClinicalStatus.fromJson(json);
}

/// @nodoc
class _$MedicalDataClinicalStatusTearOff {
  const _$MedicalDataClinicalStatusTearOff();

  _MedicalDataClinicalStatus call({@JsonKey(name: 'Text') String? text}) {
    return _MedicalDataClinicalStatus(
      text: text,
    );
  }

  MedicalDataClinicalStatus fromJson(Map<String, Object?> json) {
    return MedicalDataClinicalStatus.fromJson(json);
  }
}

/// @nodoc
const $MedicalDataClinicalStatus = _$MedicalDataClinicalStatusTearOff();

/// @nodoc
mixin _$MedicalDataClinicalStatus {
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicalDataClinicalStatusCopyWith<MedicalDataClinicalStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalDataClinicalStatusCopyWith<$Res> {
  factory $MedicalDataClinicalStatusCopyWith(MedicalDataClinicalStatus value,
          $Res Function(MedicalDataClinicalStatus) then) =
      _$MedicalDataClinicalStatusCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class _$MedicalDataClinicalStatusCopyWithImpl<$Res>
    implements $MedicalDataClinicalStatusCopyWith<$Res> {
  _$MedicalDataClinicalStatusCopyWithImpl(this._value, this._then);

  final MedicalDataClinicalStatus _value;
  // ignore: unused_field
  final $Res Function(MedicalDataClinicalStatus) _then;

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
abstract class _$MedicalDataClinicalStatusCopyWith<$Res>
    implements $MedicalDataClinicalStatusCopyWith<$Res> {
  factory _$MedicalDataClinicalStatusCopyWith(_MedicalDataClinicalStatus value,
          $Res Function(_MedicalDataClinicalStatus) then) =
      __$MedicalDataClinicalStatusCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class __$MedicalDataClinicalStatusCopyWithImpl<$Res>
    extends _$MedicalDataClinicalStatusCopyWithImpl<$Res>
    implements _$MedicalDataClinicalStatusCopyWith<$Res> {
  __$MedicalDataClinicalStatusCopyWithImpl(_MedicalDataClinicalStatus _value,
      $Res Function(_MedicalDataClinicalStatus) _then)
      : super(_value, (v) => _then(v as _MedicalDataClinicalStatus));

  @override
  _MedicalDataClinicalStatus get _value =>
      super._value as _MedicalDataClinicalStatus;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_MedicalDataClinicalStatus(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicalDataClinicalStatus implements _MedicalDataClinicalStatus {
  _$_MedicalDataClinicalStatus({@JsonKey(name: 'Text') this.text});

  factory _$_MedicalDataClinicalStatus.fromJson(Map<String, dynamic> json) =>
      _$$_MedicalDataClinicalStatusFromJson(json);

  @override
  @JsonKey(name: 'Text')
  final String? text;

  @override
  String toString() {
    return 'MedicalDataClinicalStatus(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MedicalDataClinicalStatus &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$MedicalDataClinicalStatusCopyWith<_MedicalDataClinicalStatus>
      get copyWith =>
          __$MedicalDataClinicalStatusCopyWithImpl<_MedicalDataClinicalStatus>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicalDataClinicalStatusToJson(this);
  }
}

abstract class _MedicalDataClinicalStatus implements MedicalDataClinicalStatus {
  factory _MedicalDataClinicalStatus({@JsonKey(name: 'Text') String? text}) =
      _$_MedicalDataClinicalStatus;

  factory _MedicalDataClinicalStatus.fromJson(Map<String, dynamic> json) =
      _$_MedicalDataClinicalStatus.fromJson;

  @override
  @JsonKey(name: 'Text')
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$MedicalDataClinicalStatusCopyWith<_MedicalDataClinicalStatus>
      get copyWith => throw _privateConstructorUsedError;
}
