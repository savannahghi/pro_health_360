// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentState _$ContentStateFromJson(Map<String, dynamic> json) {
  return _ContentState.fromJson(json);
}

/// @nodoc
class _$ContentStateTearOff {
  const _$ContentStateTearOff();

  _ContentState call({@JsonKey(name: 'items') List<Content>? contentItems}) {
    return _ContentState(
      contentItems: contentItems,
    );
  }

  ContentState fromJson(Map<String, Object> json) {
    return ContentState.fromJson(json);
  }
}

/// @nodoc
const $ContentState = _$ContentStateTearOff();

/// @nodoc
mixin _$ContentState {
  @JsonKey(name: 'items')
  List<Content>? get contentItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentStateCopyWith<ContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentStateCopyWith<$Res> {
  factory $ContentStateCopyWith(
          ContentState value, $Res Function(ContentState) then) =
      _$ContentStateCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'items') List<Content>? contentItems});
}

/// @nodoc
class _$ContentStateCopyWithImpl<$Res> implements $ContentStateCopyWith<$Res> {
  _$ContentStateCopyWithImpl(this._value, this._then);

  final ContentState _value;
  // ignore: unused_field
  final $Res Function(ContentState) _then;

  @override
  $Res call({
    Object? contentItems = freezed,
  }) {
    return _then(_value.copyWith(
      contentItems: contentItems == freezed
          ? _value.contentItems
          : contentItems // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
    ));
  }
}

/// @nodoc
abstract class _$ContentStateCopyWith<$Res>
    implements $ContentStateCopyWith<$Res> {
  factory _$ContentStateCopyWith(
          _ContentState value, $Res Function(_ContentState) then) =
      __$ContentStateCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'items') List<Content>? contentItems});
}

/// @nodoc
class __$ContentStateCopyWithImpl<$Res> extends _$ContentStateCopyWithImpl<$Res>
    implements _$ContentStateCopyWith<$Res> {
  __$ContentStateCopyWithImpl(
      _ContentState _value, $Res Function(_ContentState) _then)
      : super(_value, (v) => _then(v as _ContentState));

  @override
  _ContentState get _value => super._value as _ContentState;

  @override
  $Res call({
    Object? contentItems = freezed,
  }) {
    return _then(_ContentState(
      contentItems: contentItems == freezed
          ? _value.contentItems
          : contentItems // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentState implements _ContentState {
  _$_ContentState({@JsonKey(name: 'items') this.contentItems});

  factory _$_ContentState.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentStateFromJson(json);

  @override
  @JsonKey(name: 'items')
  final List<Content>? contentItems;

  @override
  String toString() {
    return 'ContentState(contentItems: $contentItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContentState &&
            (identical(other.contentItems, contentItems) ||
                const DeepCollectionEquality()
                    .equals(other.contentItems, contentItems)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(contentItems);

  @JsonKey(ignore: true)
  @override
  _$ContentStateCopyWith<_ContentState> get copyWith =>
      __$ContentStateCopyWithImpl<_ContentState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContentStateToJson(this);
  }
}

abstract class _ContentState implements ContentState {
  factory _ContentState({@JsonKey(name: 'items') List<Content>? contentItems}) =
      _$_ContentState;

  factory _ContentState.fromJson(Map<String, dynamic> json) =
      _$_ContentState.fromJson;

  @override
  @JsonKey(name: 'items')
  List<Content>? get contentItems => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentStateCopyWith<_ContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
