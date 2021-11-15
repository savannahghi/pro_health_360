// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
class _$ContactTearOff {
  const _$ContactTearOff();

  _Contact call(
      {bool? active,
      PhoneNumber? contact,
      ContactType? contactType,
      bool? optedIn}) {
    return _Contact(
      active: active,
      contact: contact,
      contactType: contactType,
      optedIn: optedIn,
    );
  }

  Contact fromJson(Map<String, Object> json) {
    return Contact.fromJson(json);
  }
}

/// @nodoc
const $Contact = _$ContactTearOff();

/// @nodoc
mixin _$Contact {
  bool? get active => throw _privateConstructorUsedError;
  PhoneNumber? get contact => throw _privateConstructorUsedError;
  ContactType? get contactType => throw _privateConstructorUsedError;
  bool? get optedIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res>;
  $Res call(
      {bool? active,
      PhoneNumber? contact,
      ContactType? contactType,
      bool? optedIn});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res> implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  final Contact _value;
  // ignore: unused_field
  final $Res Function(Contact) _then;

  @override
  $Res call({
    Object? active = freezed,
    Object? contact = freezed,
    Object? contactType = freezed,
    Object? optedIn = freezed,
  }) {
    return _then(_value.copyWith(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact: contact == freezed
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      contactType: contactType == freezed
          ? _value.contactType
          : contactType // ignore: cast_nullable_to_non_nullable
              as ContactType?,
      optedIn: optedIn == freezed
          ? _value.optedIn
          : optedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$ContactCopyWith(_Contact value, $Res Function(_Contact) then) =
      __$ContactCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? active,
      PhoneNumber? contact,
      ContactType? contactType,
      bool? optedIn});
}

/// @nodoc
class __$ContactCopyWithImpl<$Res> extends _$ContactCopyWithImpl<$Res>
    implements _$ContactCopyWith<$Res> {
  __$ContactCopyWithImpl(_Contact _value, $Res Function(_Contact) _then)
      : super(_value, (v) => _then(v as _Contact));

  @override
  _Contact get _value => super._value as _Contact;

  @override
  $Res call({
    Object? active = freezed,
    Object? contact = freezed,
    Object? contactType = freezed,
    Object? optedIn = freezed,
  }) {
    return _then(_Contact(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact: contact == freezed
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      contactType: contactType == freezed
          ? _value.contactType
          : contactType // ignore: cast_nullable_to_non_nullable
              as ContactType?,
      optedIn: optedIn == freezed
          ? _value.optedIn
          : optedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contact implements _Contact {
  _$_Contact({this.active, this.contact, this.contactType, this.optedIn});

  factory _$_Contact.fromJson(Map<String, dynamic> json) =>
      _$_$_ContactFromJson(json);

  @override
  final bool? active;
  @override
  final PhoneNumber? contact;
  @override
  final ContactType? contactType;
  @override
  final bool? optedIn;

  @override
  String toString() {
    return 'Contact(active: $active, contact: $contact, contactType: $contactType, optedIn: $optedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Contact &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.contact, contact) ||
                const DeepCollectionEquality()
                    .equals(other.contact, contact)) &&
            (identical(other.contactType, contactType) ||
                const DeepCollectionEquality()
                    .equals(other.contactType, contactType)) &&
            (identical(other.optedIn, optedIn) ||
                const DeepCollectionEquality().equals(other.optedIn, optedIn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(contact) ^
      const DeepCollectionEquality().hash(contactType) ^
      const DeepCollectionEquality().hash(optedIn);

  @JsonKey(ignore: true)
  @override
  _$ContactCopyWith<_Contact> get copyWith =>
      __$ContactCopyWithImpl<_Contact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContactToJson(this);
  }
}

abstract class _Contact implements Contact {
  factory _Contact(
      {bool? active,
      PhoneNumber? contact,
      ContactType? contactType,
      bool? optedIn}) = _$_Contact;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$_Contact.fromJson;

  @override
  bool? get active => throw _privateConstructorUsedError;
  @override
  PhoneNumber? get contact => throw _privateConstructorUsedError;
  @override
  ContactType? get contactType => throw _privateConstructorUsedError;
  @override
  bool? get optedIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContactCopyWith<_Contact> get copyWith =>
      throw _privateConstructorUsedError;
}
