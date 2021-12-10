// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'faq_content_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FAQContentResponse _$FAQContentResponseFromJson(Map<String, dynamic> json) {
  return _FAQContentResponse.fromJson(json);
}

/// @nodoc
class _$FAQContentResponseTearOff {
  const _$FAQContentResponseTearOff();

  _FAQContentResponse call(
      {@JsonKey(name: 'getFAQContent') List<FAQContent>? profileFAQsContent}) {
    return _FAQContentResponse(
      profileFAQsContent: profileFAQsContent,
    );
  }

  FAQContentResponse fromJson(Map<String, Object> json) {
    return FAQContentResponse.fromJson(json);
  }
}

/// @nodoc
const $FAQContentResponse = _$FAQContentResponseTearOff();

/// @nodoc
mixin _$FAQContentResponse {
  @JsonKey(name: 'getFAQContent')
  List<FAQContent>? get profileFAQsContent =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQContentResponseCopyWith<FAQContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQContentResponseCopyWith<$Res> {
  factory $FAQContentResponseCopyWith(
          FAQContentResponse value, $Res Function(FAQContentResponse) then) =
      _$FAQContentResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getFAQContent') List<FAQContent>? profileFAQsContent});
}

/// @nodoc
class _$FAQContentResponseCopyWithImpl<$Res>
    implements $FAQContentResponseCopyWith<$Res> {
  _$FAQContentResponseCopyWithImpl(this._value, this._then);

  final FAQContentResponse _value;
  // ignore: unused_field
  final $Res Function(FAQContentResponse) _then;

  @override
  $Res call({
    Object? profileFAQsContent = freezed,
  }) {
    return _then(_value.copyWith(
      profileFAQsContent: profileFAQsContent == freezed
          ? _value.profileFAQsContent
          : profileFAQsContent // ignore: cast_nullable_to_non_nullable
              as List<FAQContent>?,
    ));
  }
}

/// @nodoc
abstract class _$FAQContentResponseCopyWith<$Res>
    implements $FAQContentResponseCopyWith<$Res> {
  factory _$FAQContentResponseCopyWith(
          _FAQContentResponse value, $Res Function(_FAQContentResponse) then) =
      __$FAQContentResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getFAQContent') List<FAQContent>? profileFAQsContent});
}

/// @nodoc
class __$FAQContentResponseCopyWithImpl<$Res>
    extends _$FAQContentResponseCopyWithImpl<$Res>
    implements _$FAQContentResponseCopyWith<$Res> {
  __$FAQContentResponseCopyWithImpl(
      _FAQContentResponse _value, $Res Function(_FAQContentResponse) _then)
      : super(_value, (v) => _then(v as _FAQContentResponse));

  @override
  _FAQContentResponse get _value => super._value as _FAQContentResponse;

  @override
  $Res call({
    Object? profileFAQsContent = freezed,
  }) {
    return _then(_FAQContentResponse(
      profileFAQsContent: profileFAQsContent == freezed
          ? _value.profileFAQsContent
          : profileFAQsContent // ignore: cast_nullable_to_non_nullable
              as List<FAQContent>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FAQContentResponse implements _FAQContentResponse {
  _$_FAQContentResponse(
      {@JsonKey(name: 'getFAQContent') this.profileFAQsContent});

  factory _$_FAQContentResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_FAQContentResponseFromJson(json);

  @override
  @JsonKey(name: 'getFAQContent')
  final List<FAQContent>? profileFAQsContent;

  @override
  String toString() {
    return 'FAQContentResponse(profileFAQsContent: $profileFAQsContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FAQContentResponse &&
            (identical(other.profileFAQsContent, profileFAQsContent) ||
                const DeepCollectionEquality()
                    .equals(other.profileFAQsContent, profileFAQsContent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(profileFAQsContent);

  @JsonKey(ignore: true)
  @override
  _$FAQContentResponseCopyWith<_FAQContentResponse> get copyWith =>
      __$FAQContentResponseCopyWithImpl<_FAQContentResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FAQContentResponseToJson(this);
  }
}

abstract class _FAQContentResponse implements FAQContentResponse {
  factory _FAQContentResponse(
      {@JsonKey(name: 'getFAQContent')
          List<FAQContent>? profileFAQsContent}) = _$_FAQContentResponse;

  factory _FAQContentResponse.fromJson(Map<String, dynamic> json) =
      _$_FAQContentResponse.fromJson;

  @override
  @JsonKey(name: 'getFAQContent')
  List<FAQContent>? get profileFAQsContent =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FAQContentResponseCopyWith<_FAQContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
