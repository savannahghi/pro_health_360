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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViralLoadEdges _$ViralLoadEdgesFromJson(Map<String, dynamic> json) {
  return _ViralLoadEdges.fromJson(json);
}

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
abstract class _$$_ViralLoadEdgesCopyWith<$Res>
    implements $ViralLoadEdgesCopyWith<$Res> {
  factory _$$_ViralLoadEdgesCopyWith(
          _$_ViralLoadEdges value, $Res Function(_$_ViralLoadEdges) then) =
      __$$_ViralLoadEdgesCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'edges') List<ViralLoadNode?>? edges});
}

/// @nodoc
class __$$_ViralLoadEdgesCopyWithImpl<$Res>
    extends _$ViralLoadEdgesCopyWithImpl<$Res>
    implements _$$_ViralLoadEdgesCopyWith<$Res> {
  __$$_ViralLoadEdgesCopyWithImpl(
      _$_ViralLoadEdges _value, $Res Function(_$_ViralLoadEdges) _then)
      : super(_value, (v) => _then(v as _$_ViralLoadEdges));

  @override
  _$_ViralLoadEdges get _value => super._value as _$_ViralLoadEdges;

  @override
  $Res call({
    Object? edges = freezed,
  }) {
    return _then(_$_ViralLoadEdges(
      edges: edges == freezed
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<ViralLoadNode?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViralLoadEdges implements _ViralLoadEdges {
  _$_ViralLoadEdges({@JsonKey(name: 'edges') final List<ViralLoadNode?>? edges})
      : _edges = edges;

  factory _$_ViralLoadEdges.fromJson(Map<String, dynamic> json) =>
      _$$_ViralLoadEdgesFromJson(json);

  final List<ViralLoadNode?>? _edges;
  @override
  @JsonKey(name: 'edges')
  List<ViralLoadNode?>? get edges {
    final value = _edges;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ViralLoadEdges(edges: $edges)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViralLoadEdges &&
            const DeepCollectionEquality().equals(other._edges, _edges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_edges));

  @JsonKey(ignore: true)
  @override
  _$$_ViralLoadEdgesCopyWith<_$_ViralLoadEdges> get copyWith =>
      __$$_ViralLoadEdgesCopyWithImpl<_$_ViralLoadEdges>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViralLoadEdgesToJson(this);
  }
}

abstract class _ViralLoadEdges implements ViralLoadEdges {
  factory _ViralLoadEdges(
          {@JsonKey(name: 'edges') final List<ViralLoadNode?>? edges}) =
      _$_ViralLoadEdges;

  factory _ViralLoadEdges.fromJson(Map<String, dynamic> json) =
      _$_ViralLoadEdges.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<ViralLoadNode?>? get edges => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ViralLoadEdgesCopyWith<_$_ViralLoadEdges> get copyWith =>
      throw _privateConstructorUsedError;
}
