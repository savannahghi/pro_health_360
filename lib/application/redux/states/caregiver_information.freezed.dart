// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'caregiver_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CaregiverInformation _$CaregiverInformationFromJson(Map<String, dynamic> json) {
  return _CaregiverInformation.fromJson(json);
}

/// @nodoc
class _$CaregiverInformationTearOff {
  const _$CaregiverInformationTearOff();

  _CaregiverInformation call(
      {String? clientID,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromString, toJson: caregiverTypeToJson)
          CaregiverType? caregiverType}) {
    return _CaregiverInformation(
      clientID: clientID,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      caregiverType: caregiverType,
    );
  }

  CaregiverInformation fromJson(Map<String, Object> json) {
    return CaregiverInformation.fromJson(json);
  }
}

/// @nodoc
const $CaregiverInformation = _$CaregiverInformationTearOff();

/// @nodoc
mixin _$CaregiverInformation {
  String? get clientID => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'caregiverType',
      fromJson: caregiverTypeFromString,
      toJson: caregiverTypeToJson)
  CaregiverType? get caregiverType => throw _privateConstructorUsedError;

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
      {String? clientID,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromString, toJson: caregiverTypeToJson)
          CaregiverType? caregiverType});
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
    Object? clientID = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? caregiverType = freezed,
  }) {
    return _then(_value.copyWith(
      clientID: clientID == freezed
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
abstract class _$CaregiverInformationCopyWith<$Res>
    implements $CaregiverInformationCopyWith<$Res> {
  factory _$CaregiverInformationCopyWith(_CaregiverInformation value,
          $Res Function(_CaregiverInformation) then) =
      __$CaregiverInformationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? clientID,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromString, toJson: caregiverTypeToJson)
          CaregiverType? caregiverType});
}

/// @nodoc
class __$CaregiverInformationCopyWithImpl<$Res>
    extends _$CaregiverInformationCopyWithImpl<$Res>
    implements _$CaregiverInformationCopyWith<$Res> {
  __$CaregiverInformationCopyWithImpl(
      _CaregiverInformation _value, $Res Function(_CaregiverInformation) _then)
      : super(_value, (v) => _then(v as _CaregiverInformation));

  @override
  _CaregiverInformation get _value => super._value as _CaregiverInformation;

  @override
  $Res call({
    Object? clientID = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? caregiverType = freezed,
  }) {
    return _then(_CaregiverInformation(
      clientID: clientID == freezed
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CaregiverInformation implements _CaregiverInformation {
  _$_CaregiverInformation(
      {this.clientID,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromString, toJson: caregiverTypeToJson)
          this.caregiverType});

  factory _$_CaregiverInformation.fromJson(Map<String, dynamic> json) =>
      _$_$_CaregiverInformationFromJson(json);

  @override
  final String? clientID;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? phoneNumber;
  @override
  @JsonKey(
      name: 'caregiverType',
      fromJson: caregiverTypeFromString,
      toJson: caregiverTypeToJson)
  final CaregiverType? caregiverType;

  @override
  String toString() {
    return 'CaregiverInformation(clientID: $clientID, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, caregiverType: $caregiverType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CaregiverInformation &&
            (identical(other.clientID, clientID) ||
                const DeepCollectionEquality()
                    .equals(other.clientID, clientID)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.caregiverType, caregiverType) ||
                const DeepCollectionEquality()
                    .equals(other.caregiverType, caregiverType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(clientID) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(caregiverType);

  @JsonKey(ignore: true)
  @override
  _$CaregiverInformationCopyWith<_CaregiverInformation> get copyWith =>
      __$CaregiverInformationCopyWithImpl<_CaregiverInformation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CaregiverInformationToJson(this);
  }
}

abstract class _CaregiverInformation implements CaregiverInformation {
  factory _CaregiverInformation(
      {String? clientID,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromString, toJson: caregiverTypeToJson)
          CaregiverType? caregiverType}) = _$_CaregiverInformation;

  factory _CaregiverInformation.fromJson(Map<String, dynamic> json) =
      _$_CaregiverInformation.fromJson;

  @override
  String? get clientID => throw _privateConstructorUsedError;
  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      name: 'caregiverType',
      fromJson: caregiverTypeFromString,
      toJson: caregiverTypeToJson)
  CaregiverType? get caregiverType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CaregiverInformationCopyWith<_CaregiverInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
