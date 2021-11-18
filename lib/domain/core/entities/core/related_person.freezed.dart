// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'related_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RelatedPerson _$RelatedPersonFromJson(Map<String, dynamic> json) {
  return _RelatedPerson.fromJson(json);
}

/// @nodoc
class _$RelatedPersonTearOff {
  const _$RelatedPersonTearOff();

  _RelatedPerson call(
      {@JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'relatedTo')
          String? relatedTo,
      @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
          RelationshipType? relationshipType,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'otherName')
          String? otherName,
      @JsonKey(name: 'gender')
          Gender? gender,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'contacts')
          List<Contact>? contacts}) {
    return _RelatedPerson(
      active: active,
      relatedTo: relatedTo,
      relationshipType: relationshipType,
      firstName: firstName,
      lastName: lastName,
      otherName: otherName,
      gender: gender,
      dateOfBirth: dateOfBirth,
      addresses: addresses,
      contacts: contacts,
    );
  }

  RelatedPerson fromJson(Map<String, Object> json) {
    return RelatedPerson.fromJson(json);
  }
}

/// @nodoc
const $RelatedPerson = _$RelatedPersonTearOff();

/// @nodoc
mixin _$RelatedPerson {
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'relatedTo')
  String? get relatedTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
  RelationshipType? get relationshipType => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'otherName')
  String? get otherName => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfBirth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'addresses')
  List<Address>? get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: 'contacts')
  List<Contact>? get contacts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RelatedPersonCopyWith<RelatedPerson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatedPersonCopyWith<$Res> {
  factory $RelatedPersonCopyWith(
          RelatedPerson value, $Res Function(RelatedPerson) then) =
      _$RelatedPersonCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'relatedTo')
          String? relatedTo,
      @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
          RelationshipType? relationshipType,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'otherName')
          String? otherName,
      @JsonKey(name: 'gender')
          Gender? gender,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'contacts')
          List<Contact>? contacts});
}

/// @nodoc
class _$RelatedPersonCopyWithImpl<$Res>
    implements $RelatedPersonCopyWith<$Res> {
  _$RelatedPersonCopyWithImpl(this._value, this._then);

  final RelatedPerson _value;
  // ignore: unused_field
  final $Res Function(RelatedPerson) _then;

  @override
  $Res call({
    Object? active = freezed,
    Object? relatedTo = freezed,
    Object? relationshipType = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? otherName = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? addresses = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_value.copyWith(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      relatedTo: relatedTo == freezed
          ? _value.relatedTo
          : relatedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      relationshipType: relationshipType == freezed
          ? _value.relationshipType
          : relationshipType // ignore: cast_nullable_to_non_nullable
              as RelationshipType?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      otherName: otherName == freezed
          ? _value.otherName
          : otherName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      contacts: contacts == freezed
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
    ));
  }
}

/// @nodoc
abstract class _$RelatedPersonCopyWith<$Res>
    implements $RelatedPersonCopyWith<$Res> {
  factory _$RelatedPersonCopyWith(
          _RelatedPerson value, $Res Function(_RelatedPerson) then) =
      __$RelatedPersonCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'relatedTo')
          String? relatedTo,
      @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
          RelationshipType? relationshipType,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'otherName')
          String? otherName,
      @JsonKey(name: 'gender')
          Gender? gender,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'contacts')
          List<Contact>? contacts});
}

/// @nodoc
class __$RelatedPersonCopyWithImpl<$Res>
    extends _$RelatedPersonCopyWithImpl<$Res>
    implements _$RelatedPersonCopyWith<$Res> {
  __$RelatedPersonCopyWithImpl(
      _RelatedPerson _value, $Res Function(_RelatedPerson) _then)
      : super(_value, (v) => _then(v as _RelatedPerson));

  @override
  _RelatedPerson get _value => super._value as _RelatedPerson;

  @override
  $Res call({
    Object? active = freezed,
    Object? relatedTo = freezed,
    Object? relationshipType = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? otherName = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? addresses = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_RelatedPerson(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      relatedTo: relatedTo == freezed
          ? _value.relatedTo
          : relatedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      relationshipType: relationshipType == freezed
          ? _value.relationshipType
          : relationshipType // ignore: cast_nullable_to_non_nullable
              as RelationshipType?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      otherName: otherName == freezed
          ? _value.otherName
          : otherName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      contacts: contacts == freezed
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RelatedPerson implements _RelatedPerson {
  _$_RelatedPerson(
      {@JsonKey(name: 'active')
          this.active,
      @JsonKey(name: 'relatedTo')
          this.relatedTo,
      @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
          this.relationshipType,
      @JsonKey(name: 'firstName')
          this.firstName,
      @JsonKey(name: 'lastName')
          this.lastName,
      @JsonKey(name: 'otherName')
          this.otherName,
      @JsonKey(name: 'gender')
          this.gender,
      @JsonKey(name: 'dateOfBirth')
          this.dateOfBirth,
      @JsonKey(name: 'addresses')
          this.addresses,
      @JsonKey(name: 'contacts')
          this.contacts});

  factory _$_RelatedPerson.fromJson(Map<String, dynamic> json) =>
      _$_$_RelatedPersonFromJson(json);

  @override
  @JsonKey(name: 'active')
  final bool? active;
  @override
  @JsonKey(name: 'relatedTo')
  final String? relatedTo;
  @override
  @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
  final RelationshipType? relationshipType;
  @override
  @JsonKey(name: 'firstName')
  final String? firstName;
  @override
  @JsonKey(name: 'lastName')
  final String? lastName;
  @override
  @JsonKey(name: 'otherName')
  final String? otherName;
  @override
  @JsonKey(name: 'gender')
  final Gender? gender;
  @override
  @JsonKey(name: 'dateOfBirth')
  final String? dateOfBirth;
  @override
  @JsonKey(name: 'addresses')
  final List<Address>? addresses;
  @override
  @JsonKey(name: 'contacts')
  final List<Contact>? contacts;

  @override
  String toString() {
    return 'RelatedPerson(active: $active, relatedTo: $relatedTo, relationshipType: $relationshipType, firstName: $firstName, lastName: $lastName, otherName: $otherName, gender: $gender, dateOfBirth: $dateOfBirth, addresses: $addresses, contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RelatedPerson &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.relatedTo, relatedTo) ||
                const DeepCollectionEquality()
                    .equals(other.relatedTo, relatedTo)) &&
            (identical(other.relationshipType, relationshipType) ||
                const DeepCollectionEquality()
                    .equals(other.relationshipType, relationshipType)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.otherName, otherName) ||
                const DeepCollectionEquality()
                    .equals(other.otherName, otherName)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfBirth, dateOfBirth)) &&
            (identical(other.addresses, addresses) ||
                const DeepCollectionEquality()
                    .equals(other.addresses, addresses)) &&
            (identical(other.contacts, contacts) ||
                const DeepCollectionEquality()
                    .equals(other.contacts, contacts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(relatedTo) ^
      const DeepCollectionEquality().hash(relationshipType) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(otherName) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(dateOfBirth) ^
      const DeepCollectionEquality().hash(addresses) ^
      const DeepCollectionEquality().hash(contacts);

  @JsonKey(ignore: true)
  @override
  _$RelatedPersonCopyWith<_RelatedPerson> get copyWith =>
      __$RelatedPersonCopyWithImpl<_RelatedPerson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RelatedPersonToJson(this);
  }
}

abstract class _RelatedPerson implements RelatedPerson {
  factory _RelatedPerson(
      {@JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'relatedTo')
          String? relatedTo,
      @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
          RelationshipType? relationshipType,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'otherName')
          String? otherName,
      @JsonKey(name: 'gender')
          Gender? gender,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'contacts')
          List<Contact>? contacts}) = _$_RelatedPerson;

  factory _RelatedPerson.fromJson(Map<String, dynamic> json) =
      _$_RelatedPerson.fromJson;

  @override
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'relatedTo')
  String? get relatedTo => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
  RelationshipType? get relationshipType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'otherName')
  String? get otherName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'gender')
  Gender? get gender => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dateOfBirth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'addresses')
  List<Address>? get addresses => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'contacts')
  List<Contact>? get contacts => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RelatedPersonCopyWith<_RelatedPerson> get copyWith =>
      throw _privateConstructorUsedError;
}
