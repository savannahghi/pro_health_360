import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/profile_image_item.dart';
import 'package:myafyahub/presentation/core/widgets/filters/feed_item_filter.dart';
import 'package:myafyahub/presentation/feed/feed_details.dart';

import '../feed_item_widget.dart';

class MyAfyaHubFeedPage extends StatelessWidget {
  const MyAfyaHubFeedPage();

  @override
  Widget build(BuildContext context) {
    final List<FeedDetails> feedItems = <FeedDetails>[
      FeedDetails(
        coverImageUrl: feedImage3,
        header: feedHeader,
        date: feedDate,
        isNew: true,
      ),
      FeedDetails(
        coverImageUrl: feedImage2,
        header: feedHeader,
        date: feedDate,
        isNew: true,
      ),
      FeedDetails(
          coverImageUrl: feedImage1, header: feedHeader, date: feedDate),
      FeedDetails(
          coverImageUrl: feedImage3, header: feedHeader, date: feedDate),
    ];

    final List<Widget> feedFilterItems = <Widget>[
      FeedItemFilter(
        filterIcon: Icons.grid_view_sharp,
        filterText: 'All',
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackbar(content: comingSoonText));
        },
        isActive: true,
      ),
      FeedItemFilter(
        filterIcon: Icons.lightbulb_sharp,
        filterText: 'Recommended',
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackbar(content: comingSoonText));
        },
      ),
      FeedItemFilter(
        filterIcon: Icons.fitness_center_sharp,
        filterText: 'Exercise',
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackbar(content: comingSoonText));
        },
      ),
      FeedItemFilter(
        filterIcon: Icons.food_bank_outlined,
        filterText: 'Diet',
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackbar(content: comingSoonText));
        },
      ),
    ];

    return Scaffold(
      appBar: MyAfyaHubAppBar(
        leadingWidget: const ProfileImageItem(
          imageUrl: profileImage,
        ),
        title: libraryTitle,
        trailingWidget: IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackbar(content: comingSoonText));
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                width: double.infinity,
                height: 42,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: feedFilterItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 1 : 7.5),
                        child: feedFilterItems.elementAt(index),
                      );
                    }),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: feedItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String header = feedItems.elementAt(index).header;
                    final String date = feedItems.elementAt(index).date;
                    final String coverImageUrl =
                        feedItems.elementAt(index).coverImageUrl;
                    final String? readTime =
                        feedItems.elementAt(index).readTime;
                    final bool? isNew = feedItems.elementAt(index).isNew;

                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 15 : 7.5),
                      child: FeedItem(
                        coverImagePath: coverImageUrl,
                        contentHeader: header,
                        date: date,
                        readTime: readTime,
                        isNew: isNew,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
