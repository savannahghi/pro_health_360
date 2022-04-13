// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'viral_load_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViralLoadNode _$ViralLoadNodeFromJson(Map<String, dynamic> json) {
  return _ViralLoadNode.fromJson(json);
}

/// @nodoc
class _$ViralLoadNodeTearOff {
  const _$ViralLoadNodeTearOff();

  _ViralLoadNode call({@JsonKey(name: 'node') ViralLoadNodeData? node}) {
    return _ViralLoadNode(
      node: node,
    );
  }

  ViralLoadNode fromJson(Map<String, Object?> json) {
    return ViralLoadNode.fromJson(json);
  }
}

/// @nodoc
const $ViralLoadNode = _$ViralLoadNodeTearOff();

/// @nodoc
mixin _$ViralLoadNode {
  @JsonKey(name: 'node')
  ViralLoadNodeData? get node => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViralLoadNodeCopyWith<ViralLoadNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViralLoadNodeCopyWith<$Res> {
  factory $ViralLoadNodeCopyWith(
          ViralLoadNode value, $Res Function(ViralLoadNode) then) =
      _$ViralLoadNodeCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'node') ViralLoadNodeData? node});

  $ViralLoadNodeDataCopyWith<$Res>? get node;
}

/// @nodoc
class _$ViralLoadNodeCopyWithImpl<$Res>
    implements $ViralLoadNodeCopyWith<$Res> {
  _$ViralLoadNodeCopyWithImpl(this._value, this._then);

  final ViralLoadNode _value;
  // ignore: unused_field
  final $Res Function(ViralLoadNode) _then;

  @override
  $Res call({
    Object? node = freezed,
  }) {
    return _then(_value.copyWith(
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as ViralLoadNodeData?,
    ));
  }

  @override
  $ViralLoadNodeDataCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $ViralLoadNodeDataCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value));
    });
  }
}

/// @nodoc
abstract class _$ViralLoadNodeCopyWith<$Res>
    implements $ViralLoadNodeCopyWith<$Res> {
  factory _$ViralLoadNodeCopyWith(
          _ViralLoadNode value, $Res Function(_ViralLoadNode) then) =
      __$ViralLoadNodeCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'node') ViralLoadNodeData? node});

  @override
  $ViralLoadNodeDataCopyWith<$Res>? get node;
}

/// @nodoc
class __$ViralLoadNodeCopyWithImpl<$Res>
    extends _$ViralLoadNodeCopyWithImpl<$Res>
    implements _$ViralLoadNodeCopyWith<$Res> {
  __$ViralLoadNodeCopyWithImpl(
      _ViralLoadNode _value, $Res Function(_ViralLoadNode) _then)
      : super(_value, (v) => _then(v as _ViralLoadNode));

  @override
  _ViralLoadNode get _value => super._value as _ViralLoadNode;

  @override
  $Res call({
    Object? node = freezed,
  }) {
    return _then(_ViralLoadNode(
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as ViralLoadNodeData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViralLoadNode implements _ViralLoadNode {
  _$_ViralLoadNode({@JsonKey(name: 'node') this.node});

  factory _$_ViralLoadNode.fromJson(Map<String, dynamic> json) =>
      _$$_ViralLoadNodeFromJson(json);

  @override
  @JsonKey(name: 'node')
  final ViralLoadNodeData? node;

  @override
  String toString() {
    return 'ViralLoadNode(node: $node)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViralLoadNode &&
            const DeepCollectionEquality().equals(other.node, node));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(node));

  @JsonKey(ignore: true)
  @override
  _$ViralLoadNodeCopyWith<_ViralLoadNode> get copyWith =>
      __$ViralLoadNodeCopyWithImpl<_ViralLoadNode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViralLoadNodeToJson(this);
  }
}

abstract class _ViralLoadNode implements ViralLoadNode {
  factory _ViralLoadNode({@JsonKey(name: 'node') ViralLoadNodeData? node}) =
      _$_ViralLoadNode;

  factory _ViralLoadNode.fromJson(Map<String, dynamic> json) =
      _$_ViralLoadNode.fromJson;

  @override
  @JsonKey(name: 'node')
  ViralLoadNodeData? get node;
  @override
  @JsonKey(ignore: true)
  _$ViralLoadNodeCopyWith<_ViralLoadNode> get copyWith =>
      throw _privateConstructorUsedError;
}
