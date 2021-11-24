// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'security_questions_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SecurityQuestionsData _$SecurityQuestionsDataFromJson(
    Map<String, dynamic> json) {
  return _SecurityQuestionsData.fromJson(json);
}

/// @nodoc
class _$SecurityQuestionsDataTearOff {
  const _$SecurityQuestionsDataTearOff();

  _SecurityQuestionsData call(
      {@JsonKey(name: 'getSecurityQuestions')
          required List<SecurityQuestion> securityQuestions}) {
    return _SecurityQuestionsData(
      securityQuestions: securityQuestions,
    );
  }

  SecurityQuestionsData fromJson(Map<String, Object> json) {
    return SecurityQuestionsData.fromJson(json);
  }
}

/// @nodoc
const $SecurityQuestionsData = _$SecurityQuestionsDataTearOff();

/// @nodoc
mixin _$SecurityQuestionsData {
  @JsonKey(name: 'getSecurityQuestions')
  List<SecurityQuestion> get securityQuestions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecurityQuestionsDataCopyWith<SecurityQuestionsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityQuestionsDataCopyWith<$Res> {
  factory $SecurityQuestionsDataCopyWith(SecurityQuestionsData value,
          $Res Function(SecurityQuestionsData) then) =
      _$SecurityQuestionsDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getSecurityQuestions')
          List<SecurityQuestion> securityQuestions});
}

/// @nodoc
class _$SecurityQuestionsDataCopyWithImpl<$Res>
    implements $SecurityQuestionsDataCopyWith<$Res> {
  _$SecurityQuestionsDataCopyWithImpl(this._value, this._then);

  final SecurityQuestionsData _value;
  // ignore: unused_field
  final $Res Function(SecurityQuestionsData) _then;

  @override
  $Res call({
    Object? securityQuestions = freezed,
  }) {
    return _then(_value.copyWith(
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>,
    ));
  }
}

/// @nodoc
abstract class _$SecurityQuestionsDataCopyWith<$Res>
    implements $SecurityQuestionsDataCopyWith<$Res> {
  factory _$SecurityQuestionsDataCopyWith(_SecurityQuestionsData value,
          $Res Function(_SecurityQuestionsData) then) =
      __$SecurityQuestionsDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getSecurityQuestions')
          List<SecurityQuestion> securityQuestions});
}

/// @nodoc
class __$SecurityQuestionsDataCopyWithImpl<$Res>
    extends _$SecurityQuestionsDataCopyWithImpl<$Res>
    implements _$SecurityQuestionsDataCopyWith<$Res> {
  __$SecurityQuestionsDataCopyWithImpl(_SecurityQuestionsData _value,
      $Res Function(_SecurityQuestionsData) _then)
      : super(_value, (v) => _then(v as _SecurityQuestionsData));

  @override
  _SecurityQuestionsData get _value => super._value as _SecurityQuestionsData;

  @override
  $Res call({
    Object? securityQuestions = freezed,
  }) {
    return _then(_SecurityQuestionsData(
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SecurityQuestionsData implements _SecurityQuestionsData {
  _$_SecurityQuestionsData(
      {@JsonKey(name: 'getSecurityQuestions') required this.securityQuestions});

  factory _$_SecurityQuestionsData.fromJson(Map<String, dynamic> json) =>
      _$_$_SecurityQuestionsDataFromJson(json);

  @override
  @JsonKey(name: 'getSecurityQuestions')
  final List<SecurityQuestion> securityQuestions;

  @override
  String toString() {
    return 'SecurityQuestionsData(securityQuestions: $securityQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SecurityQuestionsData &&
            (identical(other.securityQuestions, securityQuestions) ||
                const DeepCollectionEquality()
                    .equals(other.securityQuestions, securityQuestions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(securityQuestions);

  @JsonKey(ignore: true)
  @override
  _$SecurityQuestionsDataCopyWith<_SecurityQuestionsData> get copyWith =>
      __$SecurityQuestionsDataCopyWithImpl<_SecurityQuestionsData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SecurityQuestionsDataToJson(this);
  }
}

abstract class _SecurityQuestionsData implements SecurityQuestionsData {
  factory _SecurityQuestionsData(
          {@JsonKey(name: 'getSecurityQuestions')
              required List<SecurityQuestion> securityQuestions}) =
      _$_SecurityQuestionsData;

  factory _SecurityQuestionsData.fromJson(Map<String, dynamic> json) =
      _$_SecurityQuestionsData.fromJson;

  @override
  @JsonKey(name: 'getSecurityQuestions')
  List<SecurityQuestion> get securityQuestions =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SecurityQuestionsDataCopyWith<_SecurityQuestionsData> get copyWith =>
      throw _privateConstructorUsedError;
}
