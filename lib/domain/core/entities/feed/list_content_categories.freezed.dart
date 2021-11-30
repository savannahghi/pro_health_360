// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'list_content_categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListContentCategory _$ListContentCategoryFromJson(Map<String, dynamic> json) {
  return _ListContentCategory.fromJson(json);
}

/// @nodoc
class _$ListContentCategoryTearOff {
  const _$ListContentCategoryTearOff();

  _ListContentCategory call(
      {@JsonKey(name: 'listContentCategories')
          List<ContentCategory?>? contentCategories}) {
    return _ListContentCategory(
      contentCategories: contentCategories,
    );
  }

  ListContentCategory fromJson(Map<String, Object> json) {
    return ListContentCategory.fromJson(json);
  }
}

/// @nodoc
const $ListContentCategory = _$ListContentCategoryTearOff();

/// @nodoc
mixin _$ListContentCategory {
  @JsonKey(name: 'listContentCategories')
  List<ContentCategory?>? get contentCategories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListContentCategoryCopyWith<ListContentCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListContentCategoryCopyWith<$Res> {
  factory $ListContentCategoryCopyWith(
          ListContentCategory value, $Res Function(ListContentCategory) then) =
      _$ListContentCategoryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'listContentCategories')
          List<ContentCategory?>? contentCategories});
}

/// @nodoc
class _$ListContentCategoryCopyWithImpl<$Res>
    implements $ListContentCategoryCopyWith<$Res> {
  _$ListContentCategoryCopyWithImpl(this._value, this._then);

  final ListContentCategory _value;
  // ignore: unused_field
  final $Res Function(ListContentCategory) _then;

  @override
  $Res call({
    Object? contentCategories = freezed,
  }) {
    return _then(_value.copyWith(
      contentCategories: contentCategories == freezed
          ? _value.contentCategories
          : contentCategories // ignore: cast_nullable_to_non_nullable
              as List<ContentCategory?>?,
    ));
  }
}

/// @nodoc
abstract class _$ListContentCategoryCopyWith<$Res>
    implements $ListContentCategoryCopyWith<$Res> {
  factory _$ListContentCategoryCopyWith(_ListContentCategory value,
          $Res Function(_ListContentCategory) then) =
      __$ListContentCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'listContentCategories')
          List<ContentCategory?>? contentCategories});
}

/// @nodoc
class __$ListContentCategoryCopyWithImpl<$Res>
    extends _$ListContentCategoryCopyWithImpl<$Res>
    implements _$ListContentCategoryCopyWith<$Res> {
  __$ListContentCategoryCopyWithImpl(
      _ListContentCategory _value, $Res Function(_ListContentCategory) _then)
      : super(_value, (v) => _then(v as _ListContentCategory));

  @override
  _ListContentCategory get _value => super._value as _ListContentCategory;

  @override
  $Res call({
    Object? contentCategories = freezed,
  }) {
    return _then(_ListContentCategory(
      contentCategories: contentCategories == freezed
          ? _value.contentCategories
          : contentCategories // ignore: cast_nullable_to_non_nullable
              as List<ContentCategory?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListContentCategory implements _ListContentCategory {
  _$_ListContentCategory(
      {@JsonKey(name: 'listContentCategories') this.contentCategories});

  factory _$_ListContentCategory.fromJson(Map<String, dynamic> json) =>
      _$_$_ListContentCategoryFromJson(json);

  @override
  @JsonKey(name: 'listContentCategories')
  final List<ContentCategory?>? contentCategories;

  @override
  String toString() {
    return 'ListContentCategory(contentCategories: $contentCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ListContentCategory &&
            (identical(other.contentCategories, contentCategories) ||
                const DeepCollectionEquality()
                    .equals(other.contentCategories, contentCategories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contentCategories);

  @JsonKey(ignore: true)
  @override
  _$ListContentCategoryCopyWith<_ListContentCategory> get copyWith =>
      __$ListContentCategoryCopyWithImpl<_ListContentCategory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ListContentCategoryToJson(this);
  }
}

abstract class _ListContentCategory implements ListContentCategory {
  factory _ListContentCategory(
      {@JsonKey(name: 'listContentCategories')
          List<ContentCategory?>? contentCategories}) = _$_ListContentCategory;

  factory _ListContentCategory.fromJson(Map<String, dynamic> json) =
      _$_ListContentCategory.fromJson;

  @override
  @JsonKey(name: 'listContentCategories')
  List<ContentCategory?>? get contentCategories =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ListContentCategoryCopyWith<_ListContentCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
