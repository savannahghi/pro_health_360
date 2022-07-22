// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_questions_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningQuestionsList _$ScreeningQuestionsListFromJson(
    Map<String, dynamic> json) {
  return _ScreeningQuestionsList.fromJson(json);
}

/// @nodoc
mixin _$ScreeningQuestionsList {
  @JsonKey(name: 'getScreeningToolQuestions')
  List<ScreeningQuestion>? get screeningQuestionsList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningQuestionsListCopyWith<ScreeningQuestionsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningQuestionsListCopyWith<$Res> {
  factory $ScreeningQuestionsListCopyWith(ScreeningQuestionsList value,
          $Res Function(ScreeningQuestionsList) then) =
      _$ScreeningQuestionsListCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getScreeningToolQuestions')
          List<ScreeningQuestion>? screeningQuestionsList});
}

/// @nodoc
class _$ScreeningQuestionsListCopyWithImpl<$Res>
    implements $ScreeningQuestionsListCopyWith<$Res> {
  _$ScreeningQuestionsListCopyWithImpl(this._value, this._then);

  final ScreeningQuestionsList _value;
  // ignore: unused_field
  final $Res Function(ScreeningQuestionsList) _then;

  @override
  $Res call({
    Object? screeningQuestionsList = freezed,
  }) {
    return _then(_value.copyWith(
      screeningQuestionsList: screeningQuestionsList == freezed
          ? _value.screeningQuestionsList
          : screeningQuestionsList // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestion>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ScreeningQuestionsListCopyWith<$Res>
    implements $ScreeningQuestionsListCopyWith<$Res> {
  factory _$$_ScreeningQuestionsListCopyWith(_$_ScreeningQuestionsList value,
          $Res Function(_$_ScreeningQuestionsList) then) =
      __$$_ScreeningQuestionsListCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getScreeningToolQuestions')
          List<ScreeningQuestion>? screeningQuestionsList});
}

/// @nodoc
class __$$_ScreeningQuestionsListCopyWithImpl<$Res>
    extends _$ScreeningQuestionsListCopyWithImpl<$Res>
    implements _$$_ScreeningQuestionsListCopyWith<$Res> {
  __$$_ScreeningQuestionsListCopyWithImpl(_$_ScreeningQuestionsList _value,
      $Res Function(_$_ScreeningQuestionsList) _then)
      : super(_value, (v) => _then(v as _$_ScreeningQuestionsList));

  @override
  _$_ScreeningQuestionsList get _value =>
      super._value as _$_ScreeningQuestionsList;

  @override
  $Res call({
    Object? screeningQuestionsList = freezed,
  }) {
    return _then(_$_ScreeningQuestionsList(
      screeningQuestionsList: screeningQuestionsList == freezed
          ? _value.screeningQuestionsList
          : screeningQuestionsList // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningQuestionsList implements _ScreeningQuestionsList {
  _$_ScreeningQuestionsList(
      {@JsonKey(name: 'getScreeningToolQuestions')
          this.screeningQuestionsList});

  factory _$_ScreeningQuestionsList.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningQuestionsListFromJson(json);

  @override
  @JsonKey(name: 'getScreeningToolQuestions')
  final List<ScreeningQuestion>? screeningQuestionsList;

  @override
  String toString() {
    return 'ScreeningQuestionsList(screeningQuestionsList: $screeningQuestionsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningQuestionsList &&
            const DeepCollectionEquality()
                .equals(other.screeningQuestionsList, screeningQuestionsList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(screeningQuestionsList));

  @JsonKey(ignore: true)
  @override
  _$$_ScreeningQuestionsListCopyWith<_$_ScreeningQuestionsList> get copyWith =>
      __$$_ScreeningQuestionsListCopyWithImpl<_$_ScreeningQuestionsList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningQuestionsListToJson(this);
  }
}

abstract class _ScreeningQuestionsList implements ScreeningQuestionsList {
  factory _ScreeningQuestionsList(
          {@JsonKey(name: 'getScreeningToolQuestions')
              final List<ScreeningQuestion>? screeningQuestionsList}) =
      _$_ScreeningQuestionsList;

  factory _ScreeningQuestionsList.fromJson(Map<String, dynamic> json) =
      _$_ScreeningQuestionsList.fromJson;

  @override
  @JsonKey(name: 'getScreeningToolQuestions')
  List<ScreeningQuestion>? get screeningQuestionsList;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningQuestionsListCopyWith<_$_ScreeningQuestionsList> get copyWith =>
      throw _privateConstructorUsedError;
}
