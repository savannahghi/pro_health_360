import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/library/library_content_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

import 'package:myafyahub/presentation/engagement/library/pages/library_page_articles_list.dart';
import 'package:myafyahub/presentation/engagement/library/widgets/featured_content.dart';

import 'package:flutter/material.dart';

class LibraryPageContent extends StatelessWidget {
  /// [libContent] are the library items. This list should never be empty.If by any chance it's empty
  /// and the widget is drawn, it means there is a bug in the initial check step at [feed.dart] -> [Library]
  final List<dynamic> libContent;

  const LibraryPageContent({Key? key, required this.libContent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        key: libraryPageContentKey,
        physics: const ScrollPhysics(),
        child: Column(
          children: <Widget>[
            FeaturedContent(
              libContent: libContent,
              key: libraryFeaturedContentKey,
              featuredContentImagePath:
                  libContent[3]['featureImage'].toString(),
              featuredContentTitle: libContent[3]['title'].toString(),
              featuredContentReadTime: libContent[3]['readingTime'].toString(),
              featuredContentPublishDate:
                  libContent[3]['publishedAt'].toString(),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              key: libraryListContentKey,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: libContent.length,
              itemBuilder: (BuildContext context, int index) {
                final LibraryContentItemData libraryContentItemData =
                    listLibraryDataItems(index, libContent);

                return LibraryPageArticlesList(
                    libraryContentItem: libraryContentItemData);
              },
            ),
          ],
        ),
      ),
    );
  }
}
