// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reference _$ReferenceFromJson(Map<String, dynamic> json) {
  return _Reference.fromJson(json);
}

/// @nodoc
class _$ReferenceTearOff {
  const _$ReferenceTearOff();

  _Reference call(
      {@JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'display') String? display}) {
    return _Reference(
      reference: reference,
      display: display,
    );
  }

  Reference fromJson(Map<String, Object?> json) {
    return Reference.fromJson(json);
  }
}

/// @nodoc
const $Reference = _$ReferenceTearOff();

/// @nodoc
mixin _$Reference {
  /// A reference to a location at which the other resource is found.
  ///
  ///  The reference may be a relative reference, in which case it is
  ///  relative to the service base URL, or an absolute URL that resolves
  ///  to the location where the resource is found. The reference may be
  ///  version specific or not. If the reference is not to a FHIR RESTful
  ///  server, then it should be assumed to be version specific. Internal
  ///  fragment references (start with '#') refer to contained resources.
  @JsonKey(name: 'reference')
  String? get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'display')
  String? get display => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferenceCopyWith<Reference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferenceCopyWith<$Res> {
  factory $ReferenceCopyWith(Reference value, $Res Function(Reference) then) =
      _$ReferenceCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'display') String? display});
}

/// @nodoc
class _$ReferenceCopyWithImpl<$Res> implements $ReferenceCopyWith<$Res> {
  _$ReferenceCopyWithImpl(this._value, this._then);

  final Reference _value;
  // ignore: unused_field
  final $Res Function(Reference) _then;

  @override
  $Res call({
    Object? reference = freezed,
    Object? display = freezed,
  }) {
    return _then(_value.copyWith(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      display: display == freezed
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ReferenceCopyWith<$Res> implements $ReferenceCopyWith<$Res> {
  factory _$ReferenceCopyWith(
          _Reference value, $Res Function(_Reference) then) =
      __$ReferenceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'display') String? display});
}

/// @nodoc
class __$ReferenceCopyWithImpl<$Res> extends _$ReferenceCopyWithImpl<$Res>
    implements _$ReferenceCopyWith<$Res> {
  __$ReferenceCopyWithImpl(_Reference _value, $Res Function(_Reference) _then)
      : super(_value, (v) => _then(v as _Reference));

  @override
  _Reference get _value => super._value as _Reference;

  @override
  $Res call({
    Object? reference = freezed,
    Object? display = freezed,
  }) {
    return _then(_Reference(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      display: display == freezed
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reference implements _Reference {
  _$_Reference(
      {@JsonKey(name: 'reference') this.reference,
      @JsonKey(name: 'display') this.display});

  factory _$_Reference.fromJson(Map<String, dynamic> json) =>
      _$$_ReferenceFromJson(json);

  @override

  /// A reference to a location at which the other resource is found.
  ///
  ///  The reference may be a relative reference, in which case it is
  ///  relative to the service base URL, or an absolute URL that resolves
  ///  to the location where the resource is found. The reference may be
  ///  version specific or not. If the reference is not to a FHIR RESTful
  ///  server, then it should be assumed to be version specific. Internal
  ///  fragment references (start with '#') refer to contained resources.
  @JsonKey(name: 'reference')
  final String? reference;
  @override
  @JsonKey(name: 'display')
  final String? display;

  @override
  String toString() {
    return 'Reference(reference: $reference, display: $display)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reference &&
            const DeepCollectionEquality().equals(other.reference, reference) &&
            const DeepCollectionEquality().equals(other.display, display));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reference),
      const DeepCollectionEquality().hash(display));

  @JsonKey(ignore: true)
  @override
  _$ReferenceCopyWith<_Reference> get copyWith =>
      __$ReferenceCopyWithImpl<_Reference>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReferenceToJson(this);
  }
}

abstract class _Reference implements Reference {
  factory _Reference(
      {@JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'display') String? display}) = _$_Reference;

  factory _Reference.fromJson(Map<String, dynamic> json) =
      _$_Reference.fromJson;

  @override

  /// A reference to a location at which the other resource is found.
  ///
  ///  The reference may be a relative reference, in which case it is
  ///  relative to the service base URL, or an absolute URL that resolves
  ///  to the location where the resource is found. The reference may be
  ///  version specific or not. If the reference is not to a FHIR RESTful
  ///  server, then it should be assumed to be version specific. Internal
  ///  fragment references (start with '#') refer to contained resources.
  @JsonKey(name: 'reference')
  String? get reference;
  @override
  @JsonKey(name: 'display')
  String? get display;
  @override
  @JsonKey(ignore: true)
  _$ReferenceCopyWith<_Reference> get copyWith =>
      throw _privateConstructorUsedError;
}
