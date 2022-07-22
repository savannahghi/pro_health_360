// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'health_timeline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HealthTimelineState _$HealthTimelineStateFromJson(Map<String, dynamic> json) {
  return _HealthTimelineState.fromJson(json);
}

/// @nodoc
mixin _$HealthTimelineState {
  Map<String, List<FhirResource>> get healthTimelineItems =>
      throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthTimelineStateCopyWith<HealthTimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthTimelineStateCopyWith<$Res> {
  factory $HealthTimelineStateCopyWith(
          HealthTimelineState value, $Res Function(HealthTimelineState) then) =
      _$HealthTimelineStateCopyWithImpl<$Res>;
  $Res call(
      {Map<String, List<FhirResource>> healthTimelineItems,
      int offset,
      int count});
}

/// @nodoc
class _$HealthTimelineStateCopyWithImpl<$Res>
    implements $HealthTimelineStateCopyWith<$Res> {
  _$HealthTimelineStateCopyWithImpl(this._value, this._then);

  final HealthTimelineState _value;
  // ignore: unused_field
  final $Res Function(HealthTimelineState) _then;

  @override
  $Res call({
    Object? healthTimelineItems = freezed,
    Object? offset = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      healthTimelineItems: healthTimelineItems == freezed
          ? _value.healthTimelineItems
          : healthTimelineItems // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FhirResource>>,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_HealthTimelineStateCopyWith<$Res>
    implements $HealthTimelineStateCopyWith<$Res> {
  factory _$$_HealthTimelineStateCopyWith(_$_HealthTimelineState value,
          $Res Function(_$_HealthTimelineState) then) =
      __$$_HealthTimelineStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, List<FhirResource>> healthTimelineItems,
      int offset,
      int count});
}

/// @nodoc
class __$$_HealthTimelineStateCopyWithImpl<$Res>
    extends _$HealthTimelineStateCopyWithImpl<$Res>
    implements _$$_HealthTimelineStateCopyWith<$Res> {
  __$$_HealthTimelineStateCopyWithImpl(_$_HealthTimelineState _value,
      $Res Function(_$_HealthTimelineState) _then)
      : super(_value, (v) => _then(v as _$_HealthTimelineState));

  @override
  _$_HealthTimelineState get _value => super._value as _$_HealthTimelineState;

  @override
  $Res call({
    Object? healthTimelineItems = freezed,
    Object? offset = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_HealthTimelineState(
      healthTimelineItems: healthTimelineItems == freezed
          ? _value._healthTimelineItems
          : healthTimelineItems // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FhirResource>>,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthTimelineState implements _HealthTimelineState {
  _$_HealthTimelineState(
      {final Map<String, List<FhirResource>> healthTimelineItems =
          const <String, List<FhirResource>>{},
      this.offset = 0,
      this.count = 10})
      : _healthTimelineItems = healthTimelineItems;

  factory _$_HealthTimelineState.fromJson(Map<String, dynamic> json) =>
      _$$_HealthTimelineStateFromJson(json);

  final Map<String, List<FhirResource>> _healthTimelineItems;
  @override
  @JsonKey()
  Map<String, List<FhirResource>> get healthTimelineItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_healthTimelineItems);
  }

  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'HealthTimelineState(healthTimelineItems: $healthTimelineItems, offset: $offset, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthTimelineState &&
            const DeepCollectionEquality()
                .equals(other._healthTimelineItems, _healthTimelineItems) &&
            const DeepCollectionEquality().equals(other.offset, offset) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_healthTimelineItems),
      const DeepCollectionEquality().hash(offset),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_HealthTimelineStateCopyWith<_$_HealthTimelineState> get copyWith =>
      __$$_HealthTimelineStateCopyWithImpl<_$_HealthTimelineState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthTimelineStateToJson(this);
  }
}

abstract class _HealthTimelineState implements HealthTimelineState {
  factory _HealthTimelineState(
      {final Map<String, List<FhirResource>> healthTimelineItems,
      final int offset,
      final int count}) = _$_HealthTimelineState;

  factory _HealthTimelineState.fromJson(Map<String, dynamic> json) =
      _$_HealthTimelineState.fromJson;

  @override
  Map<String, List<FhirResource>> get healthTimelineItems;
  @override
  int get offset;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_HealthTimelineStateCopyWith<_$_HealthTimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}
