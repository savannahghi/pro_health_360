// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'verify_security_questions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifySecurityQuestionsState _$VerifySecurityQuestionsStateFromJson(
    Map<String, dynamic> json) {
  return _VerifySecurityQuestionsState.fromJson(json);
}

/// @nodoc
class _$VerifySecurityQuestionsStateTearOff {
  const _$VerifySecurityQuestionsStateTearOff();

  _VerifySecurityQuestionsState call(
      {bool hasVerifiedSecurityQuestions = false}) {
    return _VerifySecurityQuestionsState(
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions,
    );
  }

  VerifySecurityQuestionsState fromJson(Map<String, Object?> json) {
    return VerifySecurityQuestionsState.fromJson(json);
  }
}

/// @nodoc
const $VerifySecurityQuestionsState = _$VerifySecurityQuestionsStateTearOff();

/// @nodoc
mixin _$VerifySecurityQuestionsState {
  bool get hasVerifiedSecurityQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifySecurityQuestionsStateCopyWith<VerifySecurityQuestionsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifySecurityQuestionsStateCopyWith<$Res> {
  factory $VerifySecurityQuestionsStateCopyWith(
          VerifySecurityQuestionsState value,
          $Res Function(VerifySecurityQuestionsState) then) =
      _$VerifySecurityQuestionsStateCopyWithImpl<$Res>;
  $Res call({bool hasVerifiedSecurityQuestions});
}

/// @nodoc
class _$VerifySecurityQuestionsStateCopyWithImpl<$Res>
    implements $VerifySecurityQuestionsStateCopyWith<$Res> {
  _$VerifySecurityQuestionsStateCopyWithImpl(this._value, this._then);

  final VerifySecurityQuestionsState _value;
  // ignore: unused_field
  final $Res Function(VerifySecurityQuestionsState) _then;

  @override
  $Res call({
    Object? hasVerifiedSecurityQuestions = freezed,
  }) {
    return _then(_value.copyWith(
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions == freezed
          ? _value.hasVerifiedSecurityQuestions
          : hasVerifiedSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$VerifySecurityQuestionsStateCopyWith<$Res>
    implements $VerifySecurityQuestionsStateCopyWith<$Res> {
  factory _$VerifySecurityQuestionsStateCopyWith(
          _VerifySecurityQuestionsState value,
          $Res Function(_VerifySecurityQuestionsState) then) =
      __$VerifySecurityQuestionsStateCopyWithImpl<$Res>;
  @override
  $Res call({bool hasVerifiedSecurityQuestions});
}

/// @nodoc
class __$VerifySecurityQuestionsStateCopyWithImpl<$Res>
    extends _$VerifySecurityQuestionsStateCopyWithImpl<$Res>
    implements _$VerifySecurityQuestionsStateCopyWith<$Res> {
  __$VerifySecurityQuestionsStateCopyWithImpl(
      _VerifySecurityQuestionsState _value,
      $Res Function(_VerifySecurityQuestionsState) _then)
      : super(_value, (v) => _then(v as _VerifySecurityQuestionsState));

  @override
  _VerifySecurityQuestionsState get _value =>
      super._value as _VerifySecurityQuestionsState;

  @override
  $Res call({
    Object? hasVerifiedSecurityQuestions = freezed,
  }) {
    return _then(_VerifySecurityQuestionsState(
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions == freezed
          ? _value.hasVerifiedSecurityQuestions
          : hasVerifiedSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerifySecurityQuestionsState implements _VerifySecurityQuestionsState {
  _$_VerifySecurityQuestionsState({this.hasVerifiedSecurityQuestions = false});

  factory _$_VerifySecurityQuestionsState.fromJson(Map<String, dynamic> json) =>
      _$$_VerifySecurityQuestionsStateFromJson(json);

  @JsonKey()
  @override
  final bool hasVerifiedSecurityQuestions;

  @override
  String toString() {
    return 'VerifySecurityQuestionsState(hasVerifiedSecurityQuestions: $hasVerifiedSecurityQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerifySecurityQuestionsState &&
            const DeepCollectionEquality().equals(
                other.hasVerifiedSecurityQuestions,
                hasVerifiedSecurityQuestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(hasVerifiedSecurityQuestions));

  @JsonKey(ignore: true)
  @override
  _$VerifySecurityQuestionsStateCopyWith<_VerifySecurityQuestionsState>
      get copyWith => __$VerifySecurityQuestionsStateCopyWithImpl<
          _VerifySecurityQuestionsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerifySecurityQuestionsStateToJson(this);
  }
}

abstract class _VerifySecurityQuestionsState
    implements VerifySecurityQuestionsState {
  factory _VerifySecurityQuestionsState({bool hasVerifiedSecurityQuestions}) =
      _$_VerifySecurityQuestionsState;

  factory _VerifySecurityQuestionsState.fromJson(Map<String, dynamic> json) =
      _$_VerifySecurityQuestionsState.fromJson;

  @override
  bool get hasVerifiedSecurityQuestions;
  @override
  @JsonKey(ignore: true)
  _$VerifySecurityQuestionsStateCopyWith<_VerifySecurityQuestionsState>
      get copyWith => throw _privateConstructorUsedError;
}
