// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'security_question_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SecurityQuestionResponse _$SecurityQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return _SecurityQuestionResponse.fromJson(json);
}

/// @nodoc
class _$SecurityQuestionResponseTearOff {
  const _$SecurityQuestionResponseTearOff();

  _SecurityQuestionResponse call(
      {String? id,
      String? timeStamp,
      String? userId,
      String? securityQuestionId,
      String? response}) {
    return _SecurityQuestionResponse(
      id: id,
      timeStamp: timeStamp,
      userId: userId,
      securityQuestionId: securityQuestionId,
      response: response,
    );
  }

  SecurityQuestionResponse fromJson(Map<String, Object> json) {
    return SecurityQuestionResponse.fromJson(json);
  }
}

/// @nodoc
const $SecurityQuestionResponse = _$SecurityQuestionResponseTearOff();

/// @nodoc
mixin _$SecurityQuestionResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get timeStamp => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get securityQuestionId => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecurityQuestionResponseCopyWith<SecurityQuestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityQuestionResponseCopyWith<$Res> {
  factory $SecurityQuestionResponseCopyWith(SecurityQuestionResponse value,
          $Res Function(SecurityQuestionResponse) then) =
      _$SecurityQuestionResponseCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? timeStamp,
      String? userId,
      String? securityQuestionId,
      String? response});
}

/// @nodoc
class _$SecurityQuestionResponseCopyWithImpl<$Res>
    implements $SecurityQuestionResponseCopyWith<$Res> {
  _$SecurityQuestionResponseCopyWithImpl(this._value, this._then);

  final SecurityQuestionResponse _value;
  // ignore: unused_field
  final $Res Function(SecurityQuestionResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? timeStamp = freezed,
    Object? userId = freezed,
    Object? securityQuestionId = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: timeStamp == freezed
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      securityQuestionId: securityQuestionId == freezed
          ? _value.securityQuestionId
          : securityQuestionId // ignore: cast_nullable_to_non_nullable
              as String?,
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SecurityQuestionResponseCopyWith<$Res>
    implements $SecurityQuestionResponseCopyWith<$Res> {
  factory _$SecurityQuestionResponseCopyWith(_SecurityQuestionResponse value,
          $Res Function(_SecurityQuestionResponse) then) =
      __$SecurityQuestionResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? timeStamp,
      String? userId,
      String? securityQuestionId,
      String? response});
}

/// @nodoc
class __$SecurityQuestionResponseCopyWithImpl<$Res>
    extends _$SecurityQuestionResponseCopyWithImpl<$Res>
    implements _$SecurityQuestionResponseCopyWith<$Res> {
  __$SecurityQuestionResponseCopyWithImpl(_SecurityQuestionResponse _value,
      $Res Function(_SecurityQuestionResponse) _then)
      : super(_value, (v) => _then(v as _SecurityQuestionResponse));

  @override
  _SecurityQuestionResponse get _value =>
      super._value as _SecurityQuestionResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? timeStamp = freezed,
    Object? userId = freezed,
    Object? securityQuestionId = freezed,
    Object? response = freezed,
  }) {
    return _then(_SecurityQuestionResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: timeStamp == freezed
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      securityQuestionId: securityQuestionId == freezed
          ? _value.securityQuestionId
          : securityQuestionId // ignore: cast_nullable_to_non_nullable
              as String?,
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SecurityQuestionResponse implements _SecurityQuestionResponse {
  _$_SecurityQuestionResponse(
      {this.id,
      this.timeStamp,
      this.userId,
      this.securityQuestionId,
      this.response});

  factory _$_SecurityQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_SecurityQuestionResponseFromJson(json);

  @override
  final String? id;
  @override
  final String? timeStamp;
  @override
  final String? userId;
  @override
  final String? securityQuestionId;
  @override
  final String? response;

  @override
  String toString() {
    return 'SecurityQuestionResponse(id: $id, timeStamp: $timeStamp, userId: $userId, securityQuestionId: $securityQuestionId, response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SecurityQuestionResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.timeStamp, timeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.timeStamp, timeStamp)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.securityQuestionId, securityQuestionId) ||
                const DeepCollectionEquality()
                    .equals(other.securityQuestionId, securityQuestionId)) &&
            (identical(other.response, response) ||
                const DeepCollectionEquality()
                    .equals(other.response, response)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(timeStamp) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(securityQuestionId) ^
      const DeepCollectionEquality().hash(response);

  @JsonKey(ignore: true)
  @override
  _$SecurityQuestionResponseCopyWith<_SecurityQuestionResponse> get copyWith =>
      __$SecurityQuestionResponseCopyWithImpl<_SecurityQuestionResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SecurityQuestionResponseToJson(this);
  }
}

abstract class _SecurityQuestionResponse implements SecurityQuestionResponse {
  factory _SecurityQuestionResponse(
      {String? id,
      String? timeStamp,
      String? userId,
      String? securityQuestionId,
      String? response}) = _$_SecurityQuestionResponse;

  factory _SecurityQuestionResponse.fromJson(Map<String, dynamic> json) =
      _$_SecurityQuestionResponse.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get timeStamp => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  String? get securityQuestionId => throw _privateConstructorUsedError;
  @override
  String? get response => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SecurityQuestionResponseCopyWith<_SecurityQuestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
