// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tb_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TBState _$TBStateFromJson(Map<String, dynamic> json) {
  return _TBState.fromJson(json);
}

/// @nodoc
mixin _$TBState {
  @JsonKey(name: 'getScreeningToolQuestions')
  ScreeningQuestionsList? get screeningQuestions =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingQuestions => throw _privateConstructorUsedError;
  bool? get timeoutFetchingQuestions => throw _privateConstructorUsedError;
  bool? get errorAnsweringQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TBStateCopyWith<TBState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TBStateCopyWith<$Res> {
  factory $TBStateCopyWith(TBState value, $Res Function(TBState) then) =
      _$TBStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getScreeningToolQuestions')
          ScreeningQuestionsList? screeningQuestions,
      bool? errorFetchingQuestions,
      bool? timeoutFetchingQuestions,
      bool? errorAnsweringQuestions});

  $ScreeningQuestionsListCopyWith<$Res>? get screeningQuestions;
}

/// @nodoc
class _$TBStateCopyWithImpl<$Res> implements $TBStateCopyWith<$Res> {
  _$TBStateCopyWithImpl(this._value, this._then);

  final TBState _value;
  // ignore: unused_field
  final $Res Function(TBState) _then;

  @override
  $Res call({
    Object? screeningQuestions = freezed,
    Object? errorFetchingQuestions = freezed,
    Object? timeoutFetchingQuestions = freezed,
    Object? errorAnsweringQuestions = freezed,
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
      timeoutFetchingQuestions: timeoutFetchingQuestions == freezed
          ? _value.timeoutFetchingQuestions
          : timeoutFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorAnsweringQuestions: errorAnsweringQuestions == freezed
          ? _value.errorAnsweringQuestions
          : errorAnsweringQuestions // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_TBStateCopyWith<$Res> implements $TBStateCopyWith<$Res> {
  factory _$$_TBStateCopyWith(
          _$_TBState value, $Res Function(_$_TBState) then) =
      __$$_TBStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getScreeningToolQuestions')
          ScreeningQuestionsList? screeningQuestions,
      bool? errorFetchingQuestions,
      bool? timeoutFetchingQuestions,
      bool? errorAnsweringQuestions});

  @override
  $ScreeningQuestionsListCopyWith<$Res>? get screeningQuestions;
}

/// @nodoc
class __$$_TBStateCopyWithImpl<$Res> extends _$TBStateCopyWithImpl<$Res>
    implements _$$_TBStateCopyWith<$Res> {
  __$$_TBStateCopyWithImpl(_$_TBState _value, $Res Function(_$_TBState) _then)
      : super(_value, (v) => _then(v as _$_TBState));

  @override
  _$_TBState get _value => super._value as _$_TBState;

  @override
  $Res call({
    Object? screeningQuestions = freezed,
    Object? errorFetchingQuestions = freezed,
    Object? timeoutFetchingQuestions = freezed,
    Object? errorAnsweringQuestions = freezed,
  }) {
    return _then(_$_TBState(
      screeningQuestions: screeningQuestions == freezed
          ? _value.screeningQuestions
          : screeningQuestions // ignore: cast_nullable_to_non_nullable
              as ScreeningQuestionsList?,
      errorFetchingQuestions: errorFetchingQuestions == freezed
          ? _value.errorFetchingQuestions
          : errorFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingQuestions: timeoutFetchingQuestions == freezed
          ? _value.timeoutFetchingQuestions
          : timeoutFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorAnsweringQuestions: errorAnsweringQuestions == freezed
          ? _value.errorAnsweringQuestions
          : errorAnsweringQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TBState implements _TBState {
  _$_TBState(
      {@JsonKey(name: 'getScreeningToolQuestions') this.screeningQuestions,
      this.errorFetchingQuestions,
      this.timeoutFetchingQuestions,
      this.errorAnsweringQuestions});

  factory _$_TBState.fromJson(Map<String, dynamic> json) =>
      _$$_TBStateFromJson(json);

  @override
  @JsonKey(name: 'getScreeningToolQuestions')
  final ScreeningQuestionsList? screeningQuestions;
  @override
  final bool? errorFetchingQuestions;
  @override
  final bool? timeoutFetchingQuestions;
  @override
  final bool? errorAnsweringQuestions;

  @override
  String toString() {
    return 'TBState(screeningQuestions: $screeningQuestions, errorFetchingQuestions: $errorFetchingQuestions, timeoutFetchingQuestions: $timeoutFetchingQuestions, errorAnsweringQuestions: $errorAnsweringQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TBState &&
            const DeepCollectionEquality()
                .equals(other.screeningQuestions, screeningQuestions) &&
            const DeepCollectionEquality()
                .equals(other.errorFetchingQuestions, errorFetchingQuestions) &&
            const DeepCollectionEquality().equals(
                other.timeoutFetchingQuestions, timeoutFetchingQuestions) &&
            const DeepCollectionEquality().equals(
                other.errorAnsweringQuestions, errorAnsweringQuestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(screeningQuestions),
      const DeepCollectionEquality().hash(errorFetchingQuestions),
      const DeepCollectionEquality().hash(timeoutFetchingQuestions),
      const DeepCollectionEquality().hash(errorAnsweringQuestions));

  @JsonKey(ignore: true)
  @override
  _$$_TBStateCopyWith<_$_TBState> get copyWith =>
      __$$_TBStateCopyWithImpl<_$_TBState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TBStateToJson(this);
  }
}

abstract class _TBState implements TBState {
  factory _TBState(
      {@JsonKey(name: 'getScreeningToolQuestions')
          final ScreeningQuestionsList? screeningQuestions,
      final bool? errorFetchingQuestions,
      final bool? timeoutFetchingQuestions,
      final bool? errorAnsweringQuestions}) = _$_TBState;

  factory _TBState.fromJson(Map<String, dynamic> json) = _$_TBState.fromJson;

  @override
  @JsonKey(name: 'getScreeningToolQuestions')
  ScreeningQuestionsList? get screeningQuestions;
  @override
  bool? get errorFetchingQuestions;
  @override
  bool? get timeoutFetchingQuestions;
  @override
  bool? get errorAnsweringQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_TBStateCopyWith<_$_TBState> get copyWith =>
      throw _privateConstructorUsedError;
}
