// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medical_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicalData _$MedicalDataFromJson(Map<String, dynamic> json) {
  return _MedicalData.fromJson(json);
}

/// @nodoc
class _$MedicalDataTearOff {
  const _$MedicalDataTearOff();

  _MedicalData call(
      {@JsonKey(name: 'regimen') List<MedicalDataDetails?>? regimen,
      @JsonKey(name: 'allergies') List<MedicalDataDetails?>? allergies,
      @JsonKey(name: 'weight') List<MedicalDataDetails?>? weight,
      @JsonKey(name: 'viralLoad') List<MedicalDataDetails?>? viralLoad,
      @JsonKey(name: 'bmi') List<MedicalDataDetails?>? bmi,
      @JsonKey(name: 'cd4Count') List<MedicalDataDetails?>? cd4Count}) {
    return _MedicalData(
      regimen: regimen,
      allergies: allergies,
      weight: weight,
      viralLoad: viralLoad,
      bmi: bmi,
      cd4Count: cd4Count,
    );
  }

  MedicalData fromJson(Map<String, Object?> json) {
    return MedicalData.fromJson(json);
  }
}

/// @nodoc
const $MedicalData = _$MedicalDataTearOff();

/// @nodoc
mixin _$MedicalData {
  @JsonKey(name: 'regimen')
  List<MedicalDataDetails?>? get regimen => throw _privateConstructorUsedError;
  @JsonKey(name: 'allergies')
  List<MedicalDataDetails?>? get allergies =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'weight')
  List<MedicalDataDetails?>? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'viralLoad')
  List<MedicalDataDetails?>? get viralLoad =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'bmi')
  List<MedicalDataDetails?>? get bmi => throw _privateConstructorUsedError;
  @JsonKey(name: 'cd4Count')
  List<MedicalDataDetails?>? get cd4Count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicalDataCopyWith<MedicalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalDataCopyWith<$Res> {
  factory $MedicalDataCopyWith(
          MedicalData value, $Res Function(MedicalData) then) =
      _$MedicalDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'regimen') List<MedicalDataDetails?>? regimen,
      @JsonKey(name: 'allergies') List<MedicalDataDetails?>? allergies,
      @JsonKey(name: 'weight') List<MedicalDataDetails?>? weight,
      @JsonKey(name: 'viralLoad') List<MedicalDataDetails?>? viralLoad,
      @JsonKey(name: 'bmi') List<MedicalDataDetails?>? bmi,
      @JsonKey(name: 'cd4Count') List<MedicalDataDetails?>? cd4Count});
}

/// @nodoc
class _$MedicalDataCopyWithImpl<$Res> implements $MedicalDataCopyWith<$Res> {
  _$MedicalDataCopyWithImpl(this._value, this._then);

  final MedicalData _value;
  // ignore: unused_field
  final $Res Function(MedicalData) _then;

  @override
  $Res call({
    Object? regimen = freezed,
    Object? allergies = freezed,
    Object? weight = freezed,
    Object? viralLoad = freezed,
    Object? bmi = freezed,
    Object? cd4Count = freezed,
  }) {
    return _then(_value.copyWith(
      regimen: regimen == freezed
          ? _value.regimen
          : regimen // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
      allergies: allergies == freezed
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
      viralLoad: viralLoad == freezed
          ? _value.viralLoad
          : viralLoad // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
      bmi: bmi == freezed
          ? _value.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
      cd4Count: cd4Count == freezed
          ? _value.cd4Count
          : cd4Count // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
    ));
  }
}

/// @nodoc
abstract class _$MedicalDataCopyWith<$Res>
    implements $MedicalDataCopyWith<$Res> {
  factory _$MedicalDataCopyWith(
          _MedicalData value, $Res Function(_MedicalData) then) =
      __$MedicalDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'regimen') List<MedicalDataDetails?>? regimen,
      @JsonKey(name: 'allergies') List<MedicalDataDetails?>? allergies,
      @JsonKey(name: 'weight') List<MedicalDataDetails?>? weight,
      @JsonKey(name: 'viralLoad') List<MedicalDataDetails?>? viralLoad,
      @JsonKey(name: 'bmi') List<MedicalDataDetails?>? bmi,
      @JsonKey(name: 'cd4Count') List<MedicalDataDetails?>? cd4Count});
}

/// @nodoc
class __$MedicalDataCopyWithImpl<$Res> extends _$MedicalDataCopyWithImpl<$Res>
    implements _$MedicalDataCopyWith<$Res> {
  __$MedicalDataCopyWithImpl(
      _MedicalData _value, $Res Function(_MedicalData) _then)
      : super(_value, (v) => _then(v as _MedicalData));

  @override
  _MedicalData get _value => super._value as _MedicalData;

  @override
  $Res call({
    Object? regimen = freezed,
    Object? allergies = freezed,
    Object? weight = freezed,
    Object? viralLoad = freezed,
    Object? bmi = freezed,
    Object? cd4Count = freezed,
  }) {
    return _then(_MedicalData(
      regimen: regimen == freezed
          ? _value.regimen
          : regimen // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
      allergies: allergies == freezed
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
      viralLoad: viralLoad == freezed
          ? _value.viralLoad
          : viralLoad // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
      bmi: bmi == freezed
          ? _value.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
      cd4Count: cd4Count == freezed
          ? _value.cd4Count
          : cd4Count // ignore: cast_nullable_to_non_nullable
              as List<MedicalDataDetails?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicalData implements _MedicalData {
  _$_MedicalData(
      {@JsonKey(name: 'regimen') this.regimen,
      @JsonKey(name: 'allergies') this.allergies,
      @JsonKey(name: 'weight') this.weight,
      @JsonKey(name: 'viralLoad') this.viralLoad,
      @JsonKey(name: 'bmi') this.bmi,
      @JsonKey(name: 'cd4Count') this.cd4Count});

  factory _$_MedicalData.fromJson(Map<String, dynamic> json) =>
      _$$_MedicalDataFromJson(json);

  @override
  @JsonKey(name: 'regimen')
  final List<MedicalDataDetails?>? regimen;
  @override
  @JsonKey(name: 'allergies')
  final List<MedicalDataDetails?>? allergies;
  @override
  @JsonKey(name: 'weight')
  final List<MedicalDataDetails?>? weight;
  @override
  @JsonKey(name: 'viralLoad')
  final List<MedicalDataDetails?>? viralLoad;
  @override
  @JsonKey(name: 'bmi')
  final List<MedicalDataDetails?>? bmi;
  @override
  @JsonKey(name: 'cd4Count')
  final List<MedicalDataDetails?>? cd4Count;

  @override
  String toString() {
    return 'MedicalData(regimen: $regimen, allergies: $allergies, weight: $weight, viralLoad: $viralLoad, bmi: $bmi, cd4Count: $cd4Count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MedicalData &&
            const DeepCollectionEquality().equals(other.regimen, regimen) &&
            const DeepCollectionEquality().equals(other.allergies, allergies) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality().equals(other.viralLoad, viralLoad) &&
            const DeepCollectionEquality().equals(other.bmi, bmi) &&
            const DeepCollectionEquality().equals(other.cd4Count, cd4Count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(regimen),
      const DeepCollectionEquality().hash(allergies),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(viralLoad),
      const DeepCollectionEquality().hash(bmi),
      const DeepCollectionEquality().hash(cd4Count));

  @JsonKey(ignore: true)
  @override
  _$MedicalDataCopyWith<_MedicalData> get copyWith =>
      __$MedicalDataCopyWithImpl<_MedicalData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicalDataToJson(this);
  }
}

abstract class _MedicalData implements MedicalData {
  factory _MedicalData(
          {@JsonKey(name: 'regimen') List<MedicalDataDetails?>? regimen,
          @JsonKey(name: 'allergies') List<MedicalDataDetails?>? allergies,
          @JsonKey(name: 'weight') List<MedicalDataDetails?>? weight,
          @JsonKey(name: 'viralLoad') List<MedicalDataDetails?>? viralLoad,
          @JsonKey(name: 'bmi') List<MedicalDataDetails?>? bmi,
          @JsonKey(name: 'cd4Count') List<MedicalDataDetails?>? cd4Count}) =
      _$_MedicalData;

  factory _MedicalData.fromJson(Map<String, dynamic> json) =
      _$_MedicalData.fromJson;

  @override
  @JsonKey(name: 'regimen')
  List<MedicalDataDetails?>? get regimen;
  @override
  @JsonKey(name: 'allergies')
  List<MedicalDataDetails?>? get allergies;
  @override
  @JsonKey(name: 'weight')
  List<MedicalDataDetails?>? get weight;
  @override
  @JsonKey(name: 'viralLoad')
  List<MedicalDataDetails?>? get viralLoad;
  @override
  @JsonKey(name: 'bmi')
  List<MedicalDataDetails?>? get bmi;
  @override
  @JsonKey(name: 'cd4Count')
  List<MedicalDataDetails?>? get cd4Count;
  @override
  @JsonKey(ignore: true)
  _$MedicalDataCopyWith<_MedicalData> get copyWith =>
      throw _privateConstructorUsedError;
}
