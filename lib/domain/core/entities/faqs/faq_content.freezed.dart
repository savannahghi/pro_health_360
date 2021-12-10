// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'faq_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FAQContent _$FAQContentFromJson(Map<String, dynamic> json) {
  return _FAQContent.fromJson(json);
}

/// @nodoc
class _$FAQContentTearOff {
  const _$FAQContentTearOff();

  _FAQContent call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Active') bool? active,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Body') String? body,
      @JsonKey(name: 'Flavour') String? flavour}) {
    return _FAQContent(
      id: id,
      active: active,
      title: title,
      description: description,
      body: body,
      flavour: flavour,
    );
  }

  FAQContent fromJson(Map<String, Object> json) {
    return FAQContent.fromJson(json);
  }
}

/// @nodoc
const $FAQContent = _$FAQContentTearOff();

/// @nodoc
mixin _$FAQContent {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Body')
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'Flavour')
  String? get flavour => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQContentCopyWith<FAQContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQContentCopyWith<$Res> {
  factory $FAQContentCopyWith(
          FAQContent value, $Res Function(FAQContent) then) =
      _$FAQContentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Active') bool? active,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Body') String? body,
      @JsonKey(name: 'Flavour') String? flavour});
}

/// @nodoc
class _$FAQContentCopyWithImpl<$Res> implements $FAQContentCopyWith<$Res> {
  _$FAQContentCopyWithImpl(this._value, this._then);

  final FAQContent _value;
  // ignore: unused_field
  final $Res Function(FAQContent) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? body = freezed,
    Object? flavour = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      flavour: flavour == freezed
          ? _value.flavour
          : flavour // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$FAQContentCopyWith<$Res> implements $FAQContentCopyWith<$Res> {
  factory _$FAQContentCopyWith(
          _FAQContent value, $Res Function(_FAQContent) then) =
      __$FAQContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Active') bool? active,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Body') String? body,
      @JsonKey(name: 'Flavour') String? flavour});
}

/// @nodoc
class __$FAQContentCopyWithImpl<$Res> extends _$FAQContentCopyWithImpl<$Res>
    implements _$FAQContentCopyWith<$Res> {
  __$FAQContentCopyWithImpl(
      _FAQContent _value, $Res Function(_FAQContent) _then)
      : super(_value, (v) => _then(v as _FAQContent));

  @override
  _FAQContent get _value => super._value as _FAQContent;

  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? body = freezed,
    Object? flavour = freezed,
  }) {
    return _then(_FAQContent(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      flavour: flavour == freezed
          ? _value.flavour
          : flavour // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FAQContent implements _FAQContent {
  _$_FAQContent(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Active') this.active,
      @JsonKey(name: 'Title') this.title,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'Body') this.body,
      @JsonKey(name: 'Flavour') this.flavour});

  factory _$_FAQContent.fromJson(Map<String, dynamic> json) =>
      _$_$_FAQContentFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Active')
  final bool? active;
  @override
  @JsonKey(name: 'Title')
  final String? title;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'Body')
  final String? body;
  @override
  @JsonKey(name: 'Flavour')
  final String? flavour;

  @override
  String toString() {
    return 'FAQContent(id: $id, active: $active, title: $title, description: $description, body: $body, flavour: $flavour)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FAQContent &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.flavour, flavour) ||
                const DeepCollectionEquality().equals(other.flavour, flavour)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(flavour);

  @JsonKey(ignore: true)
  @override
  _$FAQContentCopyWith<_FAQContent> get copyWith =>
      __$FAQContentCopyWithImpl<_FAQContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FAQContentToJson(this);
  }
}

abstract class _FAQContent implements FAQContent {
  factory _FAQContent(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Active') bool? active,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Body') String? body,
      @JsonKey(name: 'Flavour') String? flavour}) = _$_FAQContent;

  factory _FAQContent.fromJson(Map<String, dynamic> json) =
      _$_FAQContent.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Active')
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Body')
  String? get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Flavour')
  String? get flavour => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FAQContentCopyWith<_FAQContent> get copyWith =>
      throw _privateConstructorUsedError;
}
