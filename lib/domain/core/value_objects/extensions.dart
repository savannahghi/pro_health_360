// Package imports:
import 'package:user_feed/user_feed.dart';

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension FeedResponsePayloadEx on FeedResponsePayload {
  static FeedResponsePayload initial() {
    return FeedResponsePayload(data: GetFeedData.initial());
  }

  bool isValid() =>
      this.data.getFeed.items != null &&
      this.data.getFeed.flavour != null &&
      this.data.getFeed.actions != null &&
      this.data.getFeed.uid != null;
}
