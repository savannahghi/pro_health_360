// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) {
  return _OnboardingState.fromJson(json);
}

/// @nodoc
class _$OnboardingStateTearOff {
  const _$OnboardingStateTearOff();

  _OnboardingState call(
      {CreatePINState? createPINState,
      TermsAndConditions? termsAndConditions,
      List<SecurityQuestion>? securityQuestions,
      List<SecurityQuestionResponse>? securityQuestionResponses,
      PhoneLoginState? phoneLogin,
      VerifyPhoneState? verifyPhoneState,
      bool? isPhoneVerified,
      bool? isPINSet,
      bool? isResetPin,
      bool? hasSetSecurityQuestions,
      bool? hasSetNickName}) {
    return _OnboardingState(
      createPINState: createPINState,
      termsAndConditions: termsAndConditions,
      securityQuestions: securityQuestions,
      securityQuestionResponses: securityQuestionResponses,
      phoneLogin: phoneLogin,
      verifyPhoneState: verifyPhoneState,
      isPhoneVerified: isPhoneVerified,
      isPINSet: isPINSet,
      isResetPin: isResetPin,
      hasSetSecurityQuestions: hasSetSecurityQuestions,
      hasSetNickName: hasSetNickName,
    );
  }

  OnboardingState fromJson(Map<String, Object> json) {
    return OnboardingState.fromJson(json);
  }
}

/// @nodoc
const $OnboardingState = _$OnboardingStateTearOff();

/// @nodoc
mixin _$OnboardingState {
  CreatePINState? get createPINState => throw _privateConstructorUsedError;
  TermsAndConditions? get termsAndConditions =>
      throw _privateConstructorUsedError;
  List<SecurityQuestion>? get securityQuestions =>
      throw _privateConstructorUsedError;
  List<SecurityQuestionResponse>? get securityQuestionResponses =>
      throw _privateConstructorUsedError;
  PhoneLoginState? get phoneLogin => throw _privateConstructorUsedError;
  VerifyPhoneState? get verifyPhoneState =>
      throw _privateConstructorUsedError; // If the user has verified their phone number
  bool? get isPhoneVerified =>
      throw _privateConstructorUsedError; //If the user has set their PIN
  bool? get isPINSet =>
      throw _privateConstructorUsedError; //If the user wants to reset their PIN
  bool? get isResetPin =>
      throw _privateConstructorUsedError; // If the user has set their security questions
  bool? get hasSetSecurityQuestions =>
      throw _privateConstructorUsedError; // If the user has set their nickname
  bool? get hasSetNickName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res>;
  $Res call(
      {CreatePINState? createPINState,
      TermsAndConditions? termsAndConditions,
      List<SecurityQuestion>? securityQuestions,
      List<SecurityQuestionResponse>? securityQuestionResponses,
      PhoneLoginState? phoneLogin,
      VerifyPhoneState? verifyPhoneState,
      bool? isPhoneVerified,
      bool? isPINSet,
      bool? isResetPin,
      bool? hasSetSecurityQuestions,
      bool? hasSetNickName});

  $CreatePINStateCopyWith<$Res>? get createPINState;
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
  $PhoneLoginStateCopyWith<$Res>? get phoneLogin;
  $VerifyPhoneStateCopyWith<$Res>? get verifyPhoneState;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  final OnboardingState _value;
  // ignore: unused_field
  final $Res Function(OnboardingState) _then;

  @override
  $Res call({
    Object? createPINState = freezed,
    Object? termsAndConditions = freezed,
    Object? securityQuestions = freezed,
    Object? securityQuestionResponses = freezed,
    Object? phoneLogin = freezed,
    Object? verifyPhoneState = freezed,
    Object? isPhoneVerified = freezed,
    Object? isPINSet = freezed,
    Object? isResetPin = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickName = freezed,
  }) {
    return _then(_value.copyWith(
      createPINState: createPINState == freezed
          ? _value.createPINState
          : createPINState // ignore: cast_nullable_to_non_nullable
              as CreatePINState?,
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions?,
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>?,
      securityQuestionResponses: securityQuestionResponses == freezed
          ? _value.securityQuestionResponses
          : securityQuestionResponses // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestionResponse>?,
      phoneLogin: phoneLogin == freezed
          ? _value.phoneLogin
          : phoneLogin // ignore: cast_nullable_to_non_nullable
              as PhoneLoginState?,
      verifyPhoneState: verifyPhoneState == freezed
          ? _value.verifyPhoneState
          : verifyPhoneState // ignore: cast_nullable_to_non_nullable
              as VerifyPhoneState?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPINSet: isPINSet == freezed
          ? _value.isPINSet
          : isPINSet // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResetPin: isResetPin == freezed
          ? _value.isResetPin
          : isResetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickName: hasSetNickName == freezed
          ? _value.hasSetNickName
          : hasSetNickName // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $CreatePINStateCopyWith<$Res>? get createPINState {
    if (_value.createPINState == null) {
      return null;
    }

    return $CreatePINStateCopyWith<$Res>(_value.createPINState!, (value) {
      return _then(_value.copyWith(createPINState: value));
    });
  }

  @override
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions {
    if (_value.termsAndConditions == null) {
      return null;
    }

    return $TermsAndConditionsCopyWith<$Res>(_value.termsAndConditions!,
        (value) {
      return _then(_value.copyWith(termsAndConditions: value));
    });
  }

  @override
  $PhoneLoginStateCopyWith<$Res>? get phoneLogin {
    if (_value.phoneLogin == null) {
      return null;
    }

    return $PhoneLoginStateCopyWith<$Res>(_value.phoneLogin!, (value) {
      return _then(_value.copyWith(phoneLogin: value));
    });
  }

  @override
  $VerifyPhoneStateCopyWith<$Res>? get verifyPhoneState {
    if (_value.verifyPhoneState == null) {
      return null;
    }

    return $VerifyPhoneStateCopyWith<$Res>(_value.verifyPhoneState!, (value) {
      return _then(_value.copyWith(verifyPhoneState: value));
    });
  }
}

/// @nodoc
abstract class _$OnboardingStateCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(
          _OnboardingState value, $Res Function(_OnboardingState) then) =
      __$OnboardingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CreatePINState? createPINState,
      TermsAndConditions? termsAndConditions,
      List<SecurityQuestion>? securityQuestions,
      List<SecurityQuestionResponse>? securityQuestionResponses,
      PhoneLoginState? phoneLogin,
      VerifyPhoneState? verifyPhoneState,
      bool? isPhoneVerified,
      bool? isPINSet,
      bool? isResetPin,
      bool? hasSetSecurityQuestions,
      bool? hasSetNickName});

  @override
  $CreatePINStateCopyWith<$Res>? get createPINState;
  @override
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
  @override
  $PhoneLoginStateCopyWith<$Res>? get phoneLogin;
  @override
  $VerifyPhoneStateCopyWith<$Res>? get verifyPhoneState;
}

/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(
      _OnboardingState _value, $Res Function(_OnboardingState) _then)
      : super(_value, (v) => _then(v as _OnboardingState));

  @override
  _OnboardingState get _value => super._value as _OnboardingState;

  @override
  $Res call({
    Object? createPINState = freezed,
    Object? termsAndConditions = freezed,
    Object? securityQuestions = freezed,
    Object? securityQuestionResponses = freezed,
    Object? phoneLogin = freezed,
    Object? verifyPhoneState = freezed,
    Object? isPhoneVerified = freezed,
    Object? isPINSet = freezed,
    Object? isResetPin = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickName = freezed,
  }) {
    return _then(_OnboardingState(
      createPINState: createPINState == freezed
          ? _value.createPINState
          : createPINState // ignore: cast_nullable_to_non_nullable
              as CreatePINState?,
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions?,
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>?,
      securityQuestionResponses: securityQuestionResponses == freezed
          ? _value.securityQuestionResponses
          : securityQuestionResponses // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestionResponse>?,
      phoneLogin: phoneLogin == freezed
          ? _value.phoneLogin
          : phoneLogin // ignore: cast_nullable_to_non_nullable
              as PhoneLoginState?,
      verifyPhoneState: verifyPhoneState == freezed
          ? _value.verifyPhoneState
          : verifyPhoneState // ignore: cast_nullable_to_non_nullable
              as VerifyPhoneState?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPINSet: isPINSet == freezed
          ? _value.isPINSet
          : isPINSet // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResetPin: isResetPin == freezed
          ? _value.isResetPin
          : isResetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickName: hasSetNickName == freezed
          ? _value.hasSetNickName
          : hasSetNickName // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OnboardingState implements _OnboardingState {
  _$_OnboardingState(
      {this.createPINState,
      this.termsAndConditions,
      this.securityQuestions,
      this.securityQuestionResponses,
      this.phoneLogin,
      this.verifyPhoneState,
      this.isPhoneVerified,
      this.isPINSet,
      this.isResetPin,
      this.hasSetSecurityQuestions,
      this.hasSetNickName});

  factory _$_OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$_$_OnboardingStateFromJson(json);

  @override
  final CreatePINState? createPINState;
  @override
  final TermsAndConditions? termsAndConditions;
  @override
  final List<SecurityQuestion>? securityQuestions;
  @override
  final List<SecurityQuestionResponse>? securityQuestionResponses;
  @override
  final PhoneLoginState? phoneLogin;
  @override
  final VerifyPhoneState? verifyPhoneState;
  @override // If the user has verified their phone number
  final bool? isPhoneVerified;
  @override //If the user has set their PIN
  final bool? isPINSet;
  @override //If the user wants to reset their PIN
  final bool? isResetPin;
  @override // If the user has set their security questions
  final bool? hasSetSecurityQuestions;
  @override // If the user has set their nickname
  final bool? hasSetNickName;

  @override
  String toString() {
    return 'OnboardingState(createPINState: $createPINState, termsAndConditions: $termsAndConditions, securityQuestions: $securityQuestions, securityQuestionResponses: $securityQuestionResponses, phoneLogin: $phoneLogin, verifyPhoneState: $verifyPhoneState, isPhoneVerified: $isPhoneVerified, isPINSet: $isPINSet, isResetPin: $isResetPin, hasSetSecurityQuestions: $hasSetSecurityQuestions, hasSetNickName: $hasSetNickName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnboardingState &&
            (identical(other.createPINState, createPINState) ||
                const DeepCollectionEquality()
                    .equals(other.createPINState, createPINState)) &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                const DeepCollectionEquality()
                    .equals(other.termsAndConditions, termsAndConditions)) &&
            (identical(other.securityQuestions, securityQuestions) ||
                const DeepCollectionEquality()
                    .equals(other.securityQuestions, securityQuestions)) &&
            (identical(other.securityQuestionResponses,
                    securityQuestionResponses) ||
                const DeepCollectionEquality().equals(
                    other.securityQuestionResponses,
                    securityQuestionResponses)) &&
            (identical(other.phoneLogin, phoneLogin) ||
                const DeepCollectionEquality()
                    .equals(other.phoneLogin, phoneLogin)) &&
            (identical(other.verifyPhoneState, verifyPhoneState) ||
                const DeepCollectionEquality()
                    .equals(other.verifyPhoneState, verifyPhoneState)) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                const DeepCollectionEquality()
                    .equals(other.isPhoneVerified, isPhoneVerified)) &&
            (identical(other.isPINSet, isPINSet) ||
                const DeepCollectionEquality()
                    .equals(other.isPINSet, isPINSet)) &&
            (identical(other.isResetPin, isResetPin) ||
                const DeepCollectionEquality()
                    .equals(other.isResetPin, isResetPin)) &&
            (identical(
                    other.hasSetSecurityQuestions, hasSetSecurityQuestions) ||
                const DeepCollectionEquality().equals(
                    other.hasSetSecurityQuestions, hasSetSecurityQuestions)) &&
            (identical(other.hasSetNickName, hasSetNickName) ||
                const DeepCollectionEquality()
                    .equals(other.hasSetNickName, hasSetNickName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createPINState) ^
      const DeepCollectionEquality().hash(termsAndConditions) ^
      const DeepCollectionEquality().hash(securityQuestions) ^
      const DeepCollectionEquality().hash(securityQuestionResponses) ^
      const DeepCollectionEquality().hash(phoneLogin) ^
      const DeepCollectionEquality().hash(verifyPhoneState) ^
      const DeepCollectionEquality().hash(isPhoneVerified) ^
      const DeepCollectionEquality().hash(isPINSet) ^
      const DeepCollectionEquality().hash(isResetPin) ^
      const DeepCollectionEquality().hash(hasSetSecurityQuestions) ^
      const DeepCollectionEquality().hash(hasSetNickName);

  @JsonKey(ignore: true)
  @override
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OnboardingStateToJson(this);
  }
}

abstract class _OnboardingState implements OnboardingState {
  factory _OnboardingState(
      {CreatePINState? createPINState,
      TermsAndConditions? termsAndConditions,
      List<SecurityQuestion>? securityQuestions,
      List<SecurityQuestionResponse>? securityQuestionResponses,
      PhoneLoginState? phoneLogin,
      VerifyPhoneState? verifyPhoneState,
      bool? isPhoneVerified,
      bool? isPINSet,
      bool? isResetPin,
      bool? hasSetSecurityQuestions,
      bool? hasSetNickName}) = _$_OnboardingState;

  factory _OnboardingState.fromJson(Map<String, dynamic> json) =
      _$_OnboardingState.fromJson;

  @override
  CreatePINState? get createPINState => throw _privateConstructorUsedError;
  @override
  TermsAndConditions? get termsAndConditions =>
      throw _privateConstructorUsedError;
  @override
  List<SecurityQuestion>? get securityQuestions =>
      throw _privateConstructorUsedError;
  @override
  List<SecurityQuestionResponse>? get securityQuestionResponses =>
      throw _privateConstructorUsedError;
  @override
  PhoneLoginState? get phoneLogin => throw _privateConstructorUsedError;
  @override
  VerifyPhoneState? get verifyPhoneState => throw _privateConstructorUsedError;
  @override // If the user has verified their phone number
  bool? get isPhoneVerified => throw _privateConstructorUsedError;
  @override //If the user has set their PIN
  bool? get isPINSet => throw _privateConstructorUsedError;
  @override //If the user wants to reset their PIN
  bool? get isResetPin => throw _privateConstructorUsedError;
  @override // If the user has set their security questions
  bool? get hasSetSecurityQuestions => throw _privateConstructorUsedError;
  @override // If the user has set their nickname
  bool? get hasSetNickName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}
