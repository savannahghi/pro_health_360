// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record_security_question_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordSecurityQuestionResponse _$RecordSecurityQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return _RecordSecurityQuestionResponse.fromJson(json);
}

/// @nodoc
mixin _$RecordSecurityQuestionResponse {
  @JsonKey(name: 'securityQuestionID')
  String? get securityQuestionID => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCorrect')
  bool? get isCorrect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordSecurityQuestionResponseCopyWith<RecordSecurityQuestionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordSecurityQuestionResponseCopyWith<$Res> {
  factory $RecordSecurityQuestionResponseCopyWith(
          RecordSecurityQuestionResponse value,
          $Res Function(RecordSecurityQuestionResponse) then) =
      _$RecordSecurityQuestionResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'securityQuestionID') String? securityQuestionID,
      @JsonKey(name: 'isCorrect') bool? isCorrect});
}

/// @nodoc
class _$RecordSecurityQuestionResponseCopyWithImpl<$Res>
    implements $RecordSecurityQuestionResponseCopyWith<$Res> {
  _$RecordSecurityQuestionResponseCopyWithImpl(this._value, this._then);

  final RecordSecurityQuestionResponse _value;
  // ignore: unused_field
  final $Res Function(RecordSecurityQuestionResponse) _then;

  @override
  $Res call({
    Object? securityQuestionID = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_value.copyWith(
      securityQuestionID: securityQuestionID == freezed
          ? _value.securityQuestionID
          : securityQuestionID // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_RecordSecurityQuestionResponseCopyWith<$Res>
    implements $RecordSecurityQuestionResponseCopyWith<$Res> {
  factory _$$_RecordSecurityQuestionResponseCopyWith(
          _$_RecordSecurityQuestionResponse value,
          $Res Function(_$_RecordSecurityQuestionResponse) then) =
      __$$_RecordSecurityQuestionResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'securityQuestionID') String? securityQuestionID,
      @JsonKey(name: 'isCorrect') bool? isCorrect});
}

/// @nodoc
class __$$_RecordSecurityQuestionResponseCopyWithImpl<$Res>
    extends _$RecordSecurityQuestionResponseCopyWithImpl<$Res>
    implements _$$_RecordSecurityQuestionResponseCopyWith<$Res> {
  __$$_RecordSecurityQuestionResponseCopyWithImpl(
      _$_RecordSecurityQuestionResponse _value,
      $Res Function(_$_RecordSecurityQuestionResponse) _then)
      : super(_value, (v) => _then(v as _$_RecordSecurityQuestionResponse));

  @override
  _$_RecordSecurityQuestionResponse get _value =>
      super._value as _$_RecordSecurityQuestionResponse;

  @override
  $Res call({
    Object? securityQuestionID = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_$_RecordSecurityQuestionResponse(
      securityQuestionID: securityQuestionID == freezed
          ? _value.securityQuestionID
          : securityQuestionID // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecordSecurityQuestionResponse
    implements _RecordSecurityQuestionResponse {
  _$_RecordSecurityQuestionResponse(
      {@JsonKey(name: 'securityQuestionID') this.securityQuestionID,
      @JsonKey(name: 'isCorrect') this.isCorrect = true});

  factory _$_RecordSecurityQuestionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_RecordSecurityQuestionResponseFromJson(json);

  @override
  @JsonKey(name: 'securityQuestionID')
  final String? securityQuestionID;
  @override
  @JsonKey(name: 'isCorrect')
  final bool? isCorrect;

  @override
  String toString() {
    return 'RecordSecurityQuestionResponse(securityQuestionID: $securityQuestionID, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordSecurityQuestionResponse &&
            const DeepCollectionEquality()
                .equals(other.securityQuestionID, securityQuestionID) &&
            const DeepCollectionEquality().equals(other.isCorrect, isCorrect));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(securityQuestionID),
      const DeepCollectionEquality().hash(isCorrect));

  @JsonKey(ignore: true)
  @override
  _$$_RecordSecurityQuestionResponseCopyWith<_$_RecordSecurityQuestionResponse>
      get copyWith => __$$_RecordSecurityQuestionResponseCopyWithImpl<
          _$_RecordSecurityQuestionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordSecurityQuestionResponseToJson(this);
  }
}

abstract class _RecordSecurityQuestionResponse
    implements RecordSecurityQuestionResponse {
  factory _RecordSecurityQuestionResponse(
      {@JsonKey(name: 'securityQuestionID')
          final String? securityQuestionID,
      @JsonKey(name: 'isCorrect')
          final bool? isCorrect}) = _$_RecordSecurityQuestionResponse;

  factory _RecordSecurityQuestionResponse.fromJson(Map<String, dynamic> json) =
      _$_RecordSecurityQuestionResponse.fromJson;

  @override
  @JsonKey(name: 'securityQuestionID')
  String? get securityQuestionID;
  @override
  @JsonKey(name: 'isCorrect')
  bool? get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$$_RecordSecurityQuestionResponseCopyWith<_$_RecordSecurityQuestionResponse>
      get copyWith => throw _privateConstructorUsedError;
}
