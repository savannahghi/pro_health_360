// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Document _$_$_DocumentFromJson(Map<String, dynamic> json) {
  return _$_Document(
    id: json['ID'] as int?,
    documentData: json['Document'] == null
        ? null
        : DocumentData.fromJson(json['Document'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_DocumentToJson(_$_Document instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Document': instance.documentData,
    };

_$_DocumentData _$_$_DocumentDataFromJson(Map<String, dynamic> json) {
  return _$_DocumentData(
    id: json['ID'] as int?,
    title: json['title'] as String?,
    documentMetaData: json['meta'] == null
        ? null
        : DocumentMetaData.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_DocumentDataToJson(_$_DocumentData instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'title': instance.title,
      'meta': instance.documentMetaData,
    };

_$_DocumentMetaData _$_$_DocumentMetaDataFromJson(Map<String, dynamic> json) {
  return _$_DocumentMetaData(
    documentDownloadUrl: json['documentDownloadUrl'] as String?,
  );
}

Map<String, dynamic> _$_$_DocumentMetaDataToJson(
        _$_DocumentMetaData instance) =>
    <String, dynamic>{
      'documentDownloadUrl': instance.documentDownloadUrl,
    };
