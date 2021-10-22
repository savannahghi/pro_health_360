// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/presentation/feed/feed_item_widget.dart';
import '../../domain/core/entities/feed/feed_details.dart';

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
            final String header = feedItems.elementAt(index).header;
            final String date = feedItems.elementAt(index).date;
            final String coverImageUrl =
                feedItems.elementAt(index).coverImageUrl;
            final String? readTime = feedItems.elementAt(index).readTime;
            final bool? isNew = feedItems.elementAt(index).isNew;
            final String authorName = feedItems.elementAt(index).authorName;
            final String? authorDisplayPic =
                feedItems.elementAt(index).authorDisplayPic;
            final String bodyContent = feedItems.elementAt(index).bodyContent;

            return Padding(
              padding: const EdgeInsets.only(top: 7.5),
              child: FeedItem(
                coverImagePath: coverImageUrl,
                contentHeader: header,
                date: date,
                readTime: readTime,
                isNew: isNew,
                authorName: authorName,
                bodyContent: bodyContent,
                authorDisplayPic: authorDisplayPic,
              ),
            );
          }),
    );
  }
}
