// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'content_details.g.dart';

@JsonSerializable()
class ContentDetails {
  final Content content;
  final bool showReactions;
  final ContentDisplayedType contentDisplayedType;

  ContentDetails({
    required this.content,
    this.showReactions = true,
    this.contentDisplayedType = ContentDisplayedType.UNKNOWN,
  });

  factory ContentDetails.fromJson(Map<String, dynamic> json) =>
      _$ContentDetailsFromJson(json);
}
