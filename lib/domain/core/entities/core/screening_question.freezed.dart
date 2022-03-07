// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningQuestion _$ScreeningQuestionFromJson(Map<String, dynamic> json) {
  return _ScreeningQuestion.fromJson(json);
}

/// @nodoc
class _$ScreeningQuestionTearOff {
  const _$ScreeningQuestionTearOff();

  _ScreeningQuestion call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'questionText') String? questionText}) {
    return _ScreeningQuestion(
      id: id,
      questionText: questionText,
    );
  }

  ScreeningQuestion fromJson(Map<String, Object?> json) {
    return ScreeningQuestion.fromJson(json);
  }
}

/// @nodoc
const $ScreeningQuestion = _$ScreeningQuestionTearOff();

/// @nodoc
mixin _$ScreeningQuestion {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'questionText')
  String? get questionText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningQuestionCopyWith<ScreeningQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningQuestionCopyWith<$Res> {
  factory $ScreeningQuestionCopyWith(
          ScreeningQuestion value, $Res Function(ScreeningQuestion) then) =
      _$ScreeningQuestionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'questionText') String? questionText});
}

/// @nodoc
class _$ScreeningQuestionCopyWithImpl<$Res>
    implements $ScreeningQuestionCopyWith<$Res> {
  _$ScreeningQuestionCopyWithImpl(this._value, this._then);

  final ScreeningQuestion _value;
  // ignore: unused_field
  final $Res Function(ScreeningQuestion) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? questionText = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      questionText: questionText == freezed
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ScreeningQuestionCopyWith<$Res>
    implements $ScreeningQuestionCopyWith<$Res> {
  factory _$ScreeningQuestionCopyWith(
          _ScreeningQuestion value, $Res Function(_ScreeningQuestion) then) =
      __$ScreeningQuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'questionText') String? questionText});
}

/// @nodoc
class __$ScreeningQuestionCopyWithImpl<$Res>
    extends _$ScreeningQuestionCopyWithImpl<$Res>
    implements _$ScreeningQuestionCopyWith<$Res> {
  __$ScreeningQuestionCopyWithImpl(
      _ScreeningQuestion _value, $Res Function(_ScreeningQuestion) _then)
      : super(_value, (v) => _then(v as _ScreeningQuestion));

  @override
  _ScreeningQuestion get _value => super._value as _ScreeningQuestion;

  @override
  $Res call({
    Object? id = freezed,
    Object? questionText = freezed,
  }) {
    return _then(_ScreeningQuestion(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      questionText: questionText == freezed
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningQuestion implements _ScreeningQuestion {
  _$_ScreeningQuestion(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'questionText') this.questionText});

  factory _$_ScreeningQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningQuestionFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'questionText')
  final String? questionText;

  @override
  String toString() {
    return 'ScreeningQuestion(id: $id, questionText: $questionText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScreeningQuestion &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.questionText, questionText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(questionText));

  @JsonKey(ignore: true)
  @override
  _$ScreeningQuestionCopyWith<_ScreeningQuestion> get copyWith =>
      __$ScreeningQuestionCopyWithImpl<_ScreeningQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningQuestionToJson(this);
  }
}

abstract class _ScreeningQuestion implements ScreeningQuestion {
  factory _ScreeningQuestion(
          {@JsonKey(name: 'id') String? id,
          @JsonKey(name: 'questionText') String? questionText}) =
      _$_ScreeningQuestion;

  factory _ScreeningQuestion.fromJson(Map<String, dynamic> json) =
      _$_ScreeningQuestion.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'questionText')
  String? get questionText;
  @override
  @JsonKey(ignore: true)
  _$ScreeningQuestionCopyWith<_ScreeningQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
