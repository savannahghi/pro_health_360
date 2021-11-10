// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/presentation/feed/feed_item_widget.dart';
import 'feed_details.dart';

class FeedList extends StatelessWidget {
  final List<FeedDetails> feedItems;

  const FeedList({required this.feedItems});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: feedItems.length,
          itemBuilder: (BuildContext context, int index) {
            final FeedDetails feedDetails = feedItems.elementAt(index);
            return Padding(
              padding: const EdgeInsets.only(top: 7.5),
              child: FeedItem(
                feedDetails: feedDetails,
              ),
            );
          }),
    );
  }
}
