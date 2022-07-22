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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HealthTimelineResponse _$HealthTimelineResponseFromJson(
    Map<String, dynamic> json) {
  return _HealthTimelineResponse.fromJson(json);
}

/// @nodoc
mixin _$HealthTimelineResponse {
  @JsonKey(name: 'timeline')
  List<FhirResource> get patientTimeline => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalCount')
  int get count => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: 'timeline') List<FhirResource> patientTimeline,
      @JsonKey(name: 'totalCount') int count});
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
    Object? patientTimeline = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      patientTimeline: patientTimeline == freezed
          ? _value.patientTimeline
          : patientTimeline // ignore: cast_nullable_to_non_nullable
              as List<FhirResource>,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_HealthTimelineResponseCopyWith<$Res>
    implements $HealthTimelineResponseCopyWith<$Res> {
  factory _$$_HealthTimelineResponseCopyWith(_$_HealthTimelineResponse value,
          $Res Function(_$_HealthTimelineResponse) then) =
      __$$_HealthTimelineResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'timeline') List<FhirResource> patientTimeline,
      @JsonKey(name: 'totalCount') int count});
}

/// @nodoc
class __$$_HealthTimelineResponseCopyWithImpl<$Res>
    extends _$HealthTimelineResponseCopyWithImpl<$Res>
    implements _$$_HealthTimelineResponseCopyWith<$Res> {
  __$$_HealthTimelineResponseCopyWithImpl(_$_HealthTimelineResponse _value,
      $Res Function(_$_HealthTimelineResponse) _then)
      : super(_value, (v) => _then(v as _$_HealthTimelineResponse));

  @override
  _$_HealthTimelineResponse get _value =>
      super._value as _$_HealthTimelineResponse;

  @override
  $Res call({
    Object? patientTimeline = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_HealthTimelineResponse(
      patientTimeline: patientTimeline == freezed
          ? _value._patientTimeline
          : patientTimeline // ignore: cast_nullable_to_non_nullable
              as List<FhirResource>,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthTimelineResponse implements _HealthTimelineResponse {
  _$_HealthTimelineResponse(
      {@JsonKey(name: 'timeline')
          final List<FhirResource> patientTimeline = const <FhirResource>[],
      @JsonKey(name: 'totalCount')
          this.count = 0})
      : _patientTimeline = patientTimeline;

  factory _$_HealthTimelineResponse.fromJson(Map<String, dynamic> json) =>
      _$$_HealthTimelineResponseFromJson(json);

  final List<FhirResource> _patientTimeline;
  @override
  @JsonKey(name: 'timeline')
  List<FhirResource> get patientTimeline {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patientTimeline);
  }

  @override
  @JsonKey(name: 'totalCount')
  final int count;

  @override
  String toString() {
    return 'HealthTimelineResponse(patientTimeline: $patientTimeline, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthTimelineResponse &&
            const DeepCollectionEquality()
                .equals(other._patientTimeline, _patientTimeline) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_patientTimeline),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_HealthTimelineResponseCopyWith<_$_HealthTimelineResponse> get copyWith =>
      __$$_HealthTimelineResponseCopyWithImpl<_$_HealthTimelineResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthTimelineResponseToJson(this);
  }
}

abstract class _HealthTimelineResponse implements HealthTimelineResponse {
  factory _HealthTimelineResponse(
          {@JsonKey(name: 'timeline') final List<FhirResource> patientTimeline,
          @JsonKey(name: 'totalCount') final int count}) =
      _$_HealthTimelineResponse;

  factory _HealthTimelineResponse.fromJson(Map<String, dynamic> json) =
      _$_HealthTimelineResponse.fromJson;

  @override
  @JsonKey(name: 'timeline')
  List<FhirResource> get patientTimeline;
  @override
  @JsonKey(name: 'totalCount')
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_HealthTimelineResponseCopyWith<_$_HealthTimelineResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
