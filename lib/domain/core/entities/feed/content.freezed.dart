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
