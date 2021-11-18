// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'client_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientProfile _$ClientProfileFromJson(Map<String, dynamic> json) {
  return _ClientProfile.fromJson(json);
}

/// @nodoc
class _$ClientProfileTearOff {
  const _$ClientProfileTearOff();

  _ClientProfile call(
      {@JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'clientCounselled', defaultValue: false)
          bool? clientCounselled,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn}) {
    return _ClientProfile(
      user: user,
      treatmentEnrollmentDate: treatmentEnrollmentDate,
      clientType: clientType,
      active: active,
      addresses: addresses,
      relatedPersons: relatedPersons,
      facilityID: facilityID,
      treatmentBuddy: treatmentBuddy,
      clientCounselled: clientCounselled,
      lastMoodRecordedDate: lastMoodRecordedDate,
      isSignedIn: isSignedIn,
    );
  }

  ClientProfile fromJson(Map<String, Object> json) {
    return ClientProfile.fromJson(json);
  }
}

/// @nodoc
const $ClientProfile = _$ClientProfileTearOff();

/// @nodoc
mixin _$ClientProfile {
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmentEnrollmentDate')
  String? get treatmentEnrollmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientType')
  ClientType? get clientType => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'addresses')
  List<Address>? get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: 'relatedPersons')
  List<RelatedPerson>? get relatedPersons => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilityID')
  String? get facilityID => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientCounselled', defaultValue: false)
  bool? get clientCounselled => throw _privateConstructorUsedError;

  ///others
  @JsonKey(name: 'lastMoodRecordedDate')
  String? get lastMoodRecordedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSignedIn')
  bool? get isSignedIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientProfileCopyWith<ClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientProfileCopyWith<$Res> {
  factory $ClientProfileCopyWith(
          ClientProfile value, $Res Function(ClientProfile) then) =
      _$ClientProfileCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'clientCounselled', defaultValue: false)
          bool? clientCounselled,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ClientProfileCopyWithImpl<$Res>
    implements $ClientProfileCopyWith<$Res> {
  _$ClientProfileCopyWithImpl(this._value, this._then);

  final ClientProfile _value;
  // ignore: unused_field
  final $Res Function(ClientProfile) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? treatmentEnrollmentDate = freezed,
    Object? clientType = freezed,
    Object? active = freezed,
    Object? addresses = freezed,
    Object? relatedPersons = freezed,
    Object? facilityID = freezed,
    Object? treatmentBuddy = freezed,
    Object? clientCounselled = freezed,
    Object? lastMoodRecordedDate = freezed,
    Object? isSignedIn = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      treatmentEnrollmentDate: treatmentEnrollmentDate == freezed
          ? _value.treatmentEnrollmentDate
          : treatmentEnrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as ClientType?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      relatedPersons: relatedPersons == freezed
          ? _value.relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<RelatedPerson>?,
      facilityID: facilityID == freezed
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentBuddy: treatmentBuddy == freezed
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      clientCounselled: clientCounselled == freezed
          ? _value.clientCounselled
          : clientCounselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastMoodRecordedDate: lastMoodRecordedDate == freezed
          ? _value.lastMoodRecordedDate
          : lastMoodRecordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$ClientProfileCopyWith<$Res>
    implements $ClientProfileCopyWith<$Res> {
  factory _$ClientProfileCopyWith(
          _ClientProfile value, $Res Function(_ClientProfile) then) =
      __$ClientProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'clientCounselled', defaultValue: false)
          bool? clientCounselled,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$ClientProfileCopyWithImpl<$Res>
    extends _$ClientProfileCopyWithImpl<$Res>
    implements _$ClientProfileCopyWith<$Res> {
  __$ClientProfileCopyWithImpl(
      _ClientProfile _value, $Res Function(_ClientProfile) _then)
      : super(_value, (v) => _then(v as _ClientProfile));

  @override
  _ClientProfile get _value => super._value as _ClientProfile;

  @override
  $Res call({
    Object? user = freezed,
    Object? treatmentEnrollmentDate = freezed,
    Object? clientType = freezed,
    Object? active = freezed,
    Object? addresses = freezed,
    Object? relatedPersons = freezed,
    Object? facilityID = freezed,
    Object? treatmentBuddy = freezed,
    Object? clientCounselled = freezed,
    Object? lastMoodRecordedDate = freezed,
    Object? isSignedIn = freezed,
  }) {
    return _then(_ClientProfile(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      treatmentEnrollmentDate: treatmentEnrollmentDate == freezed
          ? _value.treatmentEnrollmentDate
          : treatmentEnrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as ClientType?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      relatedPersons: relatedPersons == freezed
          ? _value.relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<RelatedPerson>?,
      facilityID: facilityID == freezed
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentBuddy: treatmentBuddy == freezed
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      clientCounselled: clientCounselled == freezed
          ? _value.clientCounselled
          : clientCounselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastMoodRecordedDate: lastMoodRecordedDate == freezed
          ? _value.lastMoodRecordedDate
          : lastMoodRecordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientProfile implements _ClientProfile {
  _$_ClientProfile(
      {@JsonKey(name: 'user')
          this.user,
      @JsonKey(name: 'treatmentEnrollmentDate')
          this.treatmentEnrollmentDate,
      @JsonKey(name: 'clientType')
          this.clientType,
      @JsonKey(name: 'active', defaultValue: false)
          this.active,
      @JsonKey(name: 'addresses')
          this.addresses,
      @JsonKey(name: 'relatedPersons')
          this.relatedPersons,
      @JsonKey(name: 'facilityID')
          this.facilityID,
      @JsonKey(name: 'treatmentBuddy')
          this.treatmentBuddy,
      @JsonKey(name: 'clientCounselled', defaultValue: false)
          this.clientCounselled,
      @JsonKey(name: 'lastMoodRecordedDate')
          this.lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          this.isSignedIn});

  factory _$_ClientProfile.fromJson(Map<String, dynamic> json) =>
      _$_$_ClientProfileFromJson(json);

  @override
  @JsonKey(name: 'user')
  final User? user;
  @override
  @JsonKey(name: 'treatmentEnrollmentDate')
  final String? treatmentEnrollmentDate;
  @override
  @JsonKey(name: 'clientType')
  final ClientType? clientType;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'addresses')
  final List<Address>? addresses;
  @override
  @JsonKey(name: 'relatedPersons')
  final List<RelatedPerson>? relatedPersons;
  @override
  @JsonKey(name: 'facilityID')
  final String? facilityID;
  @override
  @JsonKey(name: 'treatmentBuddy')
  final String? treatmentBuddy;
  @override
  @JsonKey(name: 'clientCounselled', defaultValue: false)
  final bool? clientCounselled;
  @override

  ///others
  @JsonKey(name: 'lastMoodRecordedDate')
  final String? lastMoodRecordedDate;
  @override
  @JsonKey(name: 'isSignedIn')
  final bool? isSignedIn;

  @override
  String toString() {
    return 'ClientProfile(user: $user, treatmentEnrollmentDate: $treatmentEnrollmentDate, clientType: $clientType, active: $active, addresses: $addresses, relatedPersons: $relatedPersons, facilityID: $facilityID, treatmentBuddy: $treatmentBuddy, clientCounselled: $clientCounselled, lastMoodRecordedDate: $lastMoodRecordedDate, isSignedIn: $isSignedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClientProfile &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(
                    other.treatmentEnrollmentDate, treatmentEnrollmentDate) ||
                const DeepCollectionEquality().equals(
                    other.treatmentEnrollmentDate, treatmentEnrollmentDate)) &&
            (identical(other.clientType, clientType) ||
                const DeepCollectionEquality()
                    .equals(other.clientType, clientType)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.addresses, addresses) ||
                const DeepCollectionEquality()
                    .equals(other.addresses, addresses)) &&
            (identical(other.relatedPersons, relatedPersons) ||
                const DeepCollectionEquality()
                    .equals(other.relatedPersons, relatedPersons)) &&
            (identical(other.facilityID, facilityID) ||
                const DeepCollectionEquality()
                    .equals(other.facilityID, facilityID)) &&
            (identical(other.treatmentBuddy, treatmentBuddy) ||
                const DeepCollectionEquality()
                    .equals(other.treatmentBuddy, treatmentBuddy)) &&
            (identical(other.clientCounselled, clientCounselled) ||
                const DeepCollectionEquality()
                    .equals(other.clientCounselled, clientCounselled)) &&
            (identical(other.lastMoodRecordedDate, lastMoodRecordedDate) ||
                const DeepCollectionEquality().equals(
                    other.lastMoodRecordedDate, lastMoodRecordedDate)) &&
            (identical(other.isSignedIn, isSignedIn) ||
                const DeepCollectionEquality()
                    .equals(other.isSignedIn, isSignedIn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(treatmentEnrollmentDate) ^
      const DeepCollectionEquality().hash(clientType) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(addresses) ^
      const DeepCollectionEquality().hash(relatedPersons) ^
      const DeepCollectionEquality().hash(facilityID) ^
      const DeepCollectionEquality().hash(treatmentBuddy) ^
      const DeepCollectionEquality().hash(clientCounselled) ^
      const DeepCollectionEquality().hash(lastMoodRecordedDate) ^
      const DeepCollectionEquality().hash(isSignedIn);

  @JsonKey(ignore: true)
  @override
  _$ClientProfileCopyWith<_ClientProfile> get copyWith =>
      __$ClientProfileCopyWithImpl<_ClientProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClientProfileToJson(this);
  }
}

abstract class _ClientProfile implements ClientProfile {
  factory _ClientProfile(
      {@JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'clientCounselled', defaultValue: false)
          bool? clientCounselled,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn}) = _$_ClientProfile;

  factory _ClientProfile.fromJson(Map<String, dynamic> json) =
      _$_ClientProfile.fromJson;

  @override
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'treatmentEnrollmentDate')
  String? get treatmentEnrollmentDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'clientType')
  ClientType? get clientType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'addresses')
  List<Address>? get addresses => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'relatedPersons')
  List<RelatedPerson>? get relatedPersons => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'facilityID')
  String? get facilityID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'clientCounselled', defaultValue: false)
  bool? get clientCounselled => throw _privateConstructorUsedError;
  @override

  ///others
  @JsonKey(name: 'lastMoodRecordedDate')
  String? get lastMoodRecordedDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'isSignedIn')
  bool? get isSignedIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClientProfileCopyWith<_ClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
