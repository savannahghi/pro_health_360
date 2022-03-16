// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      VerifySecurityQuestionsState? verifySecurityQuestionsState,
      SetPINState? setPINState,
      bool? isPhoneVerified,
      bool? hasSetSecurityQuestions,
      bool? hasSetNickName,
      bool? hasVerifiedSecurityQuestions,
      CurrentOnboardingStage? currentOnboardingStage}) {
    return _OnboardingState(
      createPINState: createPINState,
      termsAndConditions: termsAndConditions,
      securityQuestions: securityQuestions,
      securityQuestionResponses: securityQuestionResponses,
      phoneLogin: phoneLogin,
      verifyPhoneState: verifyPhoneState,
      verifySecurityQuestionsState: verifySecurityQuestionsState,
      setPINState: setPINState,
      isPhoneVerified: isPhoneVerified,
      hasSetSecurityQuestions: hasSetSecurityQuestions,
      hasSetNickName: hasSetNickName,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions,
      currentOnboardingStage: currentOnboardingStage,
    );
  }

  OnboardingState fromJson(Map<String, Object?> json) {
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
  VerifyPhoneState? get verifyPhoneState => throw _privateConstructorUsedError;
  VerifySecurityQuestionsState? get verifySecurityQuestionsState =>
      throw _privateConstructorUsedError;
  SetPINState? get setPINState =>
      throw _privateConstructorUsedError; // If the user has verified their phone number
  bool? get isPhoneVerified =>
      throw _privateConstructorUsedError; // If the user has set their security questions
  bool? get hasSetSecurityQuestions =>
      throw _privateConstructorUsedError; // If the user has set their nickname
  bool? get hasSetNickName =>
      throw _privateConstructorUsedError; // If the user has successfully verified their security questions if pin is expired
  bool? get hasVerifiedSecurityQuestions =>
      throw _privateConstructorUsedError; // The current stage of onboarding that the user is in
  CurrentOnboardingStage? get currentOnboardingStage =>
      throw _privateConstructorUsedError;

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
      VerifySecurityQuestionsState? verifySecurityQuestionsState,
      SetPINState? setPINState,
      bool? isPhoneVerified,
      bool? hasSetSecurityQuestions,
      bool? hasSetNickName,
      bool? hasVerifiedSecurityQuestions,
      CurrentOnboardingStage? currentOnboardingStage});

  $CreatePINStateCopyWith<$Res>? get createPINState;
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
  $PhoneLoginStateCopyWith<$Res>? get phoneLogin;
  $VerifyPhoneStateCopyWith<$Res>? get verifyPhoneState;
  $VerifySecurityQuestionsStateCopyWith<$Res>? get verifySecurityQuestionsState;
  $SetPINStateCopyWith<$Res>? get setPINState;
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
    Object? verifySecurityQuestionsState = freezed,
    Object? setPINState = freezed,
    Object? isPhoneVerified = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickName = freezed,
    Object? hasVerifiedSecurityQuestions = freezed,
    Object? currentOnboardingStage = freezed,
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
      verifySecurityQuestionsState: verifySecurityQuestionsState == freezed
          ? _value.verifySecurityQuestionsState
          : verifySecurityQuestionsState // ignore: cast_nullable_to_non_nullable
              as VerifySecurityQuestionsState?,
      setPINState: setPINState == freezed
          ? _value.setPINState
          : setPINState // ignore: cast_nullable_to_non_nullable
              as SetPINState?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickName: hasSetNickName == freezed
          ? _value.hasSetNickName
          : hasSetNickName // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions == freezed
          ? _value.hasVerifiedSecurityQuestions
          : hasVerifiedSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentOnboardingStage: currentOnboardingStage == freezed
          ? _value.currentOnboardingStage
          : currentOnboardingStage // ignore: cast_nullable_to_non_nullable
              as CurrentOnboardingStage?,
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

  @override
  $VerifySecurityQuestionsStateCopyWith<$Res>?
      get verifySecurityQuestionsState {
    if (_value.verifySecurityQuestionsState == null) {
      return null;
    }

    return $VerifySecurityQuestionsStateCopyWith<$Res>(
        _value.verifySecurityQuestionsState!, (value) {
      return _then(_value.copyWith(verifySecurityQuestionsState: value));
    });
  }

  @override
  $SetPINStateCopyWith<$Res>? get setPINState {
    if (_value.setPINState == null) {
      return null;
    }

    return $SetPINStateCopyWith<$Res>(_value.setPINState!, (value) {
      return _then(_value.copyWith(setPINState: value));
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
      VerifySecurityQuestionsState? verifySecurityQuestionsState,
      SetPINState? setPINState,
      bool? isPhoneVerified,
      bool? hasSetSecurityQuestions,
      bool? hasSetNickName,
      bool? hasVerifiedSecurityQuestions,
      CurrentOnboardingStage? currentOnboardingStage});

  @override
  $CreatePINStateCopyWith<$Res>? get createPINState;
  @override
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
  @override
  $PhoneLoginStateCopyWith<$Res>? get phoneLogin;
  @override
  $VerifyPhoneStateCopyWith<$Res>? get verifyPhoneState;
  @override
  $VerifySecurityQuestionsStateCopyWith<$Res>? get verifySecurityQuestionsState;
  @override
  $SetPINStateCopyWith<$Res>? get setPINState;
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
    Object? verifySecurityQuestionsState = freezed,
    Object? setPINState = freezed,
    Object? isPhoneVerified = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickName = freezed,
    Object? hasVerifiedSecurityQuestions = freezed,
    Object? currentOnboardingStage = freezed,
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
      verifySecurityQuestionsState: verifySecurityQuestionsState == freezed
          ? _value.verifySecurityQuestionsState
          : verifySecurityQuestionsState // ignore: cast_nullable_to_non_nullable
              as VerifySecurityQuestionsState?,
      setPINState: setPINState == freezed
          ? _value.setPINState
          : setPINState // ignore: cast_nullable_to_non_nullable
              as SetPINState?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickName: hasSetNickName == freezed
          ? _value.hasSetNickName
          : hasSetNickName // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions == freezed
          ? _value.hasVerifiedSecurityQuestions
          : hasVerifiedSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentOnboardingStage: currentOnboardingStage == freezed
          ? _value.currentOnboardingStage
          : currentOnboardingStage // ignore: cast_nullable_to_non_nullable
              as CurrentOnboardingStage?,
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
      this.verifySecurityQuestionsState,
      this.setPINState,
      this.isPhoneVerified,
      this.hasSetSecurityQuestions,
      this.hasSetNickName,
      this.hasVerifiedSecurityQuestions,
      this.currentOnboardingStage});

  factory _$_OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$$_OnboardingStateFromJson(json);

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
  @override
  final VerifySecurityQuestionsState? verifySecurityQuestionsState;
  @override
  final SetPINState? setPINState;
  @override // If the user has verified their phone number
  final bool? isPhoneVerified;
  @override // If the user has set their security questions
  final bool? hasSetSecurityQuestions;
  @override // If the user has set their nickname
  final bool? hasSetNickName;
  @override // If the user has successfully verified their security questions if pin is expired
  final bool? hasVerifiedSecurityQuestions;
  @override // The current stage of onboarding that the user is in
  final CurrentOnboardingStage? currentOnboardingStage;

  @override
  String toString() {
    return 'OnboardingState(createPINState: $createPINState, termsAndConditions: $termsAndConditions, securityQuestions: $securityQuestions, securityQuestionResponses: $securityQuestionResponses, phoneLogin: $phoneLogin, verifyPhoneState: $verifyPhoneState, verifySecurityQuestionsState: $verifySecurityQuestionsState, setPINState: $setPINState, isPhoneVerified: $isPhoneVerified, hasSetSecurityQuestions: $hasSetSecurityQuestions, hasSetNickName: $hasSetNickName, hasVerifiedSecurityQuestions: $hasVerifiedSecurityQuestions, currentOnboardingStage: $currentOnboardingStage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnboardingState &&
            const DeepCollectionEquality()
                .equals(other.createPINState, createPINState) &&
            const DeepCollectionEquality()
                .equals(other.termsAndConditions, termsAndConditions) &&
            const DeepCollectionEquality()
                .equals(other.securityQuestions, securityQuestions) &&
            const DeepCollectionEquality().equals(
                other.securityQuestionResponses, securityQuestionResponses) &&
            const DeepCollectionEquality()
                .equals(other.phoneLogin, phoneLogin) &&
            const DeepCollectionEquality()
                .equals(other.verifyPhoneState, verifyPhoneState) &&
            const DeepCollectionEquality().equals(
                other.verifySecurityQuestionsState,
                verifySecurityQuestionsState) &&
            const DeepCollectionEquality()
                .equals(other.setPINState, setPINState) &&
            const DeepCollectionEquality()
                .equals(other.isPhoneVerified, isPhoneVerified) &&
            const DeepCollectionEquality().equals(
                other.hasSetSecurityQuestions, hasSetSecurityQuestions) &&
            const DeepCollectionEquality()
                .equals(other.hasSetNickName, hasSetNickName) &&
            const DeepCollectionEquality().equals(
                other.hasVerifiedSecurityQuestions,
                hasVerifiedSecurityQuestions) &&
            const DeepCollectionEquality()
                .equals(other.currentOnboardingStage, currentOnboardingStage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createPINState),
      const DeepCollectionEquality().hash(termsAndConditions),
      const DeepCollectionEquality().hash(securityQuestions),
      const DeepCollectionEquality().hash(securityQuestionResponses),
      const DeepCollectionEquality().hash(phoneLogin),
      const DeepCollectionEquality().hash(verifyPhoneState),
      const DeepCollectionEquality().hash(verifySecurityQuestionsState),
      const DeepCollectionEquality().hash(setPINState),
      const DeepCollectionEquality().hash(isPhoneVerified),
      const DeepCollectionEquality().hash(hasSetSecurityQuestions),
      const DeepCollectionEquality().hash(hasSetNickName),
      const DeepCollectionEquality().hash(hasVerifiedSecurityQuestions),
      const DeepCollectionEquality().hash(currentOnboardingStage));

  @JsonKey(ignore: true)
  @override
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OnboardingStateToJson(this);
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
      VerifySecurityQuestionsState? verifySecurityQuestionsState,
      SetPINState? setPINState,
      bool? isPhoneVerified,
      bool? hasSetSecurityQuestions,
      bool? hasSetNickName,
      bool? hasVerifiedSecurityQuestions,
      CurrentOnboardingStage? currentOnboardingStage}) = _$_OnboardingState;

  factory _OnboardingState.fromJson(Map<String, dynamic> json) =
      _$_OnboardingState.fromJson;

  @override
  CreatePINState? get createPINState;
  @override
  TermsAndConditions? get termsAndConditions;
  @override
  List<SecurityQuestion>? get securityQuestions;
  @override
  List<SecurityQuestionResponse>? get securityQuestionResponses;
  @override
  PhoneLoginState? get phoneLogin;
  @override
  VerifyPhoneState? get verifyPhoneState;
  @override
  VerifySecurityQuestionsState? get verifySecurityQuestionsState;
  @override
  SetPINState? get setPINState;
  @override // If the user has verified their phone number
  bool? get isPhoneVerified;
  @override // If the user has set their security questions
  bool? get hasSetSecurityQuestions;
  @override // If the user has set their nickname
  bool? get hasSetNickName;
  @override // If the user has successfully verified their security questions if pin is expired
  bool? get hasVerifiedSecurityQuestions;
  @override // The current stage of onboarding that the user is in
  CurrentOnboardingStage? get currentOnboardingStage;
  @override
  @JsonKey(ignore: true)
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}
