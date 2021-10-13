// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileState _$UserProfileStateFromJson(Map<String, dynamic> json) {
  return _UserProfileState.fromJson(json);
}

/// @nodoc
class _$UserProfileStateTearOff {
  const _$UserProfileStateTearOff();

  _UserProfileState call(
      {UserProfile? userProfile,
      Customer? customerProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? onboardingTourComplete,
      bool? profileSetupComplete,
      List<PhoneNumber>? unmaskedPhoneNumbers,
      List<PhoneNumber>? maskedPhoneNumbers,
      bool? isSignedIn,
      String? inActivitySetInTime,
      String? signedInTime,
      bool? isFirstLaunch,
      List<SecurityQuestion>? securityQuestions,
      Map<String, SecurityQuestionResponse>? securityQuestionsResponses}) {
    return _UserProfileState(
      userProfile: userProfile,
      customerProfile: customerProfile,
      communicationSettings: communicationSettings,
      auth: auth,
      onboardingTourComplete: onboardingTourComplete,
      profileSetupComplete: profileSetupComplete,
      unmaskedPhoneNumbers: unmaskedPhoneNumbers,
      maskedPhoneNumbers: maskedPhoneNumbers,
      isSignedIn: isSignedIn,
      inActivitySetInTime: inActivitySetInTime,
      signedInTime: signedInTime,
      isFirstLaunch: isFirstLaunch,
      securityQuestions: securityQuestions,
      securityQuestionsResponses: securityQuestionsResponses,
    );
  }

  UserProfileState fromJson(Map<String, Object> json) {
    return UserProfileState.fromJson(json);
  }
}

/// @nodoc
const $UserProfileState = _$UserProfileStateTearOff();

/// @nodoc
mixin _$UserProfileState {
// sourced from the response for login
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  Customer? get customerProfile => throw _privateConstructorUsedError;
  CommunicationSettings? get communicationSettings =>
      throw _privateConstructorUsedError;
  AuthCredentialResponse? get auth =>
      throw _privateConstructorUsedError; // generate from the app
  bool? get onboardingTourComplete => throw _privateConstructorUsedError;
  bool? get profileSetupComplete => throw _privateConstructorUsedError;
  List<PhoneNumber>? get unmaskedPhoneNumbers =>
      throw _privateConstructorUsedError;
  List<PhoneNumber>? get maskedPhoneNumbers =>
      throw _privateConstructorUsedError;
  bool? get isSignedIn => throw _privateConstructorUsedError;
  String? get inActivitySetInTime => throw _privateConstructorUsedError;
  String? get signedInTime => throw _privateConstructorUsedError;
  bool? get isFirstLaunch => throw _privateConstructorUsedError;
  List<SecurityQuestion>? get securityQuestions =>
      throw _privateConstructorUsedError;
  Map<String, SecurityQuestionResponse>? get securityQuestionsResponses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileStateCopyWith<UserProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileStateCopyWith<$Res> {
  factory $UserProfileStateCopyWith(
          UserProfileState value, $Res Function(UserProfileState) then) =
      _$UserProfileStateCopyWithImpl<$Res>;
  $Res call(
      {UserProfile? userProfile,
      Customer? customerProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? onboardingTourComplete,
      bool? profileSetupComplete,
      List<PhoneNumber>? unmaskedPhoneNumbers,
      List<PhoneNumber>? maskedPhoneNumbers,
      bool? isSignedIn,
      String? inActivitySetInTime,
      String? signedInTime,
      bool? isFirstLaunch,
      List<SecurityQuestion>? securityQuestions,
      Map<String, SecurityQuestionResponse>? securityQuestionsResponses});

  $UserProfileCopyWith<$Res>? get userProfile;
  $CustomerCopyWith<$Res>? get customerProfile;
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings;
  $AuthCredentialResponseCopyWith<$Res>? get auth;
}

/// @nodoc
class _$UserProfileStateCopyWithImpl<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  _$UserProfileStateCopyWithImpl(this._value, this._then);

  final UserProfileState _value;
  // ignore: unused_field
  final $Res Function(UserProfileState) _then;

  @override
  $Res call({
    Object? userProfile = freezed,
    Object? customerProfile = freezed,
    Object? communicationSettings = freezed,
    Object? auth = freezed,
    Object? onboardingTourComplete = freezed,
    Object? profileSetupComplete = freezed,
    Object? unmaskedPhoneNumbers = freezed,
    Object? maskedPhoneNumbers = freezed,
    Object? isSignedIn = freezed,
    Object? inActivitySetInTime = freezed,
    Object? signedInTime = freezed,
    Object? isFirstLaunch = freezed,
    Object? securityQuestions = freezed,
    Object? securityQuestionsResponses = freezed,
  }) {
    return _then(_value.copyWith(
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      customerProfile: customerProfile == freezed
          ? _value.customerProfile
          : customerProfile // ignore: cast_nullable_to_non_nullable
              as Customer?,
      communicationSettings: communicationSettings == freezed
          ? _value.communicationSettings
          : communicationSettings // ignore: cast_nullable_to_non_nullable
              as CommunicationSettings?,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthCredentialResponse?,
      onboardingTourComplete: onboardingTourComplete == freezed
          ? _value.onboardingTourComplete
          : onboardingTourComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      profileSetupComplete: profileSetupComplete == freezed
          ? _value.profileSetupComplete
          : profileSetupComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      unmaskedPhoneNumbers: unmaskedPhoneNumbers == freezed
          ? _value.unmaskedPhoneNumbers
          : unmaskedPhoneNumbers // ignore: cast_nullable_to_non_nullable
              as List<PhoneNumber>?,
      maskedPhoneNumbers: maskedPhoneNumbers == freezed
          ? _value.maskedPhoneNumbers
          : maskedPhoneNumbers // ignore: cast_nullable_to_non_nullable
              as List<PhoneNumber>?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      inActivitySetInTime: inActivitySetInTime == freezed
          ? _value.inActivitySetInTime
          : inActivitySetInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      signedInTime: signedInTime == freezed
          ? _value.signedInTime
          : signedInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isFirstLaunch: isFirstLaunch == freezed
          ? _value.isFirstLaunch
          : isFirstLaunch // ignore: cast_nullable_to_non_nullable
              as bool?,
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>?,
      securityQuestionsResponses: securityQuestionsResponses == freezed
          ? _value.securityQuestionsResponses
          : securityQuestionsResponses // ignore: cast_nullable_to_non_nullable
              as Map<String, SecurityQuestionResponse>?,
    ));
  }

  @override
  $UserProfileCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value));
    });
  }

  @override
  $CustomerCopyWith<$Res>? get customerProfile {
    if (_value.customerProfile == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customerProfile!, (value) {
      return _then(_value.copyWith(customerProfile: value));
    });
  }

  @override
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings {
    if (_value.communicationSettings == null) {
      return null;
    }

    return $CommunicationSettingsCopyWith<$Res>(_value.communicationSettings!,
        (value) {
      return _then(_value.copyWith(communicationSettings: value));
    });
  }

  @override
  $AuthCredentialResponseCopyWith<$Res>? get auth {
    if (_value.auth == null) {
      return null;
    }

    return $AuthCredentialResponseCopyWith<$Res>(_value.auth!, (value) {
      return _then(_value.copyWith(auth: value));
    });
  }
}

/// @nodoc
abstract class _$UserProfileStateCopyWith<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  factory _$UserProfileStateCopyWith(
          _UserProfileState value, $Res Function(_UserProfileState) then) =
      __$UserProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserProfile? userProfile,
      Customer? customerProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? onboardingTourComplete,
      bool? profileSetupComplete,
      List<PhoneNumber>? unmaskedPhoneNumbers,
      List<PhoneNumber>? maskedPhoneNumbers,
      bool? isSignedIn,
      String? inActivitySetInTime,
      String? signedInTime,
      bool? isFirstLaunch,
      List<SecurityQuestion>? securityQuestions,
      Map<String, SecurityQuestionResponse>? securityQuestionsResponses});

  @override
  $UserProfileCopyWith<$Res>? get userProfile;
  @override
  $CustomerCopyWith<$Res>? get customerProfile;
  @override
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings;
  @override
  $AuthCredentialResponseCopyWith<$Res>? get auth;
}

/// @nodoc
class __$UserProfileStateCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res>
    implements _$UserProfileStateCopyWith<$Res> {
  __$UserProfileStateCopyWithImpl(
      _UserProfileState _value, $Res Function(_UserProfileState) _then)
      : super(_value, (v) => _then(v as _UserProfileState));

  @override
  _UserProfileState get _value => super._value as _UserProfileState;

  @override
  $Res call({
    Object? userProfile = freezed,
    Object? customerProfile = freezed,
    Object? communicationSettings = freezed,
    Object? auth = freezed,
    Object? onboardingTourComplete = freezed,
    Object? profileSetupComplete = freezed,
    Object? unmaskedPhoneNumbers = freezed,
    Object? maskedPhoneNumbers = freezed,
    Object? isSignedIn = freezed,
    Object? inActivitySetInTime = freezed,
    Object? signedInTime = freezed,
    Object? isFirstLaunch = freezed,
    Object? securityQuestions = freezed,
    Object? securityQuestionsResponses = freezed,
  }) {
    return _then(_UserProfileState(
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      customerProfile: customerProfile == freezed
          ? _value.customerProfile
          : customerProfile // ignore: cast_nullable_to_non_nullable
              as Customer?,
      communicationSettings: communicationSettings == freezed
          ? _value.communicationSettings
          : communicationSettings // ignore: cast_nullable_to_non_nullable
              as CommunicationSettings?,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthCredentialResponse?,
      onboardingTourComplete: onboardingTourComplete == freezed
          ? _value.onboardingTourComplete
          : onboardingTourComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      profileSetupComplete: profileSetupComplete == freezed
          ? _value.profileSetupComplete
          : profileSetupComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      unmaskedPhoneNumbers: unmaskedPhoneNumbers == freezed
          ? _value.unmaskedPhoneNumbers
          : unmaskedPhoneNumbers // ignore: cast_nullable_to_non_nullable
              as List<PhoneNumber>?,
      maskedPhoneNumbers: maskedPhoneNumbers == freezed
          ? _value.maskedPhoneNumbers
          : maskedPhoneNumbers // ignore: cast_nullable_to_non_nullable
              as List<PhoneNumber>?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      inActivitySetInTime: inActivitySetInTime == freezed
          ? _value.inActivitySetInTime
          : inActivitySetInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      signedInTime: signedInTime == freezed
          ? _value.signedInTime
          : signedInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isFirstLaunch: isFirstLaunch == freezed
          ? _value.isFirstLaunch
          : isFirstLaunch // ignore: cast_nullable_to_non_nullable
              as bool?,
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>?,
      securityQuestionsResponses: securityQuestionsResponses == freezed
          ? _value.securityQuestionsResponses
          : securityQuestionsResponses // ignore: cast_nullable_to_non_nullable
              as Map<String, SecurityQuestionResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileState implements _UserProfileState {
  _$_UserProfileState(
      {this.userProfile,
      this.customerProfile,
      this.communicationSettings,
      this.auth,
      this.onboardingTourComplete,
      this.profileSetupComplete,
      this.unmaskedPhoneNumbers,
      this.maskedPhoneNumbers,
      this.isSignedIn,
      this.inActivitySetInTime,
      this.signedInTime,
      this.isFirstLaunch,
      this.securityQuestions,
      this.securityQuestionsResponses});

  factory _$_UserProfileState.fromJson(Map<String, dynamic> json) =>
      _$_$_UserProfileStateFromJson(json);

  @override // sourced from the response for login
  final UserProfile? userProfile;
  @override
  final Customer? customerProfile;
  @override
  final CommunicationSettings? communicationSettings;
  @override
  final AuthCredentialResponse? auth;
  @override // generate from the app
  final bool? onboardingTourComplete;
  @override
  final bool? profileSetupComplete;
  @override
  final List<PhoneNumber>? unmaskedPhoneNumbers;
  @override
  final List<PhoneNumber>? maskedPhoneNumbers;
  @override
  final bool? isSignedIn;
  @override
  final String? inActivitySetInTime;
  @override
  final String? signedInTime;
  @override
  final bool? isFirstLaunch;
  @override
  final List<SecurityQuestion>? securityQuestions;
  @override
  final Map<String, SecurityQuestionResponse>? securityQuestionsResponses;

  @override
  String toString() {
    return 'UserProfileState(userProfile: $userProfile, customerProfile: $customerProfile, communicationSettings: $communicationSettings, auth: $auth, onboardingTourComplete: $onboardingTourComplete, profileSetupComplete: $profileSetupComplete, unmaskedPhoneNumbers: $unmaskedPhoneNumbers, maskedPhoneNumbers: $maskedPhoneNumbers, isSignedIn: $isSignedIn, inActivitySetInTime: $inActivitySetInTime, signedInTime: $signedInTime, isFirstLaunch: $isFirstLaunch, securityQuestions: $securityQuestions, securityQuestionsResponses: $securityQuestionsResponses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserProfileState &&
            (identical(other.userProfile, userProfile) ||
                const DeepCollectionEquality()
                    .equals(other.userProfile, userProfile)) &&
            (identical(other.customerProfile, customerProfile) ||
                const DeepCollectionEquality()
                    .equals(other.customerProfile, customerProfile)) &&
            (identical(other.communicationSettings, communicationSettings) ||
                const DeepCollectionEquality().equals(
                    other.communicationSettings, communicationSettings)) &&
            (identical(other.auth, auth) ||
                const DeepCollectionEquality().equals(other.auth, auth)) &&
            (identical(other.onboardingTourComplete, onboardingTourComplete) ||
                const DeepCollectionEquality().equals(
                    other.onboardingTourComplete, onboardingTourComplete)) &&
            (identical(other.profileSetupComplete, profileSetupComplete) ||
                const DeepCollectionEquality().equals(
                    other.profileSetupComplete, profileSetupComplete)) &&
            (identical(other.unmaskedPhoneNumbers, unmaskedPhoneNumbers) ||
                const DeepCollectionEquality().equals(
                    other.unmaskedPhoneNumbers, unmaskedPhoneNumbers)) &&
            (identical(other.maskedPhoneNumbers, maskedPhoneNumbers) ||
                const DeepCollectionEquality()
                    .equals(other.maskedPhoneNumbers, maskedPhoneNumbers)) &&
            (identical(other.isSignedIn, isSignedIn) ||
                const DeepCollectionEquality()
                    .equals(other.isSignedIn, isSignedIn)) &&
            (identical(other.inActivitySetInTime, inActivitySetInTime) ||
                const DeepCollectionEquality()
                    .equals(other.inActivitySetInTime, inActivitySetInTime)) &&
            (identical(other.signedInTime, signedInTime) ||
                const DeepCollectionEquality()
                    .equals(other.signedInTime, signedInTime)) &&
            (identical(other.isFirstLaunch, isFirstLaunch) ||
                const DeepCollectionEquality()
                    .equals(other.isFirstLaunch, isFirstLaunch)) &&
            (identical(other.securityQuestions, securityQuestions) ||
                const DeepCollectionEquality()
                    .equals(other.securityQuestions, securityQuestions)) &&
            (identical(other.securityQuestionsResponses,
                    securityQuestionsResponses) ||
                const DeepCollectionEquality().equals(
                    other.securityQuestionsResponses,
                    securityQuestionsResponses)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userProfile) ^
      const DeepCollectionEquality().hash(customerProfile) ^
      const DeepCollectionEquality().hash(communicationSettings) ^
      const DeepCollectionEquality().hash(auth) ^
      const DeepCollectionEquality().hash(onboardingTourComplete) ^
      const DeepCollectionEquality().hash(profileSetupComplete) ^
      const DeepCollectionEquality().hash(unmaskedPhoneNumbers) ^
      const DeepCollectionEquality().hash(maskedPhoneNumbers) ^
      const DeepCollectionEquality().hash(isSignedIn) ^
      const DeepCollectionEquality().hash(inActivitySetInTime) ^
      const DeepCollectionEquality().hash(signedInTime) ^
      const DeepCollectionEquality().hash(isFirstLaunch) ^
      const DeepCollectionEquality().hash(securityQuestions) ^
      const DeepCollectionEquality().hash(securityQuestionsResponses);

  @JsonKey(ignore: true)
  @override
  _$UserProfileStateCopyWith<_UserProfileState> get copyWith =>
      __$UserProfileStateCopyWithImpl<_UserProfileState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserProfileStateToJson(this);
  }
}

abstract class _UserProfileState implements UserProfileState {
  factory _UserProfileState(
          {UserProfile? userProfile,
          Customer? customerProfile,
          CommunicationSettings? communicationSettings,
          AuthCredentialResponse? auth,
          bool? onboardingTourComplete,
          bool? profileSetupComplete,
          List<PhoneNumber>? unmaskedPhoneNumbers,
          List<PhoneNumber>? maskedPhoneNumbers,
          bool? isSignedIn,
          String? inActivitySetInTime,
          String? signedInTime,
          bool? isFirstLaunch,
          List<SecurityQuestion>? securityQuestions,
          Map<String, SecurityQuestionResponse>? securityQuestionsResponses}) =
      _$_UserProfileState;

  factory _UserProfileState.fromJson(Map<String, dynamic> json) =
      _$_UserProfileState.fromJson;

  @override // sourced from the response for login
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  @override
  Customer? get customerProfile => throw _privateConstructorUsedError;
  @override
  CommunicationSettings? get communicationSettings =>
      throw _privateConstructorUsedError;
  @override
  AuthCredentialResponse? get auth => throw _privateConstructorUsedError;
  @override // generate from the app
  bool? get onboardingTourComplete => throw _privateConstructorUsedError;
  @override
  bool? get profileSetupComplete => throw _privateConstructorUsedError;
  @override
  List<PhoneNumber>? get unmaskedPhoneNumbers =>
      throw _privateConstructorUsedError;
  @override
  List<PhoneNumber>? get maskedPhoneNumbers =>
      throw _privateConstructorUsedError;
  @override
  bool? get isSignedIn => throw _privateConstructorUsedError;
  @override
  String? get inActivitySetInTime => throw _privateConstructorUsedError;
  @override
  String? get signedInTime => throw _privateConstructorUsedError;
  @override
  bool? get isFirstLaunch => throw _privateConstructorUsedError;
  @override
  List<SecurityQuestion>? get securityQuestions =>
      throw _privateConstructorUsedError;
  @override
  Map<String, SecurityQuestionResponse>? get securityQuestionsResponses =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserProfileStateCopyWith<_UserProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
