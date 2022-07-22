// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record_security_question_responses_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordSecurityQuestionResponsesData
    _$RecordSecurityQuestionResponsesDataFromJson(Map<String, dynamic> json) {
  return _RecordSecurityQuestionResponsesData.fromJson(json);
}

/// @nodoc
mixin _$RecordSecurityQuestionResponsesData {
  @JsonKey(name: 'recordSecurityQuestionResponses')
  List<RecordSecurityQuestionResponse> get recordSecurityQuestionResponses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordSecurityQuestionResponsesDataCopyWith<
          RecordSecurityQuestionResponsesData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordSecurityQuestionResponsesDataCopyWith<$Res> {
  factory $RecordSecurityQuestionResponsesDataCopyWith(
          RecordSecurityQuestionResponsesData value,
          $Res Function(RecordSecurityQuestionResponsesData) then) =
      _$RecordSecurityQuestionResponsesDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'recordSecurityQuestionResponses')
          List<RecordSecurityQuestionResponse>
              recordSecurityQuestionResponses});
}

/// @nodoc
class _$RecordSecurityQuestionResponsesDataCopyWithImpl<$Res>
    implements $RecordSecurityQuestionResponsesDataCopyWith<$Res> {
  _$RecordSecurityQuestionResponsesDataCopyWithImpl(this._value, this._then);

  final RecordSecurityQuestionResponsesData _value;
  // ignore: unused_field
  final $Res Function(RecordSecurityQuestionResponsesData) _then;

  @override
  $Res call({
    Object? recordSecurityQuestionResponses = freezed,
  }) {
    return _then(_value.copyWith(
      recordSecurityQuestionResponses: recordSecurityQuestionResponses ==
              freezed
          ? _value.recordSecurityQuestionResponses
          : recordSecurityQuestionResponses // ignore: cast_nullable_to_non_nullable
              as List<RecordSecurityQuestionResponse>,
    ));
  }
}

/// @nodoc
abstract class _$$_RecordSecurityQuestionResponsesDataCopyWith<$Res>
    implements $RecordSecurityQuestionResponsesDataCopyWith<$Res> {
  factory _$$_RecordSecurityQuestionResponsesDataCopyWith(
          _$_RecordSecurityQuestionResponsesData value,
          $Res Function(_$_RecordSecurityQuestionResponsesData) then) =
      __$$_RecordSecurityQuestionResponsesDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'recordSecurityQuestionResponses')
          List<RecordSecurityQuestionResponse>
              recordSecurityQuestionResponses});
}

/// @nodoc
class __$$_RecordSecurityQuestionResponsesDataCopyWithImpl<$Res>
    extends _$RecordSecurityQuestionResponsesDataCopyWithImpl<$Res>
    implements _$$_RecordSecurityQuestionResponsesDataCopyWith<$Res> {
  __$$_RecordSecurityQuestionResponsesDataCopyWithImpl(
      _$_RecordSecurityQuestionResponsesData _value,
      $Res Function(_$_RecordSecurityQuestionResponsesData) _then)
      : super(
            _value, (v) => _then(v as _$_RecordSecurityQuestionResponsesData));

  @override
  _$_RecordSecurityQuestionResponsesData get _value =>
      super._value as _$_RecordSecurityQuestionResponsesData;

  @override
  $Res call({
    Object? recordSecurityQuestionResponses = freezed,
  }) {
    return _then(_$_RecordSecurityQuestionResponsesData(
      recordSecurityQuestionResponses: recordSecurityQuestionResponses ==
              freezed
          ? _value._recordSecurityQuestionResponses
          : recordSecurityQuestionResponses // ignore: cast_nullable_to_non_nullable
              as List<RecordSecurityQuestionResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecordSecurityQuestionResponsesData
    implements _RecordSecurityQuestionResponsesData {
  _$_RecordSecurityQuestionResponsesData(
      {@JsonKey(name: 'recordSecurityQuestionResponses')
          required final List<RecordSecurityQuestionResponse>
              recordSecurityQuestionResponses})
      : _recordSecurityQuestionResponses = recordSecurityQuestionResponses;

  factory _$_RecordSecurityQuestionResponsesData.fromJson(
          Map<String, dynamic> json) =>
      _$$_RecordSecurityQuestionResponsesDataFromJson(json);

  final List<RecordSecurityQuestionResponse> _recordSecurityQuestionResponses;
  @override
  @JsonKey(name: 'recordSecurityQuestionResponses')
  List<RecordSecurityQuestionResponse> get recordSecurityQuestionResponses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recordSecurityQuestionResponses);
  }

  @override
  String toString() {
    return 'RecordSecurityQuestionResponsesData(recordSecurityQuestionResponses: $recordSecurityQuestionResponses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordSecurityQuestionResponsesData &&
            const DeepCollectionEquality().equals(
                other._recordSecurityQuestionResponses,
                _recordSecurityQuestionResponses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_recordSecurityQuestionResponses));

  @JsonKey(ignore: true)
  @override
  _$$_RecordSecurityQuestionResponsesDataCopyWith<
          _$_RecordSecurityQuestionResponsesData>
      get copyWith => __$$_RecordSecurityQuestionResponsesDataCopyWithImpl<
          _$_RecordSecurityQuestionResponsesData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordSecurityQuestionResponsesDataToJson(this);
  }
}

abstract class _RecordSecurityQuestionResponsesData
    implements RecordSecurityQuestionResponsesData {
  factory _RecordSecurityQuestionResponsesData(
          {@JsonKey(name: 'recordSecurityQuestionResponses')
              required final List<RecordSecurityQuestionResponse>
                  recordSecurityQuestionResponses}) =
      _$_RecordSecurityQuestionResponsesData;

  factory _RecordSecurityQuestionResponsesData.fromJson(
          Map<String, dynamic> json) =
      _$_RecordSecurityQuestionResponsesData.fromJson;

  @override
  @JsonKey(name: 'recordSecurityQuestionResponses')
  List<RecordSecurityQuestionResponse> get recordSecurityQuestionResponses;
  @override
  @JsonKey(ignore: true)
  _$$_RecordSecurityQuestionResponsesDataCopyWith<
          _$_RecordSecurityQuestionResponsesData>
      get copyWith => throw _privateConstructorUsedError;
}
