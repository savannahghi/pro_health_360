// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medical_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicalDataState _$MedicalDataStateFromJson(Map<String, dynamic> json) {
  return _MedicalDataState.fromJson(json);
}

/// @nodoc
class _$MedicalDataStateTearOff {
  const _$MedicalDataStateTearOff();

  _MedicalDataState call({MedicalData? medicalData}) {
    return _MedicalDataState(
      medicalData: medicalData,
    );
  }

  MedicalDataState fromJson(Map<String, Object?> json) {
    return MedicalDataState.fromJson(json);
  }
}

/// @nodoc
const $MedicalDataState = _$MedicalDataStateTearOff();

/// @nodoc
mixin _$MedicalDataState {
  MedicalData? get medicalData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicalDataStateCopyWith<MedicalDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalDataStateCopyWith<$Res> {
  factory $MedicalDataStateCopyWith(
          MedicalDataState value, $Res Function(MedicalDataState) then) =
      _$MedicalDataStateCopyWithImpl<$Res>;
  $Res call({MedicalData? medicalData});

  $MedicalDataCopyWith<$Res>? get medicalData;
}

/// @nodoc
class _$MedicalDataStateCopyWithImpl<$Res>
    implements $MedicalDataStateCopyWith<$Res> {
  _$MedicalDataStateCopyWithImpl(this._value, this._then);

  final MedicalDataState _value;
  // ignore: unused_field
  final $Res Function(MedicalDataState) _then;

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
abstract class _$MedicalDataStateCopyWith<$Res>
    implements $MedicalDataStateCopyWith<$Res> {
  factory _$MedicalDataStateCopyWith(
          _MedicalDataState value, $Res Function(_MedicalDataState) then) =
      __$MedicalDataStateCopyWithImpl<$Res>;
  @override
  $Res call({MedicalData? medicalData});

  @override
  $MedicalDataCopyWith<$Res>? get medicalData;
}

/// @nodoc
class __$MedicalDataStateCopyWithImpl<$Res>
    extends _$MedicalDataStateCopyWithImpl<$Res>
    implements _$MedicalDataStateCopyWith<$Res> {
  __$MedicalDataStateCopyWithImpl(
      _MedicalDataState _value, $Res Function(_MedicalDataState) _then)
      : super(_value, (v) => _then(v as _MedicalDataState));

  @override
  _MedicalDataState get _value => super._value as _MedicalDataState;

  @override
  $Res call({
    Object? medicalData = freezed,
  }) {
    return _then(_MedicalDataState(
      medicalData: medicalData == freezed
          ? _value.medicalData
          : medicalData // ignore: cast_nullable_to_non_nullable
              as MedicalData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicalDataState implements _MedicalDataState {
  _$_MedicalDataState({this.medicalData});

  factory _$_MedicalDataState.fromJson(Map<String, dynamic> json) =>
      _$$_MedicalDataStateFromJson(json);

  @override
  final MedicalData? medicalData;

  @override
  String toString() {
    return 'MedicalDataState(medicalData: $medicalData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MedicalDataState &&
            const DeepCollectionEquality()
                .equals(other.medicalData, medicalData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(medicalData));

  @JsonKey(ignore: true)
  @override
  _$MedicalDataStateCopyWith<_MedicalDataState> get copyWith =>
      __$MedicalDataStateCopyWithImpl<_MedicalDataState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicalDataStateToJson(this);
  }
}

abstract class _MedicalDataState implements MedicalDataState {
  factory _MedicalDataState({MedicalData? medicalData}) = _$_MedicalDataState;

  factory _MedicalDataState.fromJson(Map<String, dynamic> json) =
      _$_MedicalDataState.fromJson;

  @override
  MedicalData? get medicalData;
  @override
  @JsonKey(ignore: true)
  _$MedicalDataStateCopyWith<_MedicalDataState> get copyWith =>
      throw _privateConstructorUsedError;
}
