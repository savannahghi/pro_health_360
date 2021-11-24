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
      {@JsonKey(name: 'userID') String? userID,
      @JsonKey(name: 'securityQuestionID') String? securityQuestionID,
      @JsonKey(name: 'response') String? response}) {
    return _SecurityQuestionResponse(
      userID: userID,
      securityQuestionID: securityQuestionID,
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
  @JsonKey(name: 'userID')
  String? get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'securityQuestionID')
  String? get securityQuestionID => throw _privateConstructorUsedError;
  @JsonKey(name: 'response')
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
      {@JsonKey(name: 'userID') String? userID,
      @JsonKey(name: 'securityQuestionID') String? securityQuestionID,
      @JsonKey(name: 'response') String? response});
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
    Object? userID = freezed,
    Object? securityQuestionID = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      securityQuestionID: securityQuestionID == freezed
          ? _value.securityQuestionID
          : securityQuestionID // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'userID') String? userID,
      @JsonKey(name: 'securityQuestionID') String? securityQuestionID,
      @JsonKey(name: 'response') String? response});
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
    Object? userID = freezed,
    Object? securityQuestionID = freezed,
    Object? response = freezed,
  }) {
    return _then(_SecurityQuestionResponse(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      securityQuestionID: securityQuestionID == freezed
          ? _value.securityQuestionID
          : securityQuestionID // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'userID') this.userID,
      @JsonKey(name: 'securityQuestionID') this.securityQuestionID,
      @JsonKey(name: 'response') this.response});

  factory _$_SecurityQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_SecurityQuestionResponseFromJson(json);

  @override
  @JsonKey(name: 'userID')
  final String? userID;
  @override
  @JsonKey(name: 'securityQuestionID')
  final String? securityQuestionID;
  @override
  @JsonKey(name: 'response')
  final String? response;

  @override
  String toString() {
    return 'SecurityQuestionResponse(userID: $userID, securityQuestionID: $securityQuestionID, response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SecurityQuestionResponse &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.securityQuestionID, securityQuestionID) ||
                const DeepCollectionEquality()
                    .equals(other.securityQuestionID, securityQuestionID)) &&
            (identical(other.response, response) ||
                const DeepCollectionEquality()
                    .equals(other.response, response)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(securityQuestionID) ^
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
          {@JsonKey(name: 'userID') String? userID,
          @JsonKey(name: 'securityQuestionID') String? securityQuestionID,
          @JsonKey(name: 'response') String? response}) =
      _$_SecurityQuestionResponse;

  factory _SecurityQuestionResponse.fromJson(Map<String, dynamic> json) =
      _$_SecurityQuestionResponse.fromJson;

  @override
  @JsonKey(name: 'userID')
  String? get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'securityQuestionID')
  String? get securityQuestionID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'response')
  String? get response => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SecurityQuestionResponseCopyWith<_SecurityQuestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
