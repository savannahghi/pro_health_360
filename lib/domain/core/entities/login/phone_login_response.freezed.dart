// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'phone_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneLoginResponse _$PhoneLoginResponseFromJson(Map<String, dynamic> json) {
  return _PhoneLoginResponse.fromJson(json);
}

/// @nodoc
class _$PhoneLoginResponseTearOff {
  const _$PhoneLoginResponseTearOff();

  _PhoneLoginResponse call(
      {@JsonKey(name: 'data') PhoneLoginData? phoneLoginData}) {
    return _PhoneLoginResponse(
      phoneLoginData: phoneLoginData,
    );
  }

  PhoneLoginResponse fromJson(Map<String, Object> json) {
    return PhoneLoginResponse.fromJson(json);
  }
}

/// @nodoc
const $PhoneLoginResponse = _$PhoneLoginResponseTearOff();

/// @nodoc
mixin _$PhoneLoginResponse {
  @JsonKey(name: 'data')
  PhoneLoginData? get phoneLoginData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneLoginResponseCopyWith<PhoneLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneLoginResponseCopyWith<$Res> {
  factory $PhoneLoginResponseCopyWith(
          PhoneLoginResponse value, $Res Function(PhoneLoginResponse) then) =
      _$PhoneLoginResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'data') PhoneLoginData? phoneLoginData});

  $PhoneLoginDataCopyWith<$Res>? get phoneLoginData;
}

/// @nodoc
class _$PhoneLoginResponseCopyWithImpl<$Res>
    implements $PhoneLoginResponseCopyWith<$Res> {
  _$PhoneLoginResponseCopyWithImpl(this._value, this._then);

  final PhoneLoginResponse _value;
  // ignore: unused_field
  final $Res Function(PhoneLoginResponse) _then;

  @override
  $Res call({
    Object? phoneLoginData = freezed,
  }) {
    return _then(_value.copyWith(
      phoneLoginData: phoneLoginData == freezed
          ? _value.phoneLoginData
          : phoneLoginData // ignore: cast_nullable_to_non_nullable
              as PhoneLoginData?,
    ));
  }

  @override
  $PhoneLoginDataCopyWith<$Res>? get phoneLoginData {
    if (_value.phoneLoginData == null) {
      return null;
    }

    return $PhoneLoginDataCopyWith<$Res>(_value.phoneLoginData!, (value) {
      return _then(_value.copyWith(phoneLoginData: value));
    });
  }
}

/// @nodoc
abstract class _$PhoneLoginResponseCopyWith<$Res>
    implements $PhoneLoginResponseCopyWith<$Res> {
  factory _$PhoneLoginResponseCopyWith(
          _PhoneLoginResponse value, $Res Function(_PhoneLoginResponse) then) =
      __$PhoneLoginResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'data') PhoneLoginData? phoneLoginData});

  @override
  $PhoneLoginDataCopyWith<$Res>? get phoneLoginData;
}

/// @nodoc
class __$PhoneLoginResponseCopyWithImpl<$Res>
    extends _$PhoneLoginResponseCopyWithImpl<$Res>
    implements _$PhoneLoginResponseCopyWith<$Res> {
  __$PhoneLoginResponseCopyWithImpl(
      _PhoneLoginResponse _value, $Res Function(_PhoneLoginResponse) _then)
      : super(_value, (v) => _then(v as _PhoneLoginResponse));

  @override
  _PhoneLoginResponse get _value => super._value as _PhoneLoginResponse;

  @override
  $Res call({
    Object? phoneLoginData = freezed,
  }) {
    return _then(_PhoneLoginResponse(
      phoneLoginData: phoneLoginData == freezed
          ? _value.phoneLoginData
          : phoneLoginData // ignore: cast_nullable_to_non_nullable
              as PhoneLoginData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhoneLoginResponse implements _PhoneLoginResponse {
  _$_PhoneLoginResponse({@JsonKey(name: 'data') this.phoneLoginData});

  factory _$_PhoneLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_PhoneLoginResponseFromJson(json);

  @override
  @JsonKey(name: 'data')
  final PhoneLoginData? phoneLoginData;

  @override
  String toString() {
    return 'PhoneLoginResponse(phoneLoginData: $phoneLoginData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhoneLoginResponse &&
            (identical(other.phoneLoginData, phoneLoginData) ||
                const DeepCollectionEquality()
                    .equals(other.phoneLoginData, phoneLoginData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneLoginData);

  @JsonKey(ignore: true)
  @override
  _$PhoneLoginResponseCopyWith<_PhoneLoginResponse> get copyWith =>
      __$PhoneLoginResponseCopyWithImpl<_PhoneLoginResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PhoneLoginResponseToJson(this);
  }
}

abstract class _PhoneLoginResponse implements PhoneLoginResponse {
  factory _PhoneLoginResponse(
          {@JsonKey(name: 'data') PhoneLoginData? phoneLoginData}) =
      _$_PhoneLoginResponse;

  factory _PhoneLoginResponse.fromJson(Map<String, dynamic> json) =
      _$_PhoneLoginResponse.fromJson;

  @override
  @JsonKey(name: 'data')
  PhoneLoginData? get phoneLoginData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PhoneLoginResponseCopyWith<_PhoneLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
