import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/communities/flagged_messages/message_object.dart';

part 'flagged_messages_response.freezed.dart';
part 'flagged_messages_response.g.dart';

@freezed
class FlaggedMessagesResponse with _$FlaggedMessagesResponse {
  factory FlaggedMessagesResponse({
    @JsonKey(name: 'listFlaggedMessages') List<MessageObject?>? messages,
  }) = _FlaggedMessagesResponse;

  factory FlaggedMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$FlaggedMessagesResponseFromJson(json);
}
