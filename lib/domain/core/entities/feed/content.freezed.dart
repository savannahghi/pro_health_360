// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
class _$ContentTearOff {
  const _$ContentTearOff();

  _Content call(
      {@JsonKey(name: 'contentID') String? contentID,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'authorAvatar') String? authorAvatar,
      @JsonKey(name: 'heroImage') String? heroImage,
      @JsonKey(name: 'contentType') ContentType? contentType,
      @JsonKey(name: 'publicLink') String? publicLink,
      @JsonKey(name: 'isNew') bool? isNew,
      @JsonKey(name: 'estimate') String? estimate,
      @JsonKey(name: 'tags') List<String?>? tags,
      @JsonKey(name: 'createdAt') String? createdAt}) {
    return _Content(
      contentID: contentID,
      title: title,
      body: body,
      author: author,
      authorAvatar: authorAvatar,
      heroImage: heroImage,
      contentType: contentType,
      publicLink: publicLink,
      isNew: isNew,
      estimate: estimate,
      tags: tags,
      createdAt: createdAt,
    );
  }

  Content fromJson(Map<String, Object> json) {
    return Content.fromJson(json);
  }
}

/// @nodoc
const $Content = _$ContentTearOff();

/// @nodoc
mixin _$Content {
  @JsonKey(name: 'contentID')
  String? get contentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorAvatar')
  String? get authorAvatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'heroImage')
  String? get heroImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'contentType')
  ContentType? get contentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'publicLink')
  String? get publicLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'isNew')
  bool? get isNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimate')
  String? get estimate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tags')
  List<String?>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'contentID') String? contentID,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'authorAvatar') String? authorAvatar,
      @JsonKey(name: 'heroImage') String? heroImage,
      @JsonKey(name: 'contentType') ContentType? contentType,
      @JsonKey(name: 'publicLink') String? publicLink,
      @JsonKey(name: 'isNew') bool? isNew,
      @JsonKey(name: 'estimate') String? estimate,
      @JsonKey(name: 'tags') List<String?>? tags,
      @JsonKey(name: 'createdAt') String? createdAt});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res> implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  final Content _value;
  // ignore: unused_field
  final $Res Function(Content) _then;

  @override
  $Res call({
    Object? contentID = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? author = freezed,
    Object? authorAvatar = freezed,
    Object? heroImage = freezed,
    Object? contentType = freezed,
    Object? publicLink = freezed,
    Object? isNew = freezed,
    Object? estimate = freezed,
    Object? tags = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      contentID: contentID == freezed
          ? _value.contentID
          : contentID // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorAvatar: authorAvatar == freezed
          ? _value.authorAvatar
          : authorAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      heroImage: heroImage == freezed
          ? _value.heroImage
          : heroImage // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as ContentType?,
      publicLink: publicLink == freezed
          ? _value.publicLink
          : publicLink // ignore: cast_nullable_to_non_nullable
              as String?,
      isNew: isNew == freezed
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      estimate: estimate == freezed
          ? _value.estimate
          : estimate // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ContentCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) then) =
      __$ContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'contentID') String? contentID,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'authorAvatar') String? authorAvatar,
      @JsonKey(name: 'heroImage') String? heroImage,
      @JsonKey(name: 'contentType') ContentType? contentType,
      @JsonKey(name: 'publicLink') String? publicLink,
      @JsonKey(name: 'isNew') bool? isNew,
      @JsonKey(name: 'estimate') String? estimate,
      @JsonKey(name: 'tags') List<String?>? tags,
      @JsonKey(name: 'createdAt') String? createdAt});
}

/// @nodoc
class __$ContentCopyWithImpl<$Res> extends _$ContentCopyWithImpl<$Res>
    implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(_Content _value, $Res Function(_Content) _then)
      : super(_value, (v) => _then(v as _Content));

  @override
  _Content get _value => super._value as _Content;

  @override
  $Res call({
    Object? contentID = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? author = freezed,
    Object? authorAvatar = freezed,
    Object? heroImage = freezed,
    Object? contentType = freezed,
    Object? publicLink = freezed,
    Object? isNew = freezed,
    Object? estimate = freezed,
    Object? tags = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Content(
      contentID: contentID == freezed
          ? _value.contentID
          : contentID // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorAvatar: authorAvatar == freezed
          ? _value.authorAvatar
          : authorAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      heroImage: heroImage == freezed
          ? _value.heroImage
          : heroImage // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as ContentType?,
      publicLink: publicLink == freezed
          ? _value.publicLink
          : publicLink // ignore: cast_nullable_to_non_nullable
              as String?,
      isNew: isNew == freezed
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      estimate: estimate == freezed
          ? _value.estimate
          : estimate // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Content implements _Content {
  _$_Content(
      {@JsonKey(name: 'contentID') this.contentID,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'body') this.body,
      @JsonKey(name: 'author') this.author,
      @JsonKey(name: 'authorAvatar') this.authorAvatar,
      @JsonKey(name: 'heroImage') this.heroImage,
      @JsonKey(name: 'contentType') this.contentType,
      @JsonKey(name: 'publicLink') this.publicLink,
      @JsonKey(name: 'isNew') this.isNew,
      @JsonKey(name: 'estimate') this.estimate,
      @JsonKey(name: 'tags') this.tags,
      @JsonKey(name: 'createdAt') this.createdAt});

  factory _$_Content.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentFromJson(json);

  @override
  @JsonKey(name: 'contentID')
  final String? contentID;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'body')
  final String? body;
  @override
  @JsonKey(name: 'author')
  final String? author;
  @override
  @JsonKey(name: 'authorAvatar')
  final String? authorAvatar;
  @override
  @JsonKey(name: 'heroImage')
  final String? heroImage;
  @override
  @JsonKey(name: 'contentType')
  final ContentType? contentType;
  @override
  @JsonKey(name: 'publicLink')
  final String? publicLink;
  @override
  @JsonKey(name: 'isNew')
  final bool? isNew;
  @override
  @JsonKey(name: 'estimate')
  final String? estimate;
  @override
  @JsonKey(name: 'tags')
  final List<String?>? tags;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  String toString() {
    return 'Content(contentID: $contentID, title: $title, body: $body, author: $author, authorAvatar: $authorAvatar, heroImage: $heroImage, contentType: $contentType, publicLink: $publicLink, isNew: $isNew, estimate: $estimate, tags: $tags, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Content &&
            (identical(other.contentID, contentID) ||
                const DeepCollectionEquality()
                    .equals(other.contentID, contentID)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.authorAvatar, authorAvatar) ||
                const DeepCollectionEquality()
                    .equals(other.authorAvatar, authorAvatar)) &&
            (identical(other.heroImage, heroImage) ||
                const DeepCollectionEquality()
                    .equals(other.heroImage, heroImage)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.publicLink, publicLink) ||
                const DeepCollectionEquality()
                    .equals(other.publicLink, publicLink)) &&
            (identical(other.isNew, isNew) ||
                const DeepCollectionEquality().equals(other.isNew, isNew)) &&
            (identical(other.estimate, estimate) ||
                const DeepCollectionEquality()
                    .equals(other.estimate, estimate)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contentID) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(authorAvatar) ^
      const DeepCollectionEquality().hash(heroImage) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(publicLink) ^
      const DeepCollectionEquality().hash(isNew) ^
      const DeepCollectionEquality().hash(estimate) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContentToJson(this);
  }
}

abstract class _Content implements Content {
  factory _Content(
      {@JsonKey(name: 'contentID') String? contentID,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'authorAvatar') String? authorAvatar,
      @JsonKey(name: 'heroImage') String? heroImage,
      @JsonKey(name: 'contentType') ContentType? contentType,
      @JsonKey(name: 'publicLink') String? publicLink,
      @JsonKey(name: 'isNew') bool? isNew,
      @JsonKey(name: 'estimate') String? estimate,
      @JsonKey(name: 'tags') List<String?>? tags,
      @JsonKey(name: 'createdAt') String? createdAt}) = _$_Content;

  factory _Content.fromJson(Map<String, dynamic> json) = _$_Content.fromJson;

  @override
  @JsonKey(name: 'contentID')
  String? get contentID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'authorAvatar')
  String? get authorAvatar => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'heroImage')
  String? get heroImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'contentType')
  ContentType? get contentType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'publicLink')
  String? get publicLink => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'isNew')
  bool? get isNew => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'estimate')
  String? get estimate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'tags')
  List<String?>? get tags => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentCopyWith<_Content> get copyWith =>
      throw _privateConstructorUsedError;
}
