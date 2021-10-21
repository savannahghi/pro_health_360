import 'package:json_annotation/json_annotation.dart';

part 'faq_content.g.dart';

@JsonSerializable()
class FAQContent {
  final String title;
  final String body;

  FAQContent({
    required this.title,
    required this.body,
  });

  factory FAQContent.fromJson(Map<String, dynamic> json) =>
      _$FAQContentFromJson(json);
  Map<String, dynamic> toJson() => _$FAQContentToJson(this);
}
