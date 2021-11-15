// Package imports:
import 'package:user_feed/user_feed.dart';

// TODO(abiud): remove this after the feed state is nuked
extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension FeedResponsePayloadEx on FeedResponsePayload {
  static FeedResponsePayload initial() {
    return FeedResponsePayload(data: GetFeedData.initial());
  }
}
