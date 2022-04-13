// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'viral_load_edges.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViralLoadEdges _$ViralLoadEdgesFromJson(Map<String, dynamic> json) {
  return _ViralLoadEdges.fromJson(json);
}

/// @nodoc
class _$ViralLoadEdgesTearOff {
  const _$ViralLoadEdgesTearOff();

  _ViralLoadEdges call({@JsonKey(name: 'edges') List<ViralLoadNode?>? edges}) {
    return _ViralLoadEdges(
      edges: edges,
    );
  }

  ViralLoadEdges fromJson(Map<String, Object?> json) {
    return ViralLoadEdges.fromJson(json);
  }
}

/// @nodoc
const $ViralLoadEdges = _$ViralLoadEdgesTearOff();

/// @nodoc
mixin _$ViralLoadEdges {
  @JsonKey(name: 'edges')
  List<ViralLoadNode?>? get edges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViralLoadEdgesCopyWith<ViralLoadEdges> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViralLoadEdgesCopyWith<$Res> {
  factory $ViralLoadEdgesCopyWith(
          ViralLoadEdges value, $Res Function(ViralLoadEdges) then) =
      _$ViralLoadEdgesCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'edges') List<ViralLoadNode?>? edges});
}

/// @nodoc
class _$ViralLoadEdgesCopyWithImpl<$Res>
    implements $ViralLoadEdgesCopyWith<$Res> {
  _$ViralLoadEdgesCopyWithImpl(this._value, this._then);

  final ViralLoadEdges _value;
  // ignore: unused_field
  final $Res Function(ViralLoadEdges) _then;

  @override
  $Res call({
    Object? edges = freezed,
  }) {
    return _then(_value.copyWith(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<ViralLoadNode?>?,
    ));
  }
}

/// @nodoc
abstract class _$ViralLoadEdgesCopyWith<$Res>
    implements $ViralLoadEdgesCopyWith<$Res> {
  factory _$ViralLoadEdgesCopyWith(
          _ViralLoadEdges value, $Res Function(_ViralLoadEdges) then) =
      __$ViralLoadEdgesCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'edges') List<ViralLoadNode?>? edges});
}

/// @nodoc
class __$ViralLoadEdgesCopyWithImpl<$Res>
    extends _$ViralLoadEdgesCopyWithImpl<$Res>
    implements _$ViralLoadEdgesCopyWith<$Res> {
  __$ViralLoadEdgesCopyWithImpl(
      _ViralLoadEdges _value, $Res Function(_ViralLoadEdges) _then)
      : super(_value, (v) => _then(v as _ViralLoadEdges));

  @override
  _ViralLoadEdges get _value => super._value as _ViralLoadEdges;

  @override
  $Res call({
    Object? edges = freezed,
  }) {
    return _then(_ViralLoadEdges(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<ViralLoadNode?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViralLoadEdges implements _ViralLoadEdges {
  _$_ViralLoadEdges({@JsonKey(name: 'edges') this.edges});

  factory _$_ViralLoadEdges.fromJson(Map<String, dynamic> json) =>
      _$$_ViralLoadEdgesFromJson(json);

  @override
  @JsonKey(name: 'edges')
  final List<ViralLoadNode?>? edges;

  @override
  String toString() {
    return 'ViralLoadEdges(edges: $edges)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViralLoadEdges &&
            const DeepCollectionEquality().equals(other.edges, edges));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(edges));

  @JsonKey(ignore: true)
  @override
  _$ViralLoadEdgesCopyWith<_ViralLoadEdges> get copyWith =>
      __$ViralLoadEdgesCopyWithImpl<_ViralLoadEdges>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViralLoadEdgesToJson(this);
  }
}

abstract class _ViralLoadEdges implements ViralLoadEdges {
  factory _ViralLoadEdges(
          {@JsonKey(name: 'edges') List<ViralLoadNode?>? edges}) =
      _$_ViralLoadEdges;

  factory _ViralLoadEdges.fromJson(Map<String, dynamic> json) =
      _$_ViralLoadEdges.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<ViralLoadNode?>? get edges;
  @override
  @JsonKey(ignore: true)
  _$ViralLoadEdgesCopyWith<_ViralLoadEdges> get copyWith =>
      throw _privateConstructorUsedError;
}
