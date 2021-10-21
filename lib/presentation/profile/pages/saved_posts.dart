// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/feed/feed_details.dart';
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
                        feedItems: <FeedDetails>[
                          FeedDetails(
                            coverImageUrl: feedImage3,
                            date: feedDate,
                            header: feedHeaderListSavedVideo,
                            authorName: treatmentBuddyString,
                            bodyContent: defactoZeroStateString(),
                          ),
                          FeedDetails(
                            coverImageUrl: feedImage3,
                            date: feedDate,
                            header: feedHeaderListSavedVideo,
                            authorName: treatmentBuddyString,
                            bodyContent: defactoZeroStateString(),
                          ),
                          FeedDetails(
                            coverImageUrl: feedImage3,
                            date: feedDate,
                            header: feedHeaderListSavedVideo,
                            authorName: treatmentBuddyString,
                            bodyContent: defactoZeroStateString(),
                          ),
                          FeedDetails(
                            coverImageUrl: feedImage3,
                            date: feedDate,
                            header: feedHeaderListSavedVideo,
                            authorName: treatmentBuddyString,
                            bodyContent: defactoZeroStateString(),
                          )
                        ],
                      ),
                      FeedList(
                        feedItems: <FeedDetails>[
                          FeedDetails(
                            coverImageUrl: feedImage2,
                            date: feedDate,
                            header: feedHeader,
                            authorName: treatmentBuddyString,
                            bodyContent: defactoZeroStateString(),
                          ),
                          FeedDetails(
                            coverImageUrl: feedImage1,
                            date: feedDate,
                            header: feedHeader,
                            authorName: treatmentBuddyString,
                            bodyContent: defactoZeroStateString(),
                          ),
                          FeedDetails(
                            coverImageUrl: feedImage4,
                            date: feedDate,
                            header: feedHeader,
                            authorName: treatmentBuddyString,
                            bodyContent: defactoZeroStateString(),
                          ),
                          FeedDetails(
                            coverImageUrl: feedImage5,
                            date: feedDate,
                            header: feedHeader,
                            authorName: treatmentBuddyString,
                            bodyContent: defactoZeroStateString(),
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
