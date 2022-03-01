// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feed_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedItems _$FeedItemsFromJson(Map<String, dynamic> json) {
  return _FeedItems.fromJson(json);
}

/// @nodoc
class _$FeedItemsTearOff {
  const _$FeedItemsTearOff();

  _FeedItems call({@JsonKey(name: 'items') List<Content>? items}) {
    return _FeedItems(
      items: items,
    );
  }

  FeedItems fromJson(Map<String, Object?> json) {
    return FeedItems.fromJson(json);
  }
}

/// @nodoc
const $FeedItems = _$FeedItemsTearOff();

/// @nodoc
mixin _$FeedItems {
  @JsonKey(name: 'items')
  List<Content>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedItemsCopyWith<FeedItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedItemsCopyWith<$Res> {
  factory $FeedItemsCopyWith(FeedItems value, $Res Function(FeedItems) then) =
      _$FeedItemsCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'items') List<Content>? items});
}

/// @nodoc
class _$FeedItemsCopyWithImpl<$Res> implements $FeedItemsCopyWith<$Res> {
  _$FeedItemsCopyWithImpl(this._value, this._then);

  final FeedItems _value;
  // ignore: unused_field
  final $Res Function(FeedItems) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
    ));
  }
}

/// @nodoc
abstract class _$FeedItemsCopyWith<$Res> implements $FeedItemsCopyWith<$Res> {
  factory _$FeedItemsCopyWith(
          _FeedItems value, $Res Function(_FeedItems) then) =
      __$FeedItemsCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'items') List<Content>? items});
}

/// @nodoc
class __$FeedItemsCopyWithImpl<$Res> extends _$FeedItemsCopyWithImpl<$Res>
    implements _$FeedItemsCopyWith<$Res> {
  __$FeedItemsCopyWithImpl(_FeedItems _value, $Res Function(_FeedItems) _then)
      : super(_value, (v) => _then(v as _FeedItems));

  @override
  _FeedItems get _value => super._value as _FeedItems;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_FeedItems(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeedItems implements _FeedItems {
  _$_FeedItems({@JsonKey(name: 'items') this.items});

  factory _$_FeedItems.fromJson(Map<String, dynamic> json) =>
      _$$_FeedItemsFromJson(json);

  @override
  @JsonKey(name: 'items')
  final List<Content>? items;

  @override
  String toString() {
    return 'FeedItems(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeedItems &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$FeedItemsCopyWith<_FeedItems> get copyWith =>
      __$FeedItemsCopyWithImpl<_FeedItems>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedItemsToJson(this);
  }
}

abstract class _FeedItems implements FeedItems {
  factory _FeedItems({@JsonKey(name: 'items') List<Content>? items}) =
      _$_FeedItems;

  factory _FeedItems.fromJson(Map<String, dynamic> json) =
      _$_FeedItems.fromJson;

  @override
  @JsonKey(name: 'items')
  List<Content>? get items;
  @override
  @JsonKey(ignore: true)
  _$FeedItemsCopyWith<_FeedItems> get copyWith =>
      throw _privateConstructorUsedError;
}
