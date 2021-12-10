// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:user_feed/user_feed.dart';

part 'faq_content.freezed.dart';
part 'faq_content.g.dart';

@freezed
class FAQContent with _$FAQContent {
  factory FAQContent({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Active') bool? active,
    @JsonKey(name: 'Title') String? title,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'Body') String? body,
    @JsonKey(name: 'Flavour') String? flavour,
  }) = _FAQContent;

  factory FAQContent.fromJson(Map<String, dynamic> json) =>
      _$FAQContentFromJson(json);

  factory FAQContent.initial() => FAQContent(
        id: UNKNOWN,
        active: false,
        title: UNKNOWN,
        description: UNKNOWN,
        body: UNKNOWN,
        flavour: Flavour.UNKNOWN.name,
      );
}
