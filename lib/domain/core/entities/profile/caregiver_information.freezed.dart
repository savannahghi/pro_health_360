// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'caregiver_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CaregiverInformation _$CaregiverInformationFromJson(Map<String, dynamic> json) {
  return _CaregiverInformation.fromJson(json);
}

/// @nodoc
mixin _$CaregiverInformation {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'caregiverType',
      fromJson: caregiverTypeFromJson,
      toJson: caregiverTypeToJson)
  CaregiverType? get caregiverType => throw _privateConstructorUsedError;
  String? get clientID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaregiverInformationCopyWith<CaregiverInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaregiverInformationCopyWith<$Res> {
  factory $CaregiverInformationCopyWith(CaregiverInformation value,
          $Res Function(CaregiverInformation) then) =
      _$CaregiverInformationCopyWithImpl<$Res>;
  $Res call(
      {String? firstName,
      String? lastName,
      String? phoneNumber,
      @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromJson, toJson: caregiverTypeToJson)
          CaregiverType? caregiverType,
      String? clientID});
}

/// @nodoc
class _$CaregiverInformationCopyWithImpl<$Res>
    implements $CaregiverInformationCopyWith<$Res> {
  _$CaregiverInformationCopyWithImpl(this._value, this._then);

  final CaregiverInformation _value;
  // ignore: unused_field
  final $Res Function(CaregiverInformation) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? caregiverType = freezed,
    Object? clientID = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverType: caregiverType == freezed
          ? _value.caregiverType
          : caregiverType // ignore: cast_nullable_to_non_nullable
              as CaregiverType?,
      clientID: clientID == freezed
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CaregiverInformationCopyWith<$Res>
    implements $CaregiverInformationCopyWith<$Res> {
  factory _$$_CaregiverInformationCopyWith(_$_CaregiverInformation value,
          $Res Function(_$_CaregiverInformation) then) =
      __$$_CaregiverInformationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? firstName,
      String? lastName,
      String? phoneNumber,
      @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromJson, toJson: caregiverTypeToJson)
          CaregiverType? caregiverType,
      String? clientID});
}

/// @nodoc
class __$$_CaregiverInformationCopyWithImpl<$Res>
    extends _$CaregiverInformationCopyWithImpl<$Res>
    implements _$$_CaregiverInformationCopyWith<$Res> {
  __$$_CaregiverInformationCopyWithImpl(_$_CaregiverInformation _value,
      $Res Function(_$_CaregiverInformation) _then)
      : super(_value, (v) => _then(v as _$_CaregiverInformation));

  @override
  _$_CaregiverInformation get _value => super._value as _$_CaregiverInformation;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? caregiverType = freezed,
    Object? clientID = freezed,
  }) {
    return _then(_$_CaregiverInformation(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverType: caregiverType == freezed
          ? _value.caregiverType
          : caregiverType // ignore: cast_nullable_to_non_nullable
              as CaregiverType?,
      clientID: clientID == freezed
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CaregiverInformation implements _CaregiverInformation {
  _$_CaregiverInformation(
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromJson, toJson: caregiverTypeToJson)
          this.caregiverType,
      this.clientID});

  factory _$_CaregiverInformation.fromJson(Map<String, dynamic> json) =>
      _$$_CaregiverInformationFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? phoneNumber;
  @override
  @JsonKey(
      name: 'caregiverType',
      fromJson: caregiverTypeFromJson,
      toJson: caregiverTypeToJson)
  final CaregiverType? caregiverType;
  @override
  final String? clientID;

  @override
  String toString() {
    return 'CaregiverInformation(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, caregiverType: $caregiverType, clientID: $clientID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CaregiverInformation &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.caregiverType, caregiverType) &&
            const DeepCollectionEquality().equals(other.clientID, clientID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(caregiverType),
      const DeepCollectionEquality().hash(clientID));

  @JsonKey(ignore: true)
  @override
  _$$_CaregiverInformationCopyWith<_$_CaregiverInformation> get copyWith =>
      __$$_CaregiverInformationCopyWithImpl<_$_CaregiverInformation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CaregiverInformationToJson(this);
  }
}

abstract class _CaregiverInformation implements CaregiverInformation {
  factory _CaregiverInformation(
      {final String? firstName,
      final String? lastName,
      final String? phoneNumber,
      @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromJson, toJson: caregiverTypeToJson)
          final CaregiverType? caregiverType,
      final String? clientID}) = _$_CaregiverInformation;

  factory _CaregiverInformation.fromJson(Map<String, dynamic> json) =
      _$_CaregiverInformation.fromJson;

  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      name: 'caregiverType',
      fromJson: caregiverTypeFromJson,
      toJson: caregiverTypeToJson)
  CaregiverType? get caregiverType => throw _privateConstructorUsedError;
  @override
  String? get clientID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CaregiverInformationCopyWith<_$_CaregiverInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
