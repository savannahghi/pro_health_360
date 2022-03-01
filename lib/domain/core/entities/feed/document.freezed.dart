// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return _Document.fromJson(json);
}

/// @nodoc
class _$DocumentTearOff {
  const _$DocumentTearOff();

  _Document call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Document') DocumentData? documentData}) {
    return _Document(
      id: id,
      documentData: documentData,
    );
  }

  Document fromJson(Map<String, Object?> json) {
    return Document.fromJson(json);
  }
}

/// @nodoc
const $Document = _$DocumentTearOff();

/// @nodoc
mixin _$Document {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Document')
  DocumentData? get documentData => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Document') DocumentData? documentData});

  $DocumentDataCopyWith<$Res>? get documentData;
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
    Object? documentData = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      documentData: documentData == freezed
          ? _value.documentData
          : documentData // ignore: cast_nullable_to_non_nullable
              as DocumentData?,
    ));
  }

  @override
  $DocumentDataCopyWith<$Res>? get documentData {
    if (_value.documentData == null) {
      return null;
    }

    return $DocumentDataCopyWith<$Res>(_value.documentData!, (value) {
      return _then(_value.copyWith(documentData: value));
    });
  }
}

/// @nodoc
abstract class _$DocumentCopyWith<$Res> implements $DocumentCopyWith<$Res> {
  factory _$DocumentCopyWith(_Document value, $Res Function(_Document) then) =
      __$DocumentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Document') DocumentData? documentData});

  @override
  $DocumentDataCopyWith<$Res>? get documentData;
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
    Object? documentData = freezed,
  }) {
    return _then(_Document(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      documentData: documentData == freezed
          ? _value.documentData
          : documentData // ignore: cast_nullable_to_non_nullable
              as DocumentData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Document implements _Document {
  _$_Document(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Document') this.documentData});

  factory _$_Document.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Document')
  final DocumentData? documentData;

  @override
  String toString() {
    return 'Document(id: $id, documentData: $documentData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Document &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.documentData, documentData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(documentData));

  @JsonKey(ignore: true)
  @override
  _$DocumentCopyWith<_Document> get copyWith =>
      __$DocumentCopyWithImpl<_Document>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentToJson(this);
  }
}

abstract class _Document implements Document {
  factory _Document(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Document') DocumentData? documentData}) = _$_Document;

  factory _Document.fromJson(Map<String, dynamic> json) = _$_Document.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Document')
  DocumentData? get documentData;
  @override
  @JsonKey(ignore: true)
  _$DocumentCopyWith<_Document> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentData _$DocumentDataFromJson(Map<String, dynamic> json) {
  return _DocumentData.fromJson(json);
}

/// @nodoc
class _$DocumentDataTearOff {
  const _$DocumentDataTearOff();

  _DocumentData call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'meta') DocumentMetaData? documentMetaData}) {
    return _DocumentData(
      id: id,
      title: title,
      documentMetaData: documentMetaData,
    );
  }

  DocumentData fromJson(Map<String, Object?> json) {
    return DocumentData.fromJson(json);
  }
}

/// @nodoc
const $DocumentData = _$DocumentDataTearOff();

/// @nodoc
mixin _$DocumentData {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  DocumentMetaData? get documentMetaData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentDataCopyWith<DocumentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentDataCopyWith<$Res> {
  factory $DocumentDataCopyWith(
          DocumentData value, $Res Function(DocumentData) then) =
      _$DocumentDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'meta') DocumentMetaData? documentMetaData});

  $DocumentMetaDataCopyWith<$Res>? get documentMetaData;
}

/// @nodoc
class _$DocumentDataCopyWithImpl<$Res> implements $DocumentDataCopyWith<$Res> {
  _$DocumentDataCopyWithImpl(this._value, this._then);

  final DocumentData _value;
  // ignore: unused_field
  final $Res Function(DocumentData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? documentMetaData = freezed,
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
      documentMetaData: documentMetaData == freezed
          ? _value.documentMetaData
          : documentMetaData // ignore: cast_nullable_to_non_nullable
              as DocumentMetaData?,
    ));
  }

  @override
  $DocumentMetaDataCopyWith<$Res>? get documentMetaData {
    if (_value.documentMetaData == null) {
      return null;
    }

    return $DocumentMetaDataCopyWith<$Res>(_value.documentMetaData!, (value) {
      return _then(_value.copyWith(documentMetaData: value));
    });
  }
}

/// @nodoc
abstract class _$DocumentDataCopyWith<$Res>
    implements $DocumentDataCopyWith<$Res> {
  factory _$DocumentDataCopyWith(
          _DocumentData value, $Res Function(_DocumentData) then) =
      __$DocumentDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'meta') DocumentMetaData? documentMetaData});

  @override
  $DocumentMetaDataCopyWith<$Res>? get documentMetaData;
}

/// @nodoc
class __$DocumentDataCopyWithImpl<$Res> extends _$DocumentDataCopyWithImpl<$Res>
    implements _$DocumentDataCopyWith<$Res> {
  __$DocumentDataCopyWithImpl(
      _DocumentData _value, $Res Function(_DocumentData) _then)
      : super(_value, (v) => _then(v as _DocumentData));

  @override
  _DocumentData get _value => super._value as _DocumentData;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? documentMetaData = freezed,
  }) {
    return _then(_DocumentData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      documentMetaData: documentMetaData == freezed
          ? _value.documentMetaData
          : documentMetaData // ignore: cast_nullable_to_non_nullable
              as DocumentMetaData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentData implements _DocumentData {
  _$_DocumentData(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'meta') this.documentMetaData});

  factory _$_DocumentData.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentDataFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'meta')
  final DocumentMetaData? documentMetaData;

  @override
  String toString() {
    return 'DocumentData(id: $id, title: $title, documentMetaData: $documentMetaData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DocumentData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.documentMetaData, documentMetaData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(documentMetaData));

  @JsonKey(ignore: true)
  @override
  _$DocumentDataCopyWith<_DocumentData> get copyWith =>
      __$DocumentDataCopyWithImpl<_DocumentData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentDataToJson(this);
  }
}

abstract class _DocumentData implements DocumentData {
  factory _DocumentData(
          {@JsonKey(name: 'ID') int? id,
          @JsonKey(name: 'title') String? title,
          @JsonKey(name: 'meta') DocumentMetaData? documentMetaData}) =
      _$_DocumentData;

  factory _DocumentData.fromJson(Map<String, dynamic> json) =
      _$_DocumentData.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'meta')
  DocumentMetaData? get documentMetaData;
  @override
  @JsonKey(ignore: true)
  _$DocumentDataCopyWith<_DocumentData> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentMetaData _$DocumentMetaDataFromJson(Map<String, dynamic> json) {
  return _DocumentMetaData.fromJson(json);
}

/// @nodoc
class _$DocumentMetaDataTearOff {
  const _$DocumentMetaDataTearOff();

  _DocumentMetaData call(
      {@JsonKey(name: 'documentDownloadUrl') String? documentDownloadUrl}) {
    return _DocumentMetaData(
      documentDownloadUrl: documentDownloadUrl,
    );
  }

  DocumentMetaData fromJson(Map<String, Object?> json) {
    return DocumentMetaData.fromJson(json);
  }
}

/// @nodoc
const $DocumentMetaData = _$DocumentMetaDataTearOff();

/// @nodoc
mixin _$DocumentMetaData {
  @JsonKey(name: 'documentDownloadUrl')
  String? get documentDownloadUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentMetaDataCopyWith<DocumentMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentMetaDataCopyWith<$Res> {
  factory $DocumentMetaDataCopyWith(
          DocumentMetaData value, $Res Function(DocumentMetaData) then) =
      _$DocumentMetaDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'documentDownloadUrl') String? documentDownloadUrl});
}

/// @nodoc
class _$DocumentMetaDataCopyWithImpl<$Res>
    implements $DocumentMetaDataCopyWith<$Res> {
  _$DocumentMetaDataCopyWithImpl(this._value, this._then);

  final DocumentMetaData _value;
  // ignore: unused_field
  final $Res Function(DocumentMetaData) _then;

  @override
  $Res call({
    Object? documentDownloadUrl = freezed,
  }) {
    return _then(_value.copyWith(
      documentDownloadUrl: documentDownloadUrl == freezed
          ? _value.documentDownloadUrl
          : documentDownloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$DocumentMetaDataCopyWith<$Res>
    implements $DocumentMetaDataCopyWith<$Res> {
  factory _$DocumentMetaDataCopyWith(
          _DocumentMetaData value, $Res Function(_DocumentMetaData) then) =
      __$DocumentMetaDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'documentDownloadUrl') String? documentDownloadUrl});
}

/// @nodoc
class __$DocumentMetaDataCopyWithImpl<$Res>
    extends _$DocumentMetaDataCopyWithImpl<$Res>
    implements _$DocumentMetaDataCopyWith<$Res> {
  __$DocumentMetaDataCopyWithImpl(
      _DocumentMetaData _value, $Res Function(_DocumentMetaData) _then)
      : super(_value, (v) => _then(v as _DocumentMetaData));

  @override
  _DocumentMetaData get _value => super._value as _DocumentMetaData;

  @override
  $Res call({
    Object? documentDownloadUrl = freezed,
  }) {
    return _then(_DocumentMetaData(
      documentDownloadUrl: documentDownloadUrl == freezed
          ? _value.documentDownloadUrl
          : documentDownloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentMetaData implements _DocumentMetaData {
  _$_DocumentMetaData(
      {@JsonKey(name: 'documentDownloadUrl') this.documentDownloadUrl});

  factory _$_DocumentMetaData.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentMetaDataFromJson(json);

  @override
  @JsonKey(name: 'documentDownloadUrl')
  final String? documentDownloadUrl;

  @override
  String toString() {
    return 'DocumentMetaData(documentDownloadUrl: $documentDownloadUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DocumentMetaData &&
            const DeepCollectionEquality()
                .equals(other.documentDownloadUrl, documentDownloadUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(documentDownloadUrl));

  @JsonKey(ignore: true)
  @override
  _$DocumentMetaDataCopyWith<_DocumentMetaData> get copyWith =>
      __$DocumentMetaDataCopyWithImpl<_DocumentMetaData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentMetaDataToJson(this);
  }
}

abstract class _DocumentMetaData implements DocumentMetaData {
  factory _DocumentMetaData(
          {@JsonKey(name: 'documentDownloadUrl') String? documentDownloadUrl}) =
      _$_DocumentMetaData;

  factory _DocumentMetaData.fromJson(Map<String, dynamic> json) =
      _$_DocumentMetaData.fromJson;

  @override
  @JsonKey(name: 'documentDownloadUrl')
  String? get documentDownloadUrl;
  @override
  @JsonKey(ignore: true)
  _$DocumentMetaDataCopyWith<_DocumentMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}
