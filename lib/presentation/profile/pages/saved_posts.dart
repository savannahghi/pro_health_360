// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/presentation/feed/feed_list.dart';

class SavedPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: savedText),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 7.5),
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(7), // Creates border
                      color: AppColors.secondaryColor,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.secondaryColor,
                    tabs: const <Widget>[
                      Tab(text: savedVideoText),
                      Tab(text: savedArticleText),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      FeedList(
                        feedItems: <Content>[
                          Content(
                            contentID: 'some-content-id',
                            authorAvatar: feedImage1,
                            heroImage: feedImage2,
                            createdAt: feedDate,
                            title: feedHeader,
                            author: treatmentBuddyString,
                            body: defactoZeroStateString(),
                          ),
                          Content(
                            contentID: 'some-content-id',
                            authorAvatar: feedImage1,
                            heroImage: feedImage1,
                            createdAt: feedDate,
                            title: feedHeader,
                            author: treatmentBuddyString,
                            body: defactoZeroStateString(),
                          ),
                          Content(
                            contentID: 'some-content-id',
                            authorAvatar: feedImage1,
                            heroImage: feedImage4,
                            createdAt: feedDate,
                            title: feedHeader,
                            author: treatmentBuddyString,
                            body: defactoZeroStateString(),
                          ),
                          Content(
                            contentID: 'some-content-id',
                            authorAvatar: feedImage1,
                            heroImage: feedImage5,
                            createdAt: feedDate,
                            title: feedHeader,
                            author: treatmentBuddyString,
                            body: defactoZeroStateString(),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
