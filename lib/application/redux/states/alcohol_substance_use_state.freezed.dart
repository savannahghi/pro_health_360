// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'alcohol_substance_use_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlcoholSubstanceUseState _$AlcoholSubstanceUseStateFromJson(
    Map<String, dynamic> json) {
  return _AlcoholSubstanceUseState.fromJson(json);
}

/// @nodoc
class _$AlcoholSubstanceUseStateTearOff {
  const _$AlcoholSubstanceUseStateTearOff();

  _AlcoholSubstanceUseState call(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) {
    return _AlcoholSubstanceUseState(
      screeningQuestions: screeningQuestions,
      errorFetchingContent: errorFetchingContent,
      timeoutFetchingContent: timeoutFetchingContent,
    );
  }

  AlcoholSubstanceUseState fromJson(Map<String, Object?> json) {
    return AlcoholSubstanceUseState.fromJson(json);
  }
}

/// @nodoc
const $AlcoholSubstanceUseState = _$AlcoholSubstanceUseStateTearOff();

/// @nodoc
mixin _$AlcoholSubstanceUseState {
  @JsonKey(name: 'screeningQuestions')
  List<ScreeningQuestion>? get screeningQuestions =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingContent => throw _privateConstructorUsedError;
  bool? get timeoutFetchingContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlcoholSubstanceUseStateCopyWith<AlcoholSubstanceUseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlcoholSubstanceUseStateCopyWith<$Res> {
  factory $AlcoholSubstanceUseStateCopyWith(AlcoholSubstanceUseState value,
          $Res Function(AlcoholSubstanceUseState) then) =
      _$AlcoholSubstanceUseStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});
}

/// @nodoc
class _$AlcoholSubstanceUseStateCopyWithImpl<$Res>
    implements $AlcoholSubstanceUseStateCopyWith<$Res> {
  _$AlcoholSubstanceUseStateCopyWithImpl(this._value, this._then);

  final AlcoholSubstanceUseState _value;
  // ignore: unused_field
  final $Res Function(AlcoholSubstanceUseState) _then;

  @override
  $Res call({
    Object? screeningQuestions = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_value.copyWith(
      screeningQuestions: screeningQuestions == freezed
          ? _value.screeningQuestions
          : screeningQuestions // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestion>?,
      errorFetchingContent: errorFetchingContent == freezed
          ? _value.errorFetchingContent
          : errorFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingContent: timeoutFetchingContent == freezed
          ? _value.timeoutFetchingContent
          : timeoutFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$AlcoholSubstanceUseStateCopyWith<$Res>
    implements $AlcoholSubstanceUseStateCopyWith<$Res> {
  factory _$AlcoholSubstanceUseStateCopyWith(_AlcoholSubstanceUseState value,
          $Res Function(_AlcoholSubstanceUseState) then) =
      __$AlcoholSubstanceUseStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});
}

/// @nodoc
class __$AlcoholSubstanceUseStateCopyWithImpl<$Res>
    extends _$AlcoholSubstanceUseStateCopyWithImpl<$Res>
    implements _$AlcoholSubstanceUseStateCopyWith<$Res> {
  __$AlcoholSubstanceUseStateCopyWithImpl(_AlcoholSubstanceUseState _value,
      $Res Function(_AlcoholSubstanceUseState) _then)
      : super(_value, (v) => _then(v as _AlcoholSubstanceUseState));

  @override
  _AlcoholSubstanceUseState get _value =>
      super._value as _AlcoholSubstanceUseState;

  @override
  $Res call({
    Object? screeningQuestions = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_AlcoholSubstanceUseState(
      screeningQuestions: screeningQuestions == freezed
          ? _value.screeningQuestions
          : screeningQuestions // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestion>?,
      errorFetchingContent: errorFetchingContent == freezed
          ? _value.errorFetchingContent
          : errorFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingContent: timeoutFetchingContent == freezed
          ? _value.timeoutFetchingContent
          : timeoutFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlcoholSubstanceUseState implements _AlcoholSubstanceUseState {
  _$_AlcoholSubstanceUseState(
      {@JsonKey(name: 'screeningQuestions') this.screeningQuestions,
      this.errorFetchingContent,
      this.timeoutFetchingContent});

  factory _$_AlcoholSubstanceUseState.fromJson(Map<String, dynamic> json) =>
      _$$_AlcoholSubstanceUseStateFromJson(json);

  @override
  @JsonKey(name: 'screeningQuestions')
  final List<ScreeningQuestion>? screeningQuestions;
  @override
  final bool? errorFetchingContent;
  @override
  final bool? timeoutFetchingContent;

  @override
  String toString() {
    return 'AlcoholSubstanceUseState(screeningQuestions: $screeningQuestions, errorFetchingContent: $errorFetchingContent, timeoutFetchingContent: $timeoutFetchingContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlcoholSubstanceUseState &&
            const DeepCollectionEquality()
                .equals(other.screeningQuestions, screeningQuestions) &&
            const DeepCollectionEquality()
                .equals(other.errorFetchingContent, errorFetchingContent) &&
            const DeepCollectionEquality()
                .equals(other.timeoutFetchingContent, timeoutFetchingContent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(screeningQuestions),
      const DeepCollectionEquality().hash(errorFetchingContent),
      const DeepCollectionEquality().hash(timeoutFetchingContent));

  @JsonKey(ignore: true)
  @override
  _$AlcoholSubstanceUseStateCopyWith<_AlcoholSubstanceUseState> get copyWith =>
      __$AlcoholSubstanceUseStateCopyWithImpl<_AlcoholSubstanceUseState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlcoholSubstanceUseStateToJson(this);
  }
}

abstract class _AlcoholSubstanceUseState implements AlcoholSubstanceUseState {
  factory _AlcoholSubstanceUseState(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) = _$_AlcoholSubstanceUseState;

  factory _AlcoholSubstanceUseState.fromJson(Map<String, dynamic> json) =
      _$_AlcoholSubstanceUseState.fromJson;

  @override
  @JsonKey(name: 'screeningQuestions')
  List<ScreeningQuestion>? get screeningQuestions;
  @override
  bool? get errorFetchingContent;
  @override
  bool? get timeoutFetchingContent;
  @override
  @JsonKey(ignore: true)
  _$AlcoholSubstanceUseStateCopyWith<_AlcoholSubstanceUseState> get copyWith =>
      throw _privateConstructorUsedError;
}
