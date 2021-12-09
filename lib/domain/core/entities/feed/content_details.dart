// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';

part 'content_details.g.dart';

@JsonSerializable()
class ContentDetails {
  final Content content;
  final bool showReactions;

  ContentDetails({
    required this.content,
    this.showReactions = true,
  });

  factory ContentDetails.fromJson(Map<String, dynamic> json) =>
      _$ContentDetailsFromJson(json);
}
