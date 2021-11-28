// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/presentation/content/widgets/content_item.dart';
import '../../../domain/core/entities/feed/content.dart';

class FeedList extends StatelessWidget {
  final List<Content> feedItems;

  const FeedList({required this.feedItems});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: feedItems.length,
        itemBuilder: (BuildContext context, int index) {
          final Content content = feedItems.elementAt(index);
          return Padding(
            padding: const EdgeInsets.only(top: 7.5),
            child: ContentItem(contentDetails: content),
          );
        },
      ),
    );
  }
}
