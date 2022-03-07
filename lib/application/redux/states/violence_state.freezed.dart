// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'violence_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViolenceState _$ViolenceStateFromJson(Map<String, dynamic> json) {
  return _ViolenceState.fromJson(json);
}

/// @nodoc
class _$ViolenceStateTearOff {
  const _$ViolenceStateTearOff();

  _ViolenceState call(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) {
    return _ViolenceState(
      screeningQuestions: screeningQuestions,
      errorFetchingContent: errorFetchingContent,
      timeoutFetchingContent: timeoutFetchingContent,
    );
  }

  ViolenceState fromJson(Map<String, Object?> json) {
    return ViolenceState.fromJson(json);
  }
}

/// @nodoc
const $ViolenceState = _$ViolenceStateTearOff();

/// @nodoc
mixin _$ViolenceState {
  @JsonKey(name: 'screeningQuestions')
  List<ScreeningQuestion>? get screeningQuestions =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingContent => throw _privateConstructorUsedError;
  bool? get timeoutFetchingContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViolenceStateCopyWith<ViolenceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolenceStateCopyWith<$Res> {
  factory $ViolenceStateCopyWith(
          ViolenceState value, $Res Function(ViolenceState) then) =
      _$ViolenceStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});
}

/// @nodoc
class _$ViolenceStateCopyWithImpl<$Res>
    implements $ViolenceStateCopyWith<$Res> {
  _$ViolenceStateCopyWithImpl(this._value, this._then);

  final ViolenceState _value;
  // ignore: unused_field
  final $Res Function(ViolenceState) _then;

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
abstract class _$ViolenceStateCopyWith<$Res>
    implements $ViolenceStateCopyWith<$Res> {
  factory _$ViolenceStateCopyWith(
          _ViolenceState value, $Res Function(_ViolenceState) then) =
      __$ViolenceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});
}

/// @nodoc
class __$ViolenceStateCopyWithImpl<$Res>
    extends _$ViolenceStateCopyWithImpl<$Res>
    implements _$ViolenceStateCopyWith<$Res> {
  __$ViolenceStateCopyWithImpl(
      _ViolenceState _value, $Res Function(_ViolenceState) _then)
      : super(_value, (v) => _then(v as _ViolenceState));

  @override
  _ViolenceState get _value => super._value as _ViolenceState;

  @override
  $Res call({
    Object? screeningQuestions = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_ViolenceState(
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
class _$_ViolenceState implements _ViolenceState {
  _$_ViolenceState(
      {@JsonKey(name: 'screeningQuestions') this.screeningQuestions,
      this.errorFetchingContent,
      this.timeoutFetchingContent});

  factory _$_ViolenceState.fromJson(Map<String, dynamic> json) =>
      _$$_ViolenceStateFromJson(json);

  @override
  @JsonKey(name: 'screeningQuestions')
  final List<ScreeningQuestion>? screeningQuestions;
  @override
  final bool? errorFetchingContent;
  @override
  final bool? timeoutFetchingContent;

  @override
  String toString() {
    return 'ViolenceState(screeningQuestions: $screeningQuestions, errorFetchingContent: $errorFetchingContent, timeoutFetchingContent: $timeoutFetchingContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViolenceState &&
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
  _$ViolenceStateCopyWith<_ViolenceState> get copyWith =>
      __$ViolenceStateCopyWithImpl<_ViolenceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViolenceStateToJson(this);
  }
}

abstract class _ViolenceState implements ViolenceState {
  factory _ViolenceState(
      {@JsonKey(name: 'screeningQuestions')
          List<ScreeningQuestion>? screeningQuestions,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) = _$_ViolenceState;

  factory _ViolenceState.fromJson(Map<String, dynamic> json) =
      _$_ViolenceState.fromJson;

  @override
  @JsonKey(name: 'screeningQuestions')
  List<ScreeningQuestion>? get screeningQuestions;
  @override
  bool? get errorFetchingContent;
  @override
  bool? get timeoutFetchingContent;
  @override
  @JsonKey(ignore: true)
  _$ViolenceStateCopyWith<_ViolenceState> get copyWith =>
      throw _privateConstructorUsedError;
}
