import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/widgets/filters/feed_item_filter.dart';

/// FeedItemFilters
///
/// [FeedItemFilters] filters feed content.
///
class FeedItemFilters extends StatelessWidget {
  const FeedItemFilters({required this.filterItems});

  final List<Map<String, dynamic>> filterItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: filterItems.length,
        itemBuilder: (BuildContext context, int index) {
          final IconData filterIcon =
              filterItems.elementAt(index)['filterIcon'] as IconData;
          final String filterText =
              filterItems.elementAt(index)['filterText'].toString();
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 15 : 7.5),
            child: FeedItemFilter(
              filterIcon: filterIcon,
              filterText: filterText,
              onTap: () {},
            ),
          );
        });
  }
}
