// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medical_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicalDataResponse _$MedicalDataResponseFromJson(Map<String, dynamic> json) {
  return _MedicalDataResponse.fromJson(json);
}

/// @nodoc
mixin _$MedicalDataResponse {
  @JsonKey(name: 'getMedicalData')
  MedicalData? get medicalData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicalDataResponseCopyWith<MedicalDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalDataResponseCopyWith<$Res> {
  factory $MedicalDataResponseCopyWith(
          MedicalDataResponse value, $Res Function(MedicalDataResponse) then) =
      _$MedicalDataResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'getMedicalData') MedicalData? medicalData});

  $MedicalDataCopyWith<$Res>? get medicalData;
}

/// @nodoc
class _$MedicalDataResponseCopyWithImpl<$Res>
    implements $MedicalDataResponseCopyWith<$Res> {
  _$MedicalDataResponseCopyWithImpl(this._value, this._then);

  final MedicalDataResponse _value;
  // ignore: unused_field
  final $Res Function(MedicalDataResponse) _then;

  @override
  $Res call({
    Object? medicalData = freezed,
  }) {
    return _then(_value.copyWith(
      medicalData: medicalData == freezed
          ? _value.medicalData
          : medicalData // ignore: cast_nullable_to_non_nullable
              as MedicalData?,
    ));
  }

  @override
  $MedicalDataCopyWith<$Res>? get medicalData {
    if (_value.medicalData == null) {
      return null;
    }

    return $MedicalDataCopyWith<$Res>(_value.medicalData!, (value) {
      return _then(_value.copyWith(medicalData: value));
    });
  }
}

/// @nodoc
abstract class _$$_MedicalDataResponseCopyWith<$Res>
    implements $MedicalDataResponseCopyWith<$Res> {
  factory _$$_MedicalDataResponseCopyWith(_$_MedicalDataResponse value,
          $Res Function(_$_MedicalDataResponse) then) =
      __$$_MedicalDataResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'getMedicalData') MedicalData? medicalData});

  @override
  $MedicalDataCopyWith<$Res>? get medicalData;
}

/// @nodoc
class __$$_MedicalDataResponseCopyWithImpl<$Res>
    extends _$MedicalDataResponseCopyWithImpl<$Res>
    implements _$$_MedicalDataResponseCopyWith<$Res> {
  __$$_MedicalDataResponseCopyWithImpl(_$_MedicalDataResponse _value,
      $Res Function(_$_MedicalDataResponse) _then)
      : super(_value, (v) => _then(v as _$_MedicalDataResponse));

  @override
  _$_MedicalDataResponse get _value => super._value as _$_MedicalDataResponse;

  @override
  $Res call({
    Object? medicalData = freezed,
  }) {
    return _then(_$_MedicalDataResponse(
      medicalData: medicalData == freezed
          ? _value.medicalData
          : medicalData // ignore: cast_nullable_to_non_nullable
              as MedicalData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicalDataResponse implements _MedicalDataResponse {
  _$_MedicalDataResponse({@JsonKey(name: 'getMedicalData') this.medicalData});

  factory _$_MedicalDataResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MedicalDataResponseFromJson(json);

  @override
  @JsonKey(name: 'getMedicalData')
  final MedicalData? medicalData;

  @override
  String toString() {
    return 'MedicalDataResponse(medicalData: $medicalData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicalDataResponse &&
            const DeepCollectionEquality()
                .equals(other.medicalData, medicalData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(medicalData));

  @JsonKey(ignore: true)
  @override
  _$$_MedicalDataResponseCopyWith<_$_MedicalDataResponse> get copyWith =>
      __$$_MedicalDataResponseCopyWithImpl<_$_MedicalDataResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicalDataResponseToJson(this);
  }
}

abstract class _MedicalDataResponse implements MedicalDataResponse {
  factory _MedicalDataResponse(
          {@JsonKey(name: 'getMedicalData') final MedicalData? medicalData}) =
      _$_MedicalDataResponse;

  factory _MedicalDataResponse.fromJson(Map<String, dynamic> json) =
      _$_MedicalDataResponse.fromJson;

  @override
  @JsonKey(name: 'getMedicalData')
  MedicalData? get medicalData;
  @override
  @JsonKey(ignore: true)
  _$$_MedicalDataResponseCopyWith<_$_MedicalDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
