// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'document.freezed.dart';
part 'document.g.dart';
@freezed
class Document with _$Document {
  factory Document({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'title') String? title,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  factory Document.initial() => Document(id: 0, title: UNKNOWN);
}
