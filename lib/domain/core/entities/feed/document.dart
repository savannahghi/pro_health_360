// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'document.freezed.dart';
part 'document.g.dart';

@freezed
class Document with _$Document {
  factory Document({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Document') DocumentData? documentData,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  factory Document.initial() => Document(
        id: 0,
        documentData: DocumentData.initial(),
      );
}

@freezed
class DocumentData with _$DocumentData {
  factory DocumentData({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'meta') DocumentMetaData? documentMetaData,
  }) = _DocumentData;

  factory DocumentData.fromJson(Map<String, dynamic> json) =>
      _$DocumentDataFromJson(json);

  factory DocumentData.initial() => DocumentData(
        id: 0,
        title: UNKNOWN,
        documentMetaData: DocumentMetaData.initial(),
      );
}

@freezed
class DocumentMetaData with _$DocumentMetaData {
  factory DocumentMetaData({
    @JsonKey(name: 'documentDownloadUrl') String? documentDownloadUrl,
  }) = _DocumentMetaData;

  factory DocumentMetaData.fromJson(Map<String, dynamic> json) =>
      _$DocumentMetaDataFromJson(json);

  factory DocumentMetaData.initial() =>
      DocumentMetaData(documentDownloadUrl: UNKNOWN);
}
