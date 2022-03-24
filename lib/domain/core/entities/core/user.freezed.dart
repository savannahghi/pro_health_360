// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {@JsonKey(name: 'userID')
          String? userId,
      @JsonKey(name: 'userName')
          String? username,
      @JsonKey(name: 'avatar')
          String? avatar,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'primaryContact')
          Contact? primaryContact,
      @JsonKey(name: 'secondaryContacts')
          List<Contact?>? secondaryContacts,
      @JsonKey(name: 'languages')
          List<String>? languages,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          bool? termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          bool? hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          bool? hasSetNickname,
      @JsonKey(name: 'isPhoneVerified', defaultValue: false)
          bool? isPhoneVerified,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          bool? pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          bool? suspended,
      String? chatRoomToken}) {
    return _User(
      userId: userId,
      username: username,
      avatar: avatar,
      name: name,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      gender: gender,
      active: active,
      primaryContact: primaryContact,
      secondaryContacts: secondaryContacts,
      languages: languages,
      termsAccepted: termsAccepted,
      hasSetPin: hasSetPin,
      hasSetSecurityQuestions: hasSetSecurityQuestions,
      hasSetNickname: hasSetNickname,
      isPhoneVerified: isPhoneVerified,
      pinChangeRequired: pinChangeRequired,
      pinUpdateRequired: pinUpdateRequired,
      suspended: suspended,
      chatRoomToken: chatRoomToken,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  @JsonKey(name: 'userID')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String? get username =>
      throw _privateConstructorUsedError; // This is the nickname
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError; // This is the @handle
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfBirth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'primaryContact')
  Contact? get primaryContact => throw _privateConstructorUsedError;
  @JsonKey(name: 'secondaryContacts')
  List<Contact?>? get secondaryContacts => throw _privateConstructorUsedError;
  @JsonKey(name: 'languages')
  List<String>? get languages => throw _privateConstructorUsedError;
  @JsonKey(name: 'termsAccepted', defaultValue: false)
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetPin', defaultValue: false)
  bool? get hasSetPin => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
  bool? get hasSetSecurityQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetNickname', defaultValue: false)
  bool? get hasSetNickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPhoneVerified', defaultValue: false)
  bool? get isPhoneVerified => throw _privateConstructorUsedError;

  /// Whether this user needs to change their PIN
  ///
  /// This is normally used to signify that this user is a new user
  @JsonKey(name: 'pinChangeRequired', defaultValue: false)
  bool? get pinChangeRequired => throw _privateConstructorUsedError;

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  bool? get pinUpdateRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'suspended', defaultValue: false)
  bool? get suspended => throw _privateConstructorUsedError;
  String? get chatRoomToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'userID')
          String? userId,
      @JsonKey(name: 'userName')
          String? username,
      @JsonKey(name: 'avatar')
          String? avatar,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'primaryContact')
          Contact? primaryContact,
      @JsonKey(name: 'secondaryContacts')
          List<Contact?>? secondaryContacts,
      @JsonKey(name: 'languages')
          List<String>? languages,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          bool? termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          bool? hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          bool? hasSetNickname,
      @JsonKey(name: 'isPhoneVerified', defaultValue: false)
          bool? isPhoneVerified,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          bool? pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          bool? suspended,
      String? chatRoomToken});

  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? name = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
    Object? secondaryContacts = freezed,
    Object? languages = freezed,
    Object? termsAccepted = freezed,
    Object? hasSetPin = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickname = freezed,
    Object? isPhoneVerified = freezed,
    Object? pinChangeRequired = freezed,
    Object? pinUpdateRequired = freezed,
    Object? suspended = freezed,
    Object? chatRoomToken = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryContact: primaryContact == freezed
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      secondaryContacts: secondaryContacts == freezed
          ? _value.secondaryContacts
          : secondaryContacts // ignore: cast_nullable_to_non_nullable
              as List<Contact?>?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: hasSetPin == freezed
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickname: hasSetNickname == freezed
          ? _value.hasSetNickname
          : hasSetNickname // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinChangeRequired: pinChangeRequired == freezed
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinUpdateRequired: pinUpdateRequired == freezed
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      chatRoomToken: chatRoomToken == freezed
          ? _value.chatRoomToken
          : chatRoomToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ContactCopyWith<$Res>? get primaryContact {
    if (_value.primaryContact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.primaryContact!, (value) {
      return _then(_value.copyWith(primaryContact: value));
    });
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'userID')
          String? userId,
      @JsonKey(name: 'userName')
          String? username,
      @JsonKey(name: 'avatar')
          String? avatar,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'primaryContact')
          Contact? primaryContact,
      @JsonKey(name: 'secondaryContacts')
          List<Contact?>? secondaryContacts,
      @JsonKey(name: 'languages')
          List<String>? languages,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          bool? termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          bool? hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          bool? hasSetNickname,
      @JsonKey(name: 'isPhoneVerified', defaultValue: false)
          bool? isPhoneVerified,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          bool? pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          bool? suspended,
      String? chatRoomToken});

  @override
  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? name = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
    Object? secondaryContacts = freezed,
    Object? languages = freezed,
    Object? termsAccepted = freezed,
    Object? hasSetPin = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickname = freezed,
    Object? isPhoneVerified = freezed,
    Object? pinChangeRequired = freezed,
    Object? pinUpdateRequired = freezed,
    Object? suspended = freezed,
    Object? chatRoomToken = freezed,
  }) {
    return _then(_User(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryContact: primaryContact == freezed
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      secondaryContacts: secondaryContacts == freezed
          ? _value.secondaryContacts
          : secondaryContacts // ignore: cast_nullable_to_non_nullable
              as List<Contact?>?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: hasSetPin == freezed
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickname: hasSetNickname == freezed
          ? _value.hasSetNickname
          : hasSetNickname // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinChangeRequired: pinChangeRequired == freezed
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinUpdateRequired: pinUpdateRequired == freezed
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      chatRoomToken: chatRoomToken == freezed
          ? _value.chatRoomToken
          : chatRoomToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {@JsonKey(name: 'userID')
          this.userId,
      @JsonKey(name: 'userName')
          this.username,
      @JsonKey(name: 'avatar')
          this.avatar,
      @JsonKey(name: 'name')
          this.name,
      @JsonKey(name: 'firstName')
          this.firstName,
      @JsonKey(name: 'lastName')
          this.lastName,
      @JsonKey(name: 'dateOfBirth')
          this.dateOfBirth,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          this.gender,
      @JsonKey(name: 'active', defaultValue: false)
          this.active,
      @JsonKey(name: 'primaryContact')
          this.primaryContact,
      @JsonKey(name: 'secondaryContacts')
          this.secondaryContacts,
      @JsonKey(name: 'languages')
          this.languages,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          this.termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          this.hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          this.hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          this.hasSetNickname,
      @JsonKey(name: 'isPhoneVerified', defaultValue: false)
          this.isPhoneVerified,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          this.pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          this.pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          this.suspended,
      this.chatRoomToken});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: 'userID')
  final String? userId;
  @override
  @JsonKey(name: 'userName')
  final String? username;
  @override // This is the nickname
  @JsonKey(name: 'avatar')
  final String? avatar;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override // This is the @handle
  @JsonKey(name: 'firstName')
  final String? firstName;
  @override
  @JsonKey(name: 'lastName')
  final String? lastName;
  @override
  @JsonKey(name: 'dateOfBirth')
  final String? dateOfBirth;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  final Gender? gender;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'primaryContact')
  final Contact? primaryContact;
  @override
  @JsonKey(name: 'secondaryContacts')
  final List<Contact?>? secondaryContacts;
  @override
  @JsonKey(name: 'languages')
  final List<String>? languages;
  @override
  @JsonKey(name: 'termsAccepted', defaultValue: false)
  final bool? termsAccepted;
  @override
  @JsonKey(name: 'hasSetPin', defaultValue: false)
  final bool? hasSetPin;
  @override
  @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
  final bool? hasSetSecurityQuestions;
  @override
  @JsonKey(name: 'hasSetNickname', defaultValue: false)
  final bool? hasSetNickname;
  @override
  @JsonKey(name: 'isPhoneVerified', defaultValue: false)
  final bool? isPhoneVerified;
  @override

  /// Whether this user needs to change their PIN
  ///
  /// This is normally used to signify that this user is a new user
  @JsonKey(name: 'pinChangeRequired', defaultValue: false)
  final bool? pinChangeRequired;
  @override

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  final bool? pinUpdateRequired;
  @override
  @JsonKey(name: 'suspended', defaultValue: false)
  final bool? suspended;
  @override
  final String? chatRoomToken;

  @override
  String toString() {
    return 'User(userId: $userId, username: $username, avatar: $avatar, name: $name, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, gender: $gender, active: $active, primaryContact: $primaryContact, secondaryContacts: $secondaryContacts, languages: $languages, termsAccepted: $termsAccepted, hasSetPin: $hasSetPin, hasSetSecurityQuestions: $hasSetSecurityQuestions, hasSetNickname: $hasSetNickname, isPhoneVerified: $isPhoneVerified, pinChangeRequired: $pinChangeRequired, pinUpdateRequired: $pinUpdateRequired, suspended: $suspended, chatRoomToken: $chatRoomToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality()
                .equals(other.primaryContact, primaryContact) &&
            const DeepCollectionEquality()
                .equals(other.secondaryContacts, secondaryContacts) &&
            const DeepCollectionEquality().equals(other.languages, languages) &&
            const DeepCollectionEquality()
                .equals(other.termsAccepted, termsAccepted) &&
            const DeepCollectionEquality().equals(other.hasSetPin, hasSetPin) &&
            const DeepCollectionEquality().equals(
                other.hasSetSecurityQuestions, hasSetSecurityQuestions) &&
            const DeepCollectionEquality()
                .equals(other.hasSetNickname, hasSetNickname) &&
            const DeepCollectionEquality()
                .equals(other.isPhoneVerified, isPhoneVerified) &&
            const DeepCollectionEquality()
                .equals(other.pinChangeRequired, pinChangeRequired) &&
            const DeepCollectionEquality()
                .equals(other.pinUpdateRequired, pinUpdateRequired) &&
            const DeepCollectionEquality().equals(other.suspended, suspended) &&
            const DeepCollectionEquality()
                .equals(other.chatRoomToken, chatRoomToken));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(userId),
        const DeepCollectionEquality().hash(username),
        const DeepCollectionEquality().hash(avatar),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(firstName),
        const DeepCollectionEquality().hash(lastName),
        const DeepCollectionEquality().hash(dateOfBirth),
        const DeepCollectionEquality().hash(gender),
        const DeepCollectionEquality().hash(active),
        const DeepCollectionEquality().hash(primaryContact),
        const DeepCollectionEquality().hash(secondaryContacts),
        const DeepCollectionEquality().hash(languages),
        const DeepCollectionEquality().hash(termsAccepted),
        const DeepCollectionEquality().hash(hasSetPin),
        const DeepCollectionEquality().hash(hasSetSecurityQuestions),
        const DeepCollectionEquality().hash(hasSetNickname),
        const DeepCollectionEquality().hash(isPhoneVerified),
        const DeepCollectionEquality().hash(pinChangeRequired),
        const DeepCollectionEquality().hash(pinUpdateRequired),
        const DeepCollectionEquality().hash(suspended),
        const DeepCollectionEquality().hash(chatRoomToken)
      ]);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {@JsonKey(name: 'userID')
          String? userId,
      @JsonKey(name: 'userName')
          String? username,
      @JsonKey(name: 'avatar')
          String? avatar,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'primaryContact')
          Contact? primaryContact,
      @JsonKey(name: 'secondaryContacts')
          List<Contact?>? secondaryContacts,
      @JsonKey(name: 'languages')
          List<String>? languages,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          bool? termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          bool? hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          bool? hasSetNickname,
      @JsonKey(name: 'isPhoneVerified', defaultValue: false)
          bool? isPhoneVerified,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          bool? pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          bool? suspended,
      String? chatRoomToken}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: 'userID')
  String? get userId;
  @override
  @JsonKey(name: 'userName')
  String? get username;
  @override // This is the nickname
  @JsonKey(name: 'avatar')
  String? get avatar;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override // This is the @handle
  @JsonKey(name: 'firstName')
  String? get firstName;
  @override
  @JsonKey(name: 'lastName')
  String? get lastName;
  @override
  @JsonKey(name: 'dateOfBirth')
  String? get dateOfBirth;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'primaryContact')
  Contact? get primaryContact;
  @override
  @JsonKey(name: 'secondaryContacts')
  List<Contact?>? get secondaryContacts;
  @override
  @JsonKey(name: 'languages')
  List<String>? get languages;
  @override
  @JsonKey(name: 'termsAccepted', defaultValue: false)
  bool? get termsAccepted;
  @override
  @JsonKey(name: 'hasSetPin', defaultValue: false)
  bool? get hasSetPin;
  @override
  @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
  bool? get hasSetSecurityQuestions;
  @override
  @JsonKey(name: 'hasSetNickname', defaultValue: false)
  bool? get hasSetNickname;
  @override
  @JsonKey(name: 'isPhoneVerified', defaultValue: false)
  bool? get isPhoneVerified;
  @override

  /// Whether this user needs to change their PIN
  ///
  /// This is normally used to signify that this user is a new user
  @JsonKey(name: 'pinChangeRequired', defaultValue: false)
  bool? get pinChangeRequired;
  @override

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  bool? get pinUpdateRequired;
  @override
  @JsonKey(name: 'suspended', defaultValue: false)
  bool? get suspended;
  @override
  String? get chatRoomToken;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
