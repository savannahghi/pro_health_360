import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/library/widgets/library_list_item.dart';
import 'package:myafyahub/domain/core/entities/library/library_content_item.dart';

import 'package:flutter/material.dart';

class LibraryPageArticlesList extends StatelessWidget {
  final LibraryContentItemData libraryContentItem;

  const LibraryPageArticlesList({
    Key? key,
    required this.libraryContentItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: libraryContainerKey,
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        key: libraryColumnKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LibraryListItem(
            libraryContentItem: libraryContentItem,
          ),
          const Divider()
        ],
      ),
    );
  }
}
