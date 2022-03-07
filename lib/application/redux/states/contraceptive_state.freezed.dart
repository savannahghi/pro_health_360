// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contraceptive_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContraceptiveState _$ContraceptiveStateFromJson(Map<String, dynamic> json) {
  return _ContraceptiveState.fromJson(json);
}

/// @nodoc
class _$ContraceptiveStateTearOff {
  const _$ContraceptiveStateTearOff();

  _ContraceptiveState call(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) {
    return _ContraceptiveState(
      screeningQuestions: screeningQuestions,
      errorFetchingContent: errorFetchingContent,
      timeoutFetchingContent: timeoutFetchingContent,
    );
  }

  ContraceptiveState fromJson(Map<String, Object?> json) {
    return ContraceptiveState.fromJson(json);
  }
}

/// @nodoc
const $ContraceptiveState = _$ContraceptiveStateTearOff();

/// @nodoc
mixin _$ContraceptiveState {
  @JsonKey(name: 'screeningQuestions')
  List<ScreeningQuestion>? get screeningQuestions =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingContent => throw _privateConstructorUsedError;
  bool? get timeoutFetchingContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContraceptiveStateCopyWith<ContraceptiveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContraceptiveStateCopyWith<$Res> {
  factory $ContraceptiveStateCopyWith(
          ContraceptiveState value, $Res Function(ContraceptiveState) then) =
      _$ContraceptiveStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});
}

/// @nodoc
class _$ContraceptiveStateCopyWithImpl<$Res>
    implements $ContraceptiveStateCopyWith<$Res> {
  _$ContraceptiveStateCopyWithImpl(this._value, this._then);

  final ContraceptiveState _value;
  // ignore: unused_field
  final $Res Function(ContraceptiveState) _then;

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
abstract class _$ContraceptiveStateCopyWith<$Res>
    implements $ContraceptiveStateCopyWith<$Res> {
  factory _$ContraceptiveStateCopyWith(
          _ContraceptiveState value, $Res Function(_ContraceptiveState) then) =
      __$ContraceptiveStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});
}

/// @nodoc
class __$ContraceptiveStateCopyWithImpl<$Res>
    extends _$ContraceptiveStateCopyWithImpl<$Res>
    implements _$ContraceptiveStateCopyWith<$Res> {
  __$ContraceptiveStateCopyWithImpl(
      _ContraceptiveState _value, $Res Function(_ContraceptiveState) _then)
      : super(_value, (v) => _then(v as _ContraceptiveState));

  @override
  _ContraceptiveState get _value => super._value as _ContraceptiveState;

  @override
  $Res call({
    Object? screeningQuestions = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_ContraceptiveState(
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
class _$_ContraceptiveState implements _ContraceptiveState {
  _$_ContraceptiveState(
      {@JsonKey(name: 'screeningQuestions') this.screeningQuestions,
      this.errorFetchingContent,
      this.timeoutFetchingContent});

  factory _$_ContraceptiveState.fromJson(Map<String, dynamic> json) =>
      _$$_ContraceptiveStateFromJson(json);

  @override
  @JsonKey(name: 'screeningQuestions')
  final List<ScreeningQuestion>? screeningQuestions;
  @override
  final bool? errorFetchingContent;
  @override
  final bool? timeoutFetchingContent;

  @override
  String toString() {
    return 'ContraceptiveState(screeningQuestions: $screeningQuestions, errorFetchingContent: $errorFetchingContent, timeoutFetchingContent: $timeoutFetchingContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContraceptiveState &&
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
  _$ContraceptiveStateCopyWith<_ContraceptiveState> get copyWith =>
      __$ContraceptiveStateCopyWithImpl<_ContraceptiveState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContraceptiveStateToJson(this);
  }
}

abstract class _ContraceptiveState implements ContraceptiveState {
  factory _ContraceptiveState(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) = _$_ContraceptiveState;

  factory _ContraceptiveState.fromJson(Map<String, dynamic> json) =
      _$_ContraceptiveState.fromJson;

  @override
  @JsonKey(name: 'screeningQuestions')
  List<ScreeningQuestion>? get screeningQuestions;
  @override
  bool? get errorFetchingContent;
  @override
  bool? get timeoutFetchingContent;
  @override
  @JsonKey(ignore: true)
  _$ContraceptiveStateCopyWith<_ContraceptiveState> get copyWith =>
      throw _privateConstructorUsedError;
}
