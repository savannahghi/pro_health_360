// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'content_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentCategory _$ContentCategoryFromJson(Map<String, dynamic> json) {
  return _ContentCategory.fromJson(json);
}

/// @nodoc
class _$ContentCategoryTearOff {
  const _$ContentCategoryTearOff();

  _ContentCategory call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'categoryName') String? name,
      @JsonKey(name: 'categoryIcon') String? icon}) {
    return _ContentCategory(
      id: id,
      name: name,
      icon: icon,
    );
  }

  ContentCategory fromJson(Map<String, Object> json) {
    return ContentCategory.fromJson(json);
  }
}

/// @nodoc
const $ContentCategory = _$ContentCategoryTearOff();

/// @nodoc
mixin _$ContentCategory {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryName')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryIcon')
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCategoryCopyWith<ContentCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCategoryCopyWith<$Res> {
  factory $ContentCategoryCopyWith(
          ContentCategory value, $Res Function(ContentCategory) then) =
      _$ContentCategoryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'categoryName') String? name,
      @JsonKey(name: 'categoryIcon') String? icon});
}

/// @nodoc
class _$ContentCategoryCopyWithImpl<$Res>
    implements $ContentCategoryCopyWith<$Res> {
  _$ContentCategoryCopyWithImpl(this._value, this._then);

  final ContentCategory _value;
  // ignore: unused_field
  final $Res Function(ContentCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ContentCategoryCopyWith<$Res>
    implements $ContentCategoryCopyWith<$Res> {
  factory _$ContentCategoryCopyWith(
          _ContentCategory value, $Res Function(_ContentCategory) then) =
      __$ContentCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'categoryName') String? name,
      @JsonKey(name: 'categoryIcon') String? icon});
}

/// @nodoc
class __$ContentCategoryCopyWithImpl<$Res>
    extends _$ContentCategoryCopyWithImpl<$Res>
    implements _$ContentCategoryCopyWith<$Res> {
  __$ContentCategoryCopyWithImpl(
      _ContentCategory _value, $Res Function(_ContentCategory) _then)
      : super(_value, (v) => _then(v as _ContentCategory));

  @override
  _ContentCategory get _value => super._value as _ContentCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_ContentCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentCategory implements _ContentCategory {
  _$_ContentCategory(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'categoryName') this.name,
      @JsonKey(name: 'categoryIcon') this.icon});

  factory _$_ContentCategory.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentCategoryFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'categoryName')
  final String? name;
  @override
  @JsonKey(name: 'categoryIcon')
  final String? icon;

  @override
  String toString() {
    return 'ContentCategory(id: $id, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContentCategory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(icon);

  @JsonKey(ignore: true)
  @override
  _$ContentCategoryCopyWith<_ContentCategory> get copyWith =>
      __$ContentCategoryCopyWithImpl<_ContentCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContentCategoryToJson(this);
  }
}

abstract class _ContentCategory implements ContentCategory {
  factory _ContentCategory(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'categoryName') String? name,
      @JsonKey(name: 'categoryIcon') String? icon}) = _$_ContentCategory;

  factory _ContentCategory.fromJson(Map<String, dynamic> json) =
      _$_ContentCategory.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'categoryName')
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'categoryIcon')
  String? get icon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentCategoryCopyWith<_ContentCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
