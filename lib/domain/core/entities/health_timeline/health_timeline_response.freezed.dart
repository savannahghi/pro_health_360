// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'health_timeline_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HealthTimelineResponse _$HealthTimelineResponseFromJson(
    Map<String, dynamic> json) {
  return _HealthTimelineResponse.fromJson(json);
}

/// @nodoc
class _$HealthTimelineResponseTearOff {
  const _$HealthTimelineResponseTearOff();

  _HealthTimelineResponse call(
      {List<FhirResource> healthTimelineItems = const <FhirResource>[]}) {
    return _HealthTimelineResponse(
      healthTimelineItems: healthTimelineItems,
    );
  }

  HealthTimelineResponse fromJson(Map<String, Object?> json) {
    return HealthTimelineResponse.fromJson(json);
  }
}

/// @nodoc
const $HealthTimelineResponse = _$HealthTimelineResponseTearOff();

/// @nodoc
mixin _$HealthTimelineResponse {
  List<FhirResource> get healthTimelineItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthTimelineResponseCopyWith<HealthTimelineResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthTimelineResponseCopyWith<$Res> {
  factory $HealthTimelineResponseCopyWith(HealthTimelineResponse value,
          $Res Function(HealthTimelineResponse) then) =
      _$HealthTimelineResponseCopyWithImpl<$Res>;
  $Res call({List<FhirResource> healthTimelineItems});
}

/// @nodoc
class _$HealthTimelineResponseCopyWithImpl<$Res>
    implements $HealthTimelineResponseCopyWith<$Res> {
  _$HealthTimelineResponseCopyWithImpl(this._value, this._then);

  final HealthTimelineResponse _value;
  // ignore: unused_field
  final $Res Function(HealthTimelineResponse) _then;

  @override
  $Res call({
    Object? healthTimelineItems = freezed,
  }) {
    return _then(_value.copyWith(
      healthTimelineItems: healthTimelineItems == freezed
          ? _value.healthTimelineItems
          : healthTimelineItems // ignore: cast_nullable_to_non_nullable
              as List<FhirResource>,
    ));
  }
}

/// @nodoc
abstract class _$HealthTimelineResponseCopyWith<$Res>
    implements $HealthTimelineResponseCopyWith<$Res> {
  factory _$HealthTimelineResponseCopyWith(_HealthTimelineResponse value,
          $Res Function(_HealthTimelineResponse) then) =
      __$HealthTimelineResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<FhirResource> healthTimelineItems});
}

/// @nodoc
class __$HealthTimelineResponseCopyWithImpl<$Res>
    extends _$HealthTimelineResponseCopyWithImpl<$Res>
    implements _$HealthTimelineResponseCopyWith<$Res> {
  __$HealthTimelineResponseCopyWithImpl(_HealthTimelineResponse _value,
      $Res Function(_HealthTimelineResponse) _then)
      : super(_value, (v) => _then(v as _HealthTimelineResponse));

  @override
  _HealthTimelineResponse get _value => super._value as _HealthTimelineResponse;

  @override
  $Res call({
    Object? healthTimelineItems = freezed,
  }) {
    return _then(_HealthTimelineResponse(
      healthTimelineItems: healthTimelineItems == freezed
          ? _value.healthTimelineItems
          : healthTimelineItems // ignore: cast_nullable_to_non_nullable
              as List<FhirResource>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthTimelineResponse implements _HealthTimelineResponse {
  _$_HealthTimelineResponse(
      {this.healthTimelineItems = const <FhirResource>[]});

  factory _$_HealthTimelineResponse.fromJson(Map<String, dynamic> json) =>
      _$$_HealthTimelineResponseFromJson(json);

  @JsonKey()
  @override
  final List<FhirResource> healthTimelineItems;

  @override
  String toString() {
    return 'HealthTimelineResponse(healthTimelineItems: $healthTimelineItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HealthTimelineResponse &&
            const DeepCollectionEquality()
                .equals(other.healthTimelineItems, healthTimelineItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(healthTimelineItems));

  @JsonKey(ignore: true)
  @override
  _$HealthTimelineResponseCopyWith<_HealthTimelineResponse> get copyWith =>
      __$HealthTimelineResponseCopyWithImpl<_HealthTimelineResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthTimelineResponseToJson(this);
  }
}

abstract class _HealthTimelineResponse implements HealthTimelineResponse {
  factory _HealthTimelineResponse({List<FhirResource> healthTimelineItems}) =
      _$_HealthTimelineResponse;

  factory _HealthTimelineResponse.fromJson(Map<String, dynamic> json) =
      _$_HealthTimelineResponse.fromJson;

  @override
  List<FhirResource> get healthTimelineItems;
  @override
  @JsonKey(ignore: true)
  _$HealthTimelineResponseCopyWith<_HealthTimelineResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
