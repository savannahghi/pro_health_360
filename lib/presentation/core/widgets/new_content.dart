// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/bottom_nav_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/feed/feed_details.dart';
import 'package:myafyahub/presentation/feed/feed_item_widget.dart';

class NewContent extends StatelessWidget {
  final List<FeedDetails> feedItems;

  const NewContent({required this.feedItems});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  newContentText,
                  style: TextThemes.veryBoldSize16Text(
                    AppColors.secondaryColor,
                  ),
                ),
                GestureDetector(
                  key: viewAllButtonKey,
                  onTap: () => StoreProvider.dispatch<AppState>(
                    context,
                    BottomNavAction(currentBottomNavIndex: 1),
                  ),
                  child: Text(
                    viewAllText,
                    style: TextThemes.normalSize16Text(
                      AppColors.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: feedItems.length,
              itemBuilder: (BuildContext context, int index) {
                final FeedDetails feedDetails = feedItems.elementAt(index);
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 15 : 7.5),
                  child: FeedItem(
                    feedDetails: feedDetails,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
