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
      {@JsonKey(name: 'ID') int? contentID,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'intro') String? intro,
      @JsonKey(name: 'authorName') String? authorName,
      @JsonKey(name: 'author') Author? author,
      @JsonKey(name: 'itemType') ContentType? contentType,
      @JsonKey(name: 'timeEstimateSeconds') int? estimate,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'heroImageRendition') HeroImage? heroImage,
      @JsonKey(name: 'likeCount') int? likeCount,
      @JsonKey(name: 'bookmarkCount') int? bookmarkCount,
      @JsonKey(name: 'viewCount') int? viewCount,
      @JsonKey(name: 'shareCount') int? shareCount,
      @JsonKey(name: 'documents') List<Document>? documents,
      @JsonKey(name: 'categoryDetails') List<ContentCategory>? categories,
      @JsonKey(name: 'tagNames') List<String?>? tags,
      @JsonKey(name: 'meta') ContentMetadata? metadata}) {
    return _Content(
      contentID: contentID,
      title: title,
      date: date,
      intro: intro,
      authorName: authorName,
      author: author,
      contentType: contentType,
      estimate: estimate,
      body: body,
      heroImage: heroImage,
      likeCount: likeCount,
      bookmarkCount: bookmarkCount,
      viewCount: viewCount,
      shareCount: shareCount,
      documents: documents,
      categories: categories,
      tags: tags,
      metadata: metadata,
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
  @JsonKey(name: 'ID')
  int? get contentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'intro')
  String? get intro =>
      throw _privateConstructorUsedError; // TODO(abiud): move this to the Author object
  @JsonKey(name: 'authorName')
  String? get authorName =>
      throw _privateConstructorUsedError; // TODO(abiud): add when backend is ready
// @JsonKey(name: 'authorAvatar') String? authorAvatar,
  @JsonKey(name: 'author')
  Author? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemType')
  ContentType? get contentType =>
      throw _privateConstructorUsedError; // "ARTICLE"
  @JsonKey(name: 'timeEstimateSeconds')
  int? get estimate => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'heroImageRendition')
  HeroImage? get heroImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'likeCount')
  int? get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookmarkCount')
  int? get bookmarkCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'viewCount')
  int? get viewCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'shareCount')
  int? get shareCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'documents')
  List<Document>? get documents => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryDetails')
  List<ContentCategory>? get categories =>
      throw _privateConstructorUsedError; // TODO(abiud): add when backend is ready
// @JsonKey(name: 'isNew') bool? isNew,
  @JsonKey(name: 'tagNames')
  List<String?>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  ContentMetadata? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') int? contentID,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'intro') String? intro,
      @JsonKey(name: 'authorName') String? authorName,
      @JsonKey(name: 'author') Author? author,
      @JsonKey(name: 'itemType') ContentType? contentType,
      @JsonKey(name: 'timeEstimateSeconds') int? estimate,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'heroImageRendition') HeroImage? heroImage,
      @JsonKey(name: 'likeCount') int? likeCount,
      @JsonKey(name: 'bookmarkCount') int? bookmarkCount,
      @JsonKey(name: 'viewCount') int? viewCount,
      @JsonKey(name: 'shareCount') int? shareCount,
      @JsonKey(name: 'documents') List<Document>? documents,
      @JsonKey(name: 'categoryDetails') List<ContentCategory>? categories,
      @JsonKey(name: 'tagNames') List<String?>? tags,
      @JsonKey(name: 'meta') ContentMetadata? metadata});

  $AuthorCopyWith<$Res>? get author;
  $HeroImageCopyWith<$Res>? get heroImage;
  $ContentMetadataCopyWith<$Res>? get metadata;
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
    Object? date = freezed,
    Object? intro = freezed,
    Object? authorName = freezed,
    Object? author = freezed,
    Object? contentType = freezed,
    Object? estimate = freezed,
    Object? body = freezed,
    Object? heroImage = freezed,
    Object? likeCount = freezed,
    Object? bookmarkCount = freezed,
    Object? viewCount = freezed,
    Object? shareCount = freezed,
    Object? documents = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      contentID: contentID == freezed
          ? _value.contentID
          : contentID // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      intro: intro == freezed
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as ContentType?,
      estimate: estimate == freezed
          ? _value.estimate
          : estimate // ignore: cast_nullable_to_non_nullable
              as int?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      heroImage: heroImage == freezed
          ? _value.heroImage
          : heroImage // ignore: cast_nullable_to_non_nullable
              as HeroImage?,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      bookmarkCount: bookmarkCount == freezed
          ? _value.bookmarkCount
          : bookmarkCount // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCount: viewCount == freezed
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      shareCount: shareCount == freezed
          ? _value.shareCount
          : shareCount // ignore: cast_nullable_to_non_nullable
              as int?,
      documents: documents == freezed
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ContentCategory>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ContentMetadata?,
    ));
  }

  @override
  $AuthorCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $AuthorCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value));
    });
  }

  @override
  $HeroImageCopyWith<$Res>? get heroImage {
    if (_value.heroImage == null) {
      return null;
    }

    return $HeroImageCopyWith<$Res>(_value.heroImage!, (value) {
      return _then(_value.copyWith(heroImage: value));
    });
  }

  @override
  $ContentMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $ContentMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value));
    });
  }
}

/// @nodoc
abstract class _$ContentCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) then) =
      __$ContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') int? contentID,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'intro') String? intro,
      @JsonKey(name: 'authorName') String? authorName,
      @JsonKey(name: 'author') Author? author,
      @JsonKey(name: 'itemType') ContentType? contentType,
      @JsonKey(name: 'timeEstimateSeconds') int? estimate,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'heroImageRendition') HeroImage? heroImage,
      @JsonKey(name: 'likeCount') int? likeCount,
      @JsonKey(name: 'bookmarkCount') int? bookmarkCount,
      @JsonKey(name: 'viewCount') int? viewCount,
      @JsonKey(name: 'shareCount') int? shareCount,
      @JsonKey(name: 'documents') List<Document>? documents,
      @JsonKey(name: 'categoryDetails') List<ContentCategory>? categories,
      @JsonKey(name: 'tagNames') List<String?>? tags,
      @JsonKey(name: 'meta') ContentMetadata? metadata});

  @override
  $AuthorCopyWith<$Res>? get author;
  @override
  $HeroImageCopyWith<$Res>? get heroImage;
  @override
  $ContentMetadataCopyWith<$Res>? get metadata;
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
    Object? date = freezed,
    Object? intro = freezed,
    Object? authorName = freezed,
    Object? author = freezed,
    Object? contentType = freezed,
    Object? estimate = freezed,
    Object? body = freezed,
    Object? heroImage = freezed,
    Object? likeCount = freezed,
    Object? bookmarkCount = freezed,
    Object? viewCount = freezed,
    Object? shareCount = freezed,
    Object? documents = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_Content(
      contentID: contentID == freezed
          ? _value.contentID
          : contentID // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      intro: intro == freezed
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as ContentType?,
      estimate: estimate == freezed
          ? _value.estimate
          : estimate // ignore: cast_nullable_to_non_nullable
              as int?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      heroImage: heroImage == freezed
          ? _value.heroImage
          : heroImage // ignore: cast_nullable_to_non_nullable
              as HeroImage?,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      bookmarkCount: bookmarkCount == freezed
          ? _value.bookmarkCount
          : bookmarkCount // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCount: viewCount == freezed
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      shareCount: shareCount == freezed
          ? _value.shareCount
          : shareCount // ignore: cast_nullable_to_non_nullable
              as int?,
      documents: documents == freezed
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ContentCategory>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ContentMetadata?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Content implements _Content {
  _$_Content(
      {@JsonKey(name: 'ID') this.contentID,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'date') this.date,
      @JsonKey(name: 'intro') this.intro,
      @JsonKey(name: 'authorName') this.authorName,
      @JsonKey(name: 'author') this.author,
      @JsonKey(name: 'itemType') this.contentType,
      @JsonKey(name: 'timeEstimateSeconds') this.estimate,
      @JsonKey(name: 'body') this.body,
      @JsonKey(name: 'heroImageRendition') this.heroImage,
      @JsonKey(name: 'likeCount') this.likeCount,
      @JsonKey(name: 'bookmarkCount') this.bookmarkCount,
      @JsonKey(name: 'viewCount') this.viewCount,
      @JsonKey(name: 'shareCount') this.shareCount,
      @JsonKey(name: 'documents') this.documents,
      @JsonKey(name: 'categoryDetails') this.categories,
      @JsonKey(name: 'tagNames') this.tags,
      @JsonKey(name: 'meta') this.metadata});

  factory _$_Content.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? contentID;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'intro')
  final String? intro;
  @override // TODO(abiud): move this to the Author object
  @JsonKey(name: 'authorName')
  final String? authorName;
  @override // TODO(abiud): add when backend is ready
// @JsonKey(name: 'authorAvatar') String? authorAvatar,
  @JsonKey(name: 'author')
  final Author? author;
  @override
  @JsonKey(name: 'itemType')
  final ContentType? contentType;
  @override // "ARTICLE"
  @JsonKey(name: 'timeEstimateSeconds')
  final int? estimate;
  @override
  @JsonKey(name: 'body')
  final String? body;
  @override
  @JsonKey(name: 'heroImageRendition')
  final HeroImage? heroImage;
  @override
  @JsonKey(name: 'likeCount')
  final int? likeCount;
  @override
  @JsonKey(name: 'bookmarkCount')
  final int? bookmarkCount;
  @override
  @JsonKey(name: 'viewCount')
  final int? viewCount;
  @override
  @JsonKey(name: 'shareCount')
  final int? shareCount;
  @override
  @JsonKey(name: 'documents')
  final List<Document>? documents;
  @override
  @JsonKey(name: 'categoryDetails')
  final List<ContentCategory>? categories;
  @override // TODO(abiud): add when backend is ready
// @JsonKey(name: 'isNew') bool? isNew,
  @JsonKey(name: 'tagNames')
  final List<String?>? tags;
  @override
  @JsonKey(name: 'meta')
  final ContentMetadata? metadata;

  @override
  String toString() {
    return 'Content(contentID: $contentID, title: $title, date: $date, intro: $intro, authorName: $authorName, author: $author, contentType: $contentType, estimate: $estimate, body: $body, heroImage: $heroImage, likeCount: $likeCount, bookmarkCount: $bookmarkCount, viewCount: $viewCount, shareCount: $shareCount, documents: $documents, categories: $categories, tags: $tags, metadata: $metadata)';
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
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.intro, intro) ||
                const DeepCollectionEquality().equals(other.intro, intro)) &&
            (identical(other.authorName, authorName) ||
                const DeepCollectionEquality()
                    .equals(other.authorName, authorName)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.estimate, estimate) ||
                const DeepCollectionEquality()
                    .equals(other.estimate, estimate)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.heroImage, heroImage) ||
                const DeepCollectionEquality()
                    .equals(other.heroImage, heroImage)) &&
            (identical(other.likeCount, likeCount) ||
                const DeepCollectionEquality()
                    .equals(other.likeCount, likeCount)) &&
            (identical(other.bookmarkCount, bookmarkCount) ||
                const DeepCollectionEquality()
                    .equals(other.bookmarkCount, bookmarkCount)) &&
            (identical(other.viewCount, viewCount) ||
                const DeepCollectionEquality()
                    .equals(other.viewCount, viewCount)) &&
            (identical(other.shareCount, shareCount) ||
                const DeepCollectionEquality()
                    .equals(other.shareCount, shareCount)) &&
            (identical(other.documents, documents) ||
                const DeepCollectionEquality()
                    .equals(other.documents, documents)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.metadata, metadata) ||
                const DeepCollectionEquality()
                    .equals(other.metadata, metadata)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contentID) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(intro) ^
      const DeepCollectionEquality().hash(authorName) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(estimate) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(heroImage) ^
      const DeepCollectionEquality().hash(likeCount) ^
      const DeepCollectionEquality().hash(bookmarkCount) ^
      const DeepCollectionEquality().hash(viewCount) ^
      const DeepCollectionEquality().hash(shareCount) ^
      const DeepCollectionEquality().hash(documents) ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(metadata);

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
      {@JsonKey(name: 'ID') int? contentID,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'intro') String? intro,
      @JsonKey(name: 'authorName') String? authorName,
      @JsonKey(name: 'author') Author? author,
      @JsonKey(name: 'itemType') ContentType? contentType,
      @JsonKey(name: 'timeEstimateSeconds') int? estimate,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'heroImageRendition') HeroImage? heroImage,
      @JsonKey(name: 'likeCount') int? likeCount,
      @JsonKey(name: 'bookmarkCount') int? bookmarkCount,
      @JsonKey(name: 'viewCount') int? viewCount,
      @JsonKey(name: 'shareCount') int? shareCount,
      @JsonKey(name: 'documents') List<Document>? documents,
      @JsonKey(name: 'categoryDetails') List<ContentCategory>? categories,
      @JsonKey(name: 'tagNames') List<String?>? tags,
      @JsonKey(name: 'meta') ContentMetadata? metadata}) = _$_Content;

  factory _Content.fromJson(Map<String, dynamic> json) = _$_Content.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get contentID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'intro')
  String? get intro => throw _privateConstructorUsedError;
  @override // TODO(abiud): move this to the Author object
  @JsonKey(name: 'authorName')
  String? get authorName => throw _privateConstructorUsedError;
  @override // TODO(abiud): add when backend is ready
// @JsonKey(name: 'authorAvatar') String? authorAvatar,
  @JsonKey(name: 'author')
  Author? get author => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'itemType')
  ContentType? get contentType => throw _privateConstructorUsedError;
  @override // "ARTICLE"
  @JsonKey(name: 'timeEstimateSeconds')
  int? get estimate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'heroImageRendition')
  HeroImage? get heroImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'likeCount')
  int? get likeCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'bookmarkCount')
  int? get bookmarkCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'viewCount')
  int? get viewCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'shareCount')
  int? get shareCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'documents')
  List<Document>? get documents => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'categoryDetails')
  List<ContentCategory>? get categories => throw _privateConstructorUsedError;
  @override // TODO(abiud): add when backend is ready
// @JsonKey(name: 'isNew') bool? isNew,
  @JsonKey(name: 'tagNames')
  List<String?>? get tags => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'meta')
  ContentMetadata? get metadata => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentCopyWith<_Content> get copyWith =>
      throw _privateConstructorUsedError;
}

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return _Document.fromJson(json);
}

/// @nodoc
class _$DocumentTearOff {
  const _$DocumentTearOff();

  _Document call(
      {@JsonKey(name: 'ID') int? id, @JsonKey(name: 'title') String? title}) {
    return _Document(
      id: id,
      title: title,
    );
  }

  Document fromJson(Map<String, Object> json) {
    return Document.fromJson(json);
  }
}

/// @nodoc
const $Document = _$DocumentTearOff();

/// @nodoc
mixin _$Document {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') int? id, @JsonKey(name: 'title') String? title});
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res> implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  final Document _value;
  // ignore: unused_field
  final $Res Function(Document) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$DocumentCopyWith<$Res> implements $DocumentCopyWith<$Res> {
  factory _$DocumentCopyWith(_Document value, $Res Function(_Document) then) =
      __$DocumentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') int? id, @JsonKey(name: 'title') String? title});
}

/// @nodoc
class __$DocumentCopyWithImpl<$Res> extends _$DocumentCopyWithImpl<$Res>
    implements _$DocumentCopyWith<$Res> {
  __$DocumentCopyWithImpl(_Document _value, $Res Function(_Document) _then)
      : super(_value, (v) => _then(v as _Document));

  @override
  _Document get _value => super._value as _Document;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_Document(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Document implements _Document {
  _$_Document(
      {@JsonKey(name: 'ID') this.id, @JsonKey(name: 'title') this.title});

  factory _$_Document.fromJson(Map<String, dynamic> json) =>
      _$_$_DocumentFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;

  @override
  String toString() {
    return 'Document(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Document &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$DocumentCopyWith<_Document> get copyWith =>
      __$DocumentCopyWithImpl<_Document>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DocumentToJson(this);
  }
}

abstract class _Document implements Document {
  factory _Document(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'title') String? title}) = _$_Document;

  factory _Document.fromJson(Map<String, dynamic> json) = _$_Document.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DocumentCopyWith<_Document> get copyWith =>
      throw _privateConstructorUsedError;
}

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

ContentMetadata _$ContentMetadataFromJson(Map<String, dynamic> json) {
  return _ContentMetadata.fromJson(json);
}

/// @nodoc
class _$ContentMetadataTearOff {
  const _$ContentMetadataTearOff();

  _ContentMetadata call(
      {@JsonKey(name: 'contentHTMLURL') String? publicLink,
      @JsonKey(name: 'firstPublishedAt') String? createdAt}) {
    return _ContentMetadata(
      publicLink: publicLink,
      createdAt: createdAt,
    );
  }

  ContentMetadata fromJson(Map<String, Object> json) {
    return ContentMetadata.fromJson(json);
  }
}

/// @nodoc
const $ContentMetadata = _$ContentMetadataTearOff();

/// @nodoc
mixin _$ContentMetadata {
  @JsonKey(name: 'contentHTMLURL')
  String? get publicLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstPublishedAt')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentMetadataCopyWith<ContentMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentMetadataCopyWith<$Res> {
  factory $ContentMetadataCopyWith(
          ContentMetadata value, $Res Function(ContentMetadata) then) =
      _$ContentMetadataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'contentHTMLURL') String? publicLink,
      @JsonKey(name: 'firstPublishedAt') String? createdAt});
}

/// @nodoc
class _$ContentMetadataCopyWithImpl<$Res>
    implements $ContentMetadataCopyWith<$Res> {
  _$ContentMetadataCopyWithImpl(this._value, this._then);

  final ContentMetadata _value;
  // ignore: unused_field
  final $Res Function(ContentMetadata) _then;

  @override
  $Res call({
    Object? publicLink = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      publicLink: publicLink == freezed
          ? _value.publicLink
          : publicLink // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ContentMetadataCopyWith<$Res>
    implements $ContentMetadataCopyWith<$Res> {
  factory _$ContentMetadataCopyWith(
          _ContentMetadata value, $Res Function(_ContentMetadata) then) =
      __$ContentMetadataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'contentHTMLURL') String? publicLink,
      @JsonKey(name: 'firstPublishedAt') String? createdAt});
}

/// @nodoc
class __$ContentMetadataCopyWithImpl<$Res>
    extends _$ContentMetadataCopyWithImpl<$Res>
    implements _$ContentMetadataCopyWith<$Res> {
  __$ContentMetadataCopyWithImpl(
      _ContentMetadata _value, $Res Function(_ContentMetadata) _then)
      : super(_value, (v) => _then(v as _ContentMetadata));

  @override
  _ContentMetadata get _value => super._value as _ContentMetadata;

  @override
  $Res call({
    Object? publicLink = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_ContentMetadata(
      publicLink: publicLink == freezed
          ? _value.publicLink
          : publicLink // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentMetadata implements _ContentMetadata {
  _$_ContentMetadata(
      {@JsonKey(name: 'contentHTMLURL') this.publicLink,
      @JsonKey(name: 'firstPublishedAt') this.createdAt});

  factory _$_ContentMetadata.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentMetadataFromJson(json);

  @override
  @JsonKey(name: 'contentHTMLURL')
  final String? publicLink;
  @override
  @JsonKey(name: 'firstPublishedAt')
  final String? createdAt;

  @override
  String toString() {
    return 'ContentMetadata(publicLink: $publicLink, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContentMetadata &&
            (identical(other.publicLink, publicLink) ||
                const DeepCollectionEquality()
                    .equals(other.publicLink, publicLink)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(publicLink) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$ContentMetadataCopyWith<_ContentMetadata> get copyWith =>
      __$ContentMetadataCopyWithImpl<_ContentMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContentMetadataToJson(this);
  }
}

abstract class _ContentMetadata implements ContentMetadata {
  factory _ContentMetadata(
          {@JsonKey(name: 'contentHTMLURL') String? publicLink,
          @JsonKey(name: 'firstPublishedAt') String? createdAt}) =
      _$_ContentMetadata;

  factory _ContentMetadata.fromJson(Map<String, dynamic> json) =
      _$_ContentMetadata.fromJson;

  @override
  @JsonKey(name: 'contentHTMLURL')
  String? get publicLink => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'firstPublishedAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentMetadataCopyWith<_ContentMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

/// @nodoc
class _$AuthorTearOff {
  const _$AuthorTearOff();

  _Author call({@JsonKey(name: 'ID') String? id}) {
    return _Author(
      id: id,
    );
  }

  Author fromJson(Map<String, Object> json) {
    return Author.fromJson(json);
  }
}

/// @nodoc
const $Author = _$AuthorTearOff();

/// @nodoc
mixin _$Author {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'ID') String? id});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res> implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  final Author _value;
  // ignore: unused_field
  final $Res Function(Author) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) then) =
      __$AuthorCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'ID') String? id});
}

/// @nodoc
class __$AuthorCopyWithImpl<$Res> extends _$AuthorCopyWithImpl<$Res>
    implements _$AuthorCopyWith<$Res> {
  __$AuthorCopyWithImpl(_Author _value, $Res Function(_Author) _then)
      : super(_value, (v) => _then(v as _Author));

  @override
  _Author get _value => super._value as _Author;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_Author(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Author implements _Author {
  _$_Author({@JsonKey(name: 'ID') this.id});

  factory _$_Author.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthorFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  @override
  String toString() {
    return 'Author(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Author &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$AuthorCopyWith<_Author> get copyWith =>
      __$AuthorCopyWithImpl<_Author>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthorToJson(this);
  }
}

abstract class _Author implements Author {
  factory _Author({@JsonKey(name: 'ID') String? id}) = _$_Author;

  factory _Author.fromJson(Map<String, dynamic> json) = _$_Author.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthorCopyWith<_Author> get copyWith => throw _privateConstructorUsedError;
}

HeroImage _$HeroImageFromJson(Map<String, dynamic> json) {
  return _HeroImage.fromJson(json);
}

/// @nodoc
class _$HeroImageTearOff {
  const _$HeroImageTearOff();

  _HeroImage call({@JsonKey(name: 'url') String? url}) {
    return _HeroImage(
      url: url,
    );
  }

  HeroImage fromJson(Map<String, Object> json) {
    return HeroImage.fromJson(json);
  }
}

/// @nodoc
const $HeroImage = _$HeroImageTearOff();

/// @nodoc
mixin _$HeroImage {
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeroImageCopyWith<HeroImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeroImageCopyWith<$Res> {
  factory $HeroImageCopyWith(HeroImage value, $Res Function(HeroImage) then) =
      _$HeroImageCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'url') String? url});
}

/// @nodoc
class _$HeroImageCopyWithImpl<$Res> implements $HeroImageCopyWith<$Res> {
  _$HeroImageCopyWithImpl(this._value, this._then);

  final HeroImage _value;
  // ignore: unused_field
  final $Res Function(HeroImage) _then;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$HeroImageCopyWith<$Res> implements $HeroImageCopyWith<$Res> {
  factory _$HeroImageCopyWith(
          _HeroImage value, $Res Function(_HeroImage) then) =
      __$HeroImageCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'url') String? url});
}

/// @nodoc
class __$HeroImageCopyWithImpl<$Res> extends _$HeroImageCopyWithImpl<$Res>
    implements _$HeroImageCopyWith<$Res> {
  __$HeroImageCopyWithImpl(_HeroImage _value, $Res Function(_HeroImage) _then)
      : super(_value, (v) => _then(v as _HeroImage));

  @override
  _HeroImage get _value => super._value as _HeroImage;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_HeroImage(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HeroImage implements _HeroImage {
  _$_HeroImage({@JsonKey(name: 'url') this.url});

  factory _$_HeroImage.fromJson(Map<String, dynamic> json) =>
      _$_$_HeroImageFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;

  @override
  String toString() {
    return 'HeroImage(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HeroImage &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(url);

  @JsonKey(ignore: true)
  @override
  _$HeroImageCopyWith<_HeroImage> get copyWith =>
      __$HeroImageCopyWithImpl<_HeroImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HeroImageToJson(this);
  }
}

abstract class _HeroImage implements HeroImage {
  factory _HeroImage({@JsonKey(name: 'url') String? url}) = _$_HeroImage;

  factory _HeroImage.fromJson(Map<String, dynamic> json) =
      _$_HeroImage.fromJson;

  @override
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HeroImageCopyWith<_HeroImage> get copyWith =>
      throw _privateConstructorUsedError;
}
