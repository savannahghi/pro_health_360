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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningQuestion _$ScreeningQuestionFromJson(Map<String, dynamic> json) {
  return _ScreeningQuestion.fromJson(json);
}

/// @nodoc
mixin _$ScreeningQuestion {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  String? get answer => throw _privateConstructorUsedError;
  @JsonKey(name: 'toolType')
  String? get toolType => throw _privateConstructorUsedError;
  @JsonKey(name: 'sequence')
  int? get sequence => throw _privateConstructorUsedError;
  @JsonKey(name: 'responseChoices')
  Map<String, dynamic>? get responseChoices =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  Map<String, dynamic>? get meta => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'question') String? questionText,
      @JsonKey(name: 'answer') String? answer,
      @JsonKey(name: 'toolType') String? toolType,
      @JsonKey(name: 'sequence') int? sequence,
      @JsonKey(name: 'responseChoices') Map<String, dynamic>? responseChoices,
      @JsonKey(name: 'meta') Map<String, dynamic>? meta});
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
    Object? answer = freezed,
    Object? toolType = freezed,
    Object? sequence = freezed,
    Object? responseChoices = freezed,
    Object? meta = freezed,
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
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      toolType: toolType == freezed
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      responseChoices: responseChoices == freezed
          ? _value.responseChoices
          : responseChoices // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ScreeningQuestionCopyWith<$Res>
    implements $ScreeningQuestionCopyWith<$Res> {
  factory _$$_ScreeningQuestionCopyWith(_$_ScreeningQuestion value,
          $Res Function(_$_ScreeningQuestion) then) =
      __$$_ScreeningQuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'question') String? questionText,
      @JsonKey(name: 'answer') String? answer,
      @JsonKey(name: 'toolType') String? toolType,
      @JsonKey(name: 'sequence') int? sequence,
      @JsonKey(name: 'responseChoices') Map<String, dynamic>? responseChoices,
      @JsonKey(name: 'meta') Map<String, dynamic>? meta});
}

/// @nodoc
class __$$_ScreeningQuestionCopyWithImpl<$Res>
    extends _$ScreeningQuestionCopyWithImpl<$Res>
    implements _$$_ScreeningQuestionCopyWith<$Res> {
  __$$_ScreeningQuestionCopyWithImpl(
      _$_ScreeningQuestion _value, $Res Function(_$_ScreeningQuestion) _then)
      : super(_value, (v) => _then(v as _$_ScreeningQuestion));

  @override
  _$_ScreeningQuestion get _value => super._value as _$_ScreeningQuestion;

  @override
  $Res call({
    Object? id = freezed,
    Object? questionText = freezed,
    Object? answer = freezed,
    Object? toolType = freezed,
    Object? sequence = freezed,
    Object? responseChoices = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$_ScreeningQuestion(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      questionText: questionText == freezed
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      toolType: toolType == freezed
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      responseChoices: responseChoices == freezed
          ? _value._responseChoices
          : responseChoices // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      meta: meta == freezed
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningQuestion implements _ScreeningQuestion {
  _$_ScreeningQuestion(
      {@JsonKey(name: 'id')
          this.id,
      @JsonKey(name: 'question')
          this.questionText,
      @JsonKey(name: 'answer')
          this.answer,
      @JsonKey(name: 'toolType')
          this.toolType,
      @JsonKey(name: 'sequence')
          this.sequence,
      @JsonKey(name: 'responseChoices')
          final Map<String, dynamic>? responseChoices,
      @JsonKey(name: 'meta')
          final Map<String, dynamic>? meta})
      : _responseChoices = responseChoices,
        _meta = meta;

  factory _$_ScreeningQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningQuestionFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'question')
  final String? questionText;
  @override
  @JsonKey(name: 'answer')
  final String? answer;
  @override
  @JsonKey(name: 'toolType')
  final String? toolType;
  @override
  @JsonKey(name: 'sequence')
  final int? sequence;
  final Map<String, dynamic>? _responseChoices;
  @override
  @JsonKey(name: 'responseChoices')
  Map<String, dynamic>? get responseChoices {
    final value = _responseChoices;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _meta;
  @override
  @JsonKey(name: 'meta')
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ScreeningQuestion(id: $id, questionText: $questionText, answer: $answer, toolType: $toolType, sequence: $sequence, responseChoices: $responseChoices, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningQuestion &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.questionText, questionText) &&
            const DeepCollectionEquality().equals(other.answer, answer) &&
            const DeepCollectionEquality().equals(other.toolType, toolType) &&
            const DeepCollectionEquality().equals(other.sequence, sequence) &&
            const DeepCollectionEquality()
                .equals(other._responseChoices, _responseChoices) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(questionText),
      const DeepCollectionEquality().hash(answer),
      const DeepCollectionEquality().hash(toolType),
      const DeepCollectionEquality().hash(sequence),
      const DeepCollectionEquality().hash(_responseChoices),
      const DeepCollectionEquality().hash(_meta));

  @JsonKey(ignore: true)
  @override
  _$$_ScreeningQuestionCopyWith<_$_ScreeningQuestion> get copyWith =>
      __$$_ScreeningQuestionCopyWithImpl<_$_ScreeningQuestion>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningQuestionToJson(this);
  }
}

abstract class _ScreeningQuestion implements ScreeningQuestion {
  factory _ScreeningQuestion(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'question')
          final String? questionText,
      @JsonKey(name: 'answer')
          final String? answer,
      @JsonKey(name: 'toolType')
          final String? toolType,
      @JsonKey(name: 'sequence')
          final int? sequence,
      @JsonKey(name: 'responseChoices')
          final Map<String, dynamic>? responseChoices,
      @JsonKey(name: 'meta')
          final Map<String, dynamic>? meta}) = _$_ScreeningQuestion;

  factory _ScreeningQuestion.fromJson(Map<String, dynamic> json) =
      _$_ScreeningQuestion.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'question')
  String? get questionText;
  @override
  @JsonKey(name: 'answer')
  String? get answer;
  @override
  @JsonKey(name: 'toolType')
  String? get toolType;
  @override
  @JsonKey(name: 'sequence')
  int? get sequence;
  @override
  @JsonKey(name: 'responseChoices')
  Map<String, dynamic>? get responseChoices;
  @override
  @JsonKey(name: 'meta')
  Map<String, dynamic>? get meta;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningQuestionCopyWith<_$_ScreeningQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
