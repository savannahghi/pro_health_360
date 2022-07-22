// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'related_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RelatedPerson _$RelatedPersonFromJson(Map<String, dynamic> json) {
  return _RelatedPerson.fromJson(json);
}

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
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
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
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
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
abstract class _$$_RelatedPersonCopyWith<$Res>
    implements $RelatedPersonCopyWith<$Res> {
  factory _$$_RelatedPersonCopyWith(
          _$_RelatedPerson value, $Res Function(_$_RelatedPerson) then) =
      __$$_RelatedPersonCopyWithImpl<$Res>;
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
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'contacts')
          List<Contact>? contacts});
}

/// @nodoc
class __$$_RelatedPersonCopyWithImpl<$Res>
    extends _$RelatedPersonCopyWithImpl<$Res>
    implements _$$_RelatedPersonCopyWith<$Res> {
  __$$_RelatedPersonCopyWithImpl(
      _$_RelatedPerson _value, $Res Function(_$_RelatedPerson) _then)
      : super(_value, (v) => _then(v as _$_RelatedPerson));

  @override
  _$_RelatedPerson get _value => super._value as _$_RelatedPerson;

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
    return _then(_$_RelatedPerson(
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
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      contacts: contacts == freezed
          ? _value._contacts
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
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          this.gender,
      @JsonKey(name: 'dateOfBirth')
          this.dateOfBirth,
      @JsonKey(name: 'addresses')
          final List<Address>? addresses,
      @JsonKey(name: 'contacts')
          final List<Contact>? contacts})
      : _addresses = addresses,
        _contacts = contacts;

  factory _$_RelatedPerson.fromJson(Map<String, dynamic> json) =>
      _$$_RelatedPersonFromJson(json);

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
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  final Gender? gender;
  @override
  @JsonKey(name: 'dateOfBirth')
  final String? dateOfBirth;
  final List<Address>? _addresses;
  @override
  @JsonKey(name: 'addresses')
  List<Address>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Contact>? _contacts;
  @override
  @JsonKey(name: 'contacts')
  List<Contact>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RelatedPerson(active: $active, relatedTo: $relatedTo, relationshipType: $relationshipType, firstName: $firstName, lastName: $lastName, otherName: $otherName, gender: $gender, dateOfBirth: $dateOfBirth, addresses: $addresses, contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RelatedPerson &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality().equals(other.relatedTo, relatedTo) &&
            const DeepCollectionEquality()
                .equals(other.relationshipType, relationshipType) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.otherName, otherName) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(relatedTo),
      const DeepCollectionEquality().hash(relationshipType),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(otherName),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(dateOfBirth),
      const DeepCollectionEquality().hash(_addresses),
      const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  _$$_RelatedPersonCopyWith<_$_RelatedPerson> get copyWith =>
      __$$_RelatedPersonCopyWithImpl<_$_RelatedPerson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RelatedPersonToJson(this);
  }
}

abstract class _RelatedPerson implements RelatedPerson {
  factory _RelatedPerson(
      {@JsonKey(name: 'active')
          final bool? active,
      @JsonKey(name: 'relatedTo')
          final String? relatedTo,
      @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
          final RelationshipType? relationshipType,
      @JsonKey(name: 'firstName')
          final String? firstName,
      @JsonKey(name: 'lastName')
          final String? lastName,
      @JsonKey(name: 'otherName')
          final String? otherName,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          final Gender? gender,
      @JsonKey(name: 'dateOfBirth')
          final String? dateOfBirth,
      @JsonKey(name: 'addresses')
          final List<Address>? addresses,
      @JsonKey(name: 'contacts')
          final List<Contact>? contacts}) = _$_RelatedPerson;

  factory _RelatedPerson.fromJson(Map<String, dynamic> json) =
      _$_RelatedPerson.fromJson;

  @override
  @JsonKey(name: 'active')
  bool? get active;
  @override
  @JsonKey(name: 'relatedTo')
  String? get relatedTo;
  @override
  @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
  RelationshipType? get relationshipType;
  @override
  @JsonKey(name: 'firstName')
  String? get firstName;
  @override
  @JsonKey(name: 'lastName')
  String? get lastName;
  @override
  @JsonKey(name: 'otherName')
  String? get otherName;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender;
  @override
  @JsonKey(name: 'dateOfBirth')
  String? get dateOfBirth;
  @override
  @JsonKey(name: 'addresses')
  List<Address>? get addresses;
  @override
  @JsonKey(name: 'contacts')
  List<Contact>? get contacts;
  @override
  @JsonKey(ignore: true)
  _$$_RelatedPersonCopyWith<_$_RelatedPerson> get copyWith =>
      throw _privateConstructorUsedError;
}
