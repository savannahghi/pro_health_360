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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContraceptiveState _$ContraceptiveStateFromJson(Map<String, dynamic> json) {
  return _ContraceptiveState.fromJson(json);
}

/// @nodoc
mixin _$ContraceptiveState {
  @JsonKey(name: 'getScreeningToolQuestions')
  ScreeningQuestionsList? get screeningQuestions =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingQuestions => throw _privateConstructorUsedError;
  bool? get errorAnsweringQuestions => throw _privateConstructorUsedError;
  bool? get timeoutFetchingQuestions => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'getScreeningToolQuestions')
          ScreeningQuestionsList? screeningQuestions,
      bool? errorFetchingQuestions,
      bool? errorAnsweringQuestions,
      bool? timeoutFetchingQuestions});

  $ScreeningQuestionsListCopyWith<$Res>? get screeningQuestions;
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
    Object? errorFetchingQuestions = freezed,
    Object? errorAnsweringQuestions = freezed,
    Object? timeoutFetchingQuestions = freezed,
  }) {
    return _then(_value.copyWith(
      screeningQuestions: screeningQuestions == freezed
          ? _value.screeningQuestions
          : screeningQuestions // ignore: cast_nullable_to_non_nullable
              as ScreeningQuestionsList?,
      errorFetchingQuestions: errorFetchingQuestions == freezed
          ? _value.errorFetchingQuestions
          : errorFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorAnsweringQuestions: errorAnsweringQuestions == freezed
          ? _value.errorAnsweringQuestions
          : errorAnsweringQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingQuestions: timeoutFetchingQuestions == freezed
          ? _value.timeoutFetchingQuestions
          : timeoutFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $ScreeningQuestionsListCopyWith<$Res>? get screeningQuestions {
    if (_value.screeningQuestions == null) {
      return null;
    }

    return $ScreeningQuestionsListCopyWith<$Res>(_value.screeningQuestions!,
        (value) {
      return _then(_value.copyWith(screeningQuestions: value));
    });
  }
}

/// @nodoc
abstract class _$$_ContraceptiveStateCopyWith<$Res>
    implements $ContraceptiveStateCopyWith<$Res> {
  factory _$$_ContraceptiveStateCopyWith(_$_ContraceptiveState value,
          $Res Function(_$_ContraceptiveState) then) =
      __$$_ContraceptiveStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getScreeningToolQuestions')
          ScreeningQuestionsList? screeningQuestions,
      bool? errorFetchingQuestions,
      bool? errorAnsweringQuestions,
      bool? timeoutFetchingQuestions});

  @override
  $ScreeningQuestionsListCopyWith<$Res>? get screeningQuestions;
}

/// @nodoc
class __$$_ContraceptiveStateCopyWithImpl<$Res>
    extends _$ContraceptiveStateCopyWithImpl<$Res>
    implements _$$_ContraceptiveStateCopyWith<$Res> {
  __$$_ContraceptiveStateCopyWithImpl(
      _$_ContraceptiveState _value, $Res Function(_$_ContraceptiveState) _then)
      : super(_value, (v) => _then(v as _$_ContraceptiveState));

  @override
  _$_ContraceptiveState get _value => super._value as _$_ContraceptiveState;

  @override
  $Res call({
    Object? screeningQuestions = freezed,
    Object? errorFetchingQuestions = freezed,
    Object? errorAnsweringQuestions = freezed,
    Object? timeoutFetchingQuestions = freezed,
  }) {
    return _then(_$_ContraceptiveState(
      screeningQuestions: screeningQuestions == freezed
          ? _value.screeningQuestions
          : screeningQuestions // ignore: cast_nullable_to_non_nullable
              as ScreeningQuestionsList?,
      errorFetchingQuestions: errorFetchingQuestions == freezed
          ? _value.errorFetchingQuestions
          : errorFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorAnsweringQuestions: errorAnsweringQuestions == freezed
          ? _value.errorAnsweringQuestions
          : errorAnsweringQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingQuestions: timeoutFetchingQuestions == freezed
          ? _value.timeoutFetchingQuestions
          : timeoutFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContraceptiveState implements _ContraceptiveState {
  _$_ContraceptiveState(
      {@JsonKey(name: 'getScreeningToolQuestions') this.screeningQuestions,
      this.errorFetchingQuestions,
      this.errorAnsweringQuestions,
      this.timeoutFetchingQuestions});

  factory _$_ContraceptiveState.fromJson(Map<String, dynamic> json) =>
      _$$_ContraceptiveStateFromJson(json);

  @override
  @JsonKey(name: 'getScreeningToolQuestions')
  final ScreeningQuestionsList? screeningQuestions;
  @override
  final bool? errorFetchingQuestions;
  @override
  final bool? errorAnsweringQuestions;
  @override
  final bool? timeoutFetchingQuestions;

  @override
  String toString() {
    return 'ContraceptiveState(screeningQuestions: $screeningQuestions, errorFetchingQuestions: $errorFetchingQuestions, errorAnsweringQuestions: $errorAnsweringQuestions, timeoutFetchingQuestions: $timeoutFetchingQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContraceptiveState &&
            const DeepCollectionEquality()
                .equals(other.screeningQuestions, screeningQuestions) &&
            const DeepCollectionEquality()
                .equals(other.errorFetchingQuestions, errorFetchingQuestions) &&
            const DeepCollectionEquality().equals(
                other.errorAnsweringQuestions, errorAnsweringQuestions) &&
            const DeepCollectionEquality().equals(
                other.timeoutFetchingQuestions, timeoutFetchingQuestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(screeningQuestions),
      const DeepCollectionEquality().hash(errorFetchingQuestions),
      const DeepCollectionEquality().hash(errorAnsweringQuestions),
      const DeepCollectionEquality().hash(timeoutFetchingQuestions));

  @JsonKey(ignore: true)
  @override
  _$$_ContraceptiveStateCopyWith<_$_ContraceptiveState> get copyWith =>
      __$$_ContraceptiveStateCopyWithImpl<_$_ContraceptiveState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContraceptiveStateToJson(this);
  }
}

abstract class _ContraceptiveState implements ContraceptiveState {
  factory _ContraceptiveState(
      {@JsonKey(name: 'getScreeningToolQuestions')
          final ScreeningQuestionsList? screeningQuestions,
      final bool? errorFetchingQuestions,
      final bool? errorAnsweringQuestions,
      final bool? timeoutFetchingQuestions}) = _$_ContraceptiveState;

  factory _ContraceptiveState.fromJson(Map<String, dynamic> json) =
      _$_ContraceptiveState.fromJson;

  @override
  @JsonKey(name: 'getScreeningToolQuestions')
  ScreeningQuestionsList? get screeningQuestions =>
      throw _privateConstructorUsedError;
  @override
  bool? get errorFetchingQuestions => throw _privateConstructorUsedError;
  @override
  bool? get errorAnsweringQuestions => throw _privateConstructorUsedError;
  @override
  bool? get timeoutFetchingQuestions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ContraceptiveStateCopyWith<_$_ContraceptiveState> get copyWith =>
      throw _privateConstructorUsedError;
}
