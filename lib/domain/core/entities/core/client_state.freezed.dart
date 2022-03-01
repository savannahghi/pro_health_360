// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientState _$ClientStateFromJson(Map<String, dynamic> json) {
  return _ClientState.fromJson(json);
}

/// @nodoc
class _$ClientStateTearOff {
  const _$ClientStateTearOff();

  _ClientState call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'counselled', defaultValue: false)
          bool? counselled,
      @JsonKey(name: 'clientType', defaultValue: ClientType.UNKNOWN)
          ClientType? clientType,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn,
      @JsonKey(name: 'facilityName')
          String? facilityName,
      @JsonKey(name: 'facilityPhoneNumber')
          String? facilityPhoneNumber,
      @JsonKey(name: 'chvUserID')
          String? chvUserID,
      @JsonKey(name: 'chvUserName')
          String? chvUserName,
      HealthDiaryState? healthDiaryState}) {
    return _ClientState(
      id: id,
      active: active,
      addresses: addresses,
      counselled: counselled,
      clientType: clientType,
      facilityID: facilityID,
      relatedPersons: relatedPersons,
      treatmentBuddy: treatmentBuddy,
      treatmentEnrollmentDate: treatmentEnrollmentDate,
      user: user,
      lastMoodRecordedDate: lastMoodRecordedDate,
      isSignedIn: isSignedIn,
      facilityName: facilityName,
      facilityPhoneNumber: facilityPhoneNumber,
      chvUserID: chvUserID,
      chvUserName: chvUserName,
      healthDiaryState: healthDiaryState,
    );
  }

  ClientState fromJson(Map<String, Object?> json) {
    return ClientState.fromJson(json);
  }
}

/// @nodoc
const $ClientState = _$ClientStateTearOff();

/// @nodoc
mixin _$ClientState {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'addresses')
  List<Address>? get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: 'counselled', defaultValue: false)
  bool? get counselled => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientType', defaultValue: ClientType.UNKNOWN)
  ClientType? get clientType => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilityID')
  String? get facilityID => throw _privateConstructorUsedError;
  @JsonKey(name: 'relatedPersons')
  List<RelatedPerson>? get relatedPersons => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmentEnrollmentDate')
  String? get treatmentEnrollmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;

  ///others
  @JsonKey(name: 'lastMoodRecordedDate')
  String? get lastMoodRecordedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSignedIn')
  bool? get isSignedIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilityName')
  String? get facilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilityPhoneNumber')
  String? get facilityPhoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'chvUserID')
  String? get chvUserID => throw _privateConstructorUsedError;
  @JsonKey(name: 'chvUserName')
  String? get chvUserName => throw _privateConstructorUsedError;

  /// The client's health diary state
  HealthDiaryState? get healthDiaryState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientStateCopyWith<ClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientStateCopyWith<$Res> {
  factory $ClientStateCopyWith(
          ClientState value, $Res Function(ClientState) then) =
      _$ClientStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'counselled', defaultValue: false)
          bool? counselled,
      @JsonKey(name: 'clientType', defaultValue: ClientType.UNKNOWN)
          ClientType? clientType,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn,
      @JsonKey(name: 'facilityName')
          String? facilityName,
      @JsonKey(name: 'facilityPhoneNumber')
          String? facilityPhoneNumber,
      @JsonKey(name: 'chvUserID')
          String? chvUserID,
      @JsonKey(name: 'chvUserName')
          String? chvUserName,
      HealthDiaryState? healthDiaryState});

  $UserCopyWith<$Res>? get user;
  $HealthDiaryStateCopyWith<$Res>? get healthDiaryState;
}

/// @nodoc
class _$ClientStateCopyWithImpl<$Res> implements $ClientStateCopyWith<$Res> {
  _$ClientStateCopyWithImpl(this._value, this._then);

  final ClientState _value;
  // ignore: unused_field
  final $Res Function(ClientState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? addresses = freezed,
    Object? counselled = freezed,
    Object? clientType = freezed,
    Object? facilityID = freezed,
    Object? relatedPersons = freezed,
    Object? treatmentBuddy = freezed,
    Object? treatmentEnrollmentDate = freezed,
    Object? user = freezed,
    Object? lastMoodRecordedDate = freezed,
    Object? isSignedIn = freezed,
    Object? facilityName = freezed,
    Object? facilityPhoneNumber = freezed,
    Object? chvUserID = freezed,
    Object? chvUserName = freezed,
    Object? healthDiaryState = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      counselled: counselled == freezed
          ? _value.counselled
          : counselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as ClientType?,
      facilityID: facilityID == freezed
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedPersons: relatedPersons == freezed
          ? _value.relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<RelatedPerson>?,
      treatmentBuddy: treatmentBuddy == freezed
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentEnrollmentDate: treatmentEnrollmentDate == freezed
          ? _value.treatmentEnrollmentDate
          : treatmentEnrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      lastMoodRecordedDate: lastMoodRecordedDate == freezed
          ? _value.lastMoodRecordedDate
          : lastMoodRecordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      facilityName: facilityName == freezed
          ? _value.facilityName
          : facilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      facilityPhoneNumber: facilityPhoneNumber == freezed
          ? _value.facilityPhoneNumber
          : facilityPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      chvUserID: chvUserID == freezed
          ? _value.chvUserID
          : chvUserID // ignore: cast_nullable_to_non_nullable
              as String?,
      chvUserName: chvUserName == freezed
          ? _value.chvUserName
          : chvUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      healthDiaryState: healthDiaryState == freezed
          ? _value.healthDiaryState
          : healthDiaryState // ignore: cast_nullable_to_non_nullable
              as HealthDiaryState?,
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

  @override
  $HealthDiaryStateCopyWith<$Res>? get healthDiaryState {
    if (_value.healthDiaryState == null) {
      return null;
    }

    return $HealthDiaryStateCopyWith<$Res>(_value.healthDiaryState!, (value) {
      return _then(_value.copyWith(healthDiaryState: value));
    });
  }
}

/// @nodoc
abstract class _$ClientStateCopyWith<$Res>
    implements $ClientStateCopyWith<$Res> {
  factory _$ClientStateCopyWith(
          _ClientState value, $Res Function(_ClientState) then) =
      __$ClientStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'counselled', defaultValue: false)
          bool? counselled,
      @JsonKey(name: 'clientType', defaultValue: ClientType.UNKNOWN)
          ClientType? clientType,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn,
      @JsonKey(name: 'facilityName')
          String? facilityName,
      @JsonKey(name: 'facilityPhoneNumber')
          String? facilityPhoneNumber,
      @JsonKey(name: 'chvUserID')
          String? chvUserID,
      @JsonKey(name: 'chvUserName')
          String? chvUserName,
      HealthDiaryState? healthDiaryState});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $HealthDiaryStateCopyWith<$Res>? get healthDiaryState;
}

/// @nodoc
class __$ClientStateCopyWithImpl<$Res> extends _$ClientStateCopyWithImpl<$Res>
    implements _$ClientStateCopyWith<$Res> {
  __$ClientStateCopyWithImpl(
      _ClientState _value, $Res Function(_ClientState) _then)
      : super(_value, (v) => _then(v as _ClientState));

  @override
  _ClientState get _value => super._value as _ClientState;

  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? addresses = freezed,
    Object? counselled = freezed,
    Object? clientType = freezed,
    Object? facilityID = freezed,
    Object? relatedPersons = freezed,
    Object? treatmentBuddy = freezed,
    Object? treatmentEnrollmentDate = freezed,
    Object? user = freezed,
    Object? lastMoodRecordedDate = freezed,
    Object? isSignedIn = freezed,
    Object? facilityName = freezed,
    Object? facilityPhoneNumber = freezed,
    Object? chvUserID = freezed,
    Object? chvUserName = freezed,
    Object? healthDiaryState = freezed,
  }) {
    return _then(_ClientState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      counselled: counselled == freezed
          ? _value.counselled
          : counselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as ClientType?,
      facilityID: facilityID == freezed
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedPersons: relatedPersons == freezed
          ? _value.relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<RelatedPerson>?,
      treatmentBuddy: treatmentBuddy == freezed
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentEnrollmentDate: treatmentEnrollmentDate == freezed
          ? _value.treatmentEnrollmentDate
          : treatmentEnrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      lastMoodRecordedDate: lastMoodRecordedDate == freezed
          ? _value.lastMoodRecordedDate
          : lastMoodRecordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      facilityName: facilityName == freezed
          ? _value.facilityName
          : facilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      facilityPhoneNumber: facilityPhoneNumber == freezed
          ? _value.facilityPhoneNumber
          : facilityPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      chvUserID: chvUserID == freezed
          ? _value.chvUserID
          : chvUserID // ignore: cast_nullable_to_non_nullable
              as String?,
      chvUserName: chvUserName == freezed
          ? _value.chvUserName
          : chvUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      healthDiaryState: healthDiaryState == freezed
          ? _value.healthDiaryState
          : healthDiaryState // ignore: cast_nullable_to_non_nullable
              as HealthDiaryState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientState implements _ClientState {
  _$_ClientState(
      {@JsonKey(name: 'id')
          this.id,
      @JsonKey(name: 'active', defaultValue: false)
          this.active,
      @JsonKey(name: 'addresses')
          this.addresses,
      @JsonKey(name: 'counselled', defaultValue: false)
          this.counselled,
      @JsonKey(name: 'clientType', defaultValue: ClientType.UNKNOWN)
          this.clientType,
      @JsonKey(name: 'facilityID')
          this.facilityID,
      @JsonKey(name: 'relatedPersons')
          this.relatedPersons,
      @JsonKey(name: 'treatmentBuddy')
          this.treatmentBuddy,
      @JsonKey(name: 'treatmentEnrollmentDate')
          this.treatmentEnrollmentDate,
      @JsonKey(name: 'user')
          this.user,
      @JsonKey(name: 'lastMoodRecordedDate')
          this.lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          this.isSignedIn,
      @JsonKey(name: 'facilityName')
          this.facilityName,
      @JsonKey(name: 'facilityPhoneNumber')
          this.facilityPhoneNumber,
      @JsonKey(name: 'chvUserID')
          this.chvUserID,
      @JsonKey(name: 'chvUserName')
          this.chvUserName,
      this.healthDiaryState});

  factory _$_ClientState.fromJson(Map<String, dynamic> json) =>
      _$$_ClientStateFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'addresses')
  final List<Address>? addresses;
  @override
  @JsonKey(name: 'counselled', defaultValue: false)
  final bool? counselled;
  @override
  @JsonKey(name: 'clientType', defaultValue: ClientType.UNKNOWN)
  final ClientType? clientType;
  @override
  @JsonKey(name: 'facilityID')
  final String? facilityID;
  @override
  @JsonKey(name: 'relatedPersons')
  final List<RelatedPerson>? relatedPersons;
  @override
  @JsonKey(name: 'treatmentBuddy')
  final String? treatmentBuddy;
  @override
  @JsonKey(name: 'treatmentEnrollmentDate')
  final String? treatmentEnrollmentDate;
  @override
  @JsonKey(name: 'user')
  final User? user;
  @override

  ///others
  @JsonKey(name: 'lastMoodRecordedDate')
  final String? lastMoodRecordedDate;
  @override
  @JsonKey(name: 'isSignedIn')
  final bool? isSignedIn;
  @override
  @JsonKey(name: 'facilityName')
  final String? facilityName;
  @override
  @JsonKey(name: 'facilityPhoneNumber')
  final String? facilityPhoneNumber;
  @override
  @JsonKey(name: 'chvUserID')
  final String? chvUserID;
  @override
  @JsonKey(name: 'chvUserName')
  final String? chvUserName;
  @override

  /// The client's health diary state
  final HealthDiaryState? healthDiaryState;

  @override
  String toString() {
    return 'ClientState(id: $id, active: $active, addresses: $addresses, counselled: $counselled, clientType: $clientType, facilityID: $facilityID, relatedPersons: $relatedPersons, treatmentBuddy: $treatmentBuddy, treatmentEnrollmentDate: $treatmentEnrollmentDate, user: $user, lastMoodRecordedDate: $lastMoodRecordedDate, isSignedIn: $isSignedIn, facilityName: $facilityName, facilityPhoneNumber: $facilityPhoneNumber, chvUserID: $chvUserID, chvUserName: $chvUserName, healthDiaryState: $healthDiaryState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClientState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality().equals(other.addresses, addresses) &&
            const DeepCollectionEquality()
                .equals(other.counselled, counselled) &&
            const DeepCollectionEquality()
                .equals(other.clientType, clientType) &&
            const DeepCollectionEquality()
                .equals(other.facilityID, facilityID) &&
            const DeepCollectionEquality()
                .equals(other.relatedPersons, relatedPersons) &&
            const DeepCollectionEquality()
                .equals(other.treatmentBuddy, treatmentBuddy) &&
            const DeepCollectionEquality().equals(
                other.treatmentEnrollmentDate, treatmentEnrollmentDate) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.lastMoodRecordedDate, lastMoodRecordedDate) &&
            const DeepCollectionEquality()
                .equals(other.isSignedIn, isSignedIn) &&
            const DeepCollectionEquality()
                .equals(other.facilityName, facilityName) &&
            const DeepCollectionEquality()
                .equals(other.facilityPhoneNumber, facilityPhoneNumber) &&
            const DeepCollectionEquality().equals(other.chvUserID, chvUserID) &&
            const DeepCollectionEquality()
                .equals(other.chvUserName, chvUserName) &&
            const DeepCollectionEquality()
                .equals(other.healthDiaryState, healthDiaryState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(addresses),
      const DeepCollectionEquality().hash(counselled),
      const DeepCollectionEquality().hash(clientType),
      const DeepCollectionEquality().hash(facilityID),
      const DeepCollectionEquality().hash(relatedPersons),
      const DeepCollectionEquality().hash(treatmentBuddy),
      const DeepCollectionEquality().hash(treatmentEnrollmentDate),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(lastMoodRecordedDate),
      const DeepCollectionEquality().hash(isSignedIn),
      const DeepCollectionEquality().hash(facilityName),
      const DeepCollectionEquality().hash(facilityPhoneNumber),
      const DeepCollectionEquality().hash(chvUserID),
      const DeepCollectionEquality().hash(chvUserName),
      const DeepCollectionEquality().hash(healthDiaryState));

  @JsonKey(ignore: true)
  @override
  _$ClientStateCopyWith<_ClientState> get copyWith =>
      __$ClientStateCopyWithImpl<_ClientState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientStateToJson(this);
  }
}

abstract class _ClientState implements ClientState {
  factory _ClientState(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'counselled', defaultValue: false)
          bool? counselled,
      @JsonKey(name: 'clientType', defaultValue: ClientType.UNKNOWN)
          ClientType? clientType,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn,
      @JsonKey(name: 'facilityName')
          String? facilityName,
      @JsonKey(name: 'facilityPhoneNumber')
          String? facilityPhoneNumber,
      @JsonKey(name: 'chvUserID')
          String? chvUserID,
      @JsonKey(name: 'chvUserName')
          String? chvUserName,
      HealthDiaryState? healthDiaryState}) = _$_ClientState;

  factory _ClientState.fromJson(Map<String, dynamic> json) =
      _$_ClientState.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'addresses')
  List<Address>? get addresses;
  @override
  @JsonKey(name: 'counselled', defaultValue: false)
  bool? get counselled;
  @override
  @JsonKey(name: 'clientType', defaultValue: ClientType.UNKNOWN)
  ClientType? get clientType;
  @override
  @JsonKey(name: 'facilityID')
  String? get facilityID;
  @override
  @JsonKey(name: 'relatedPersons')
  List<RelatedPerson>? get relatedPersons;
  @override
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy;
  @override
  @JsonKey(name: 'treatmentEnrollmentDate')
  String? get treatmentEnrollmentDate;
  @override
  @JsonKey(name: 'user')
  User? get user;
  @override

  ///others
  @JsonKey(name: 'lastMoodRecordedDate')
  String? get lastMoodRecordedDate;
  @override
  @JsonKey(name: 'isSignedIn')
  bool? get isSignedIn;
  @override
  @JsonKey(name: 'facilityName')
  String? get facilityName;
  @override
  @JsonKey(name: 'facilityPhoneNumber')
  String? get facilityPhoneNumber;
  @override
  @JsonKey(name: 'chvUserID')
  String? get chvUserID;
  @override
  @JsonKey(name: 'chvUserName')
  String? get chvUserName;
  @override

  /// The client's health diary state
  HealthDiaryState? get healthDiaryState;
  @override
  @JsonKey(ignore: true)
  _$ClientStateCopyWith<_ClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
