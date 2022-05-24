import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_engagement_state.freezed.dart';
part 'content_engagement_state.g.dart';

@freezed
class ContentEngagementState with _$ContentEngagementState {
  factory ContentEngagementState({
    @JsonKey(name: 'contentId') int? contentId,
    @JsonKey(name: 'contentOpenedAt') String? contentOpenedAt,
  }) = _ContentEngagementState;

  factory ContentEngagementState.fromJson(Map<String, dynamic> json) =>
      _$ContentEngagementStateFromJson(json);

  factory ContentEngagementState.initial() => ContentEngagementState(
        contentId: 0,
        contentOpenedAt: DateTime(DateTime.now().year).toString(),
      );
}
