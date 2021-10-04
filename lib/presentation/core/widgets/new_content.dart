import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/text_themes.dart';

import 'feed_item_widget.dart';

class NewContent extends StatelessWidget {
  final List<Map<String, dynamic>> feedItems;

  const NewContent({required this.feedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                  Text(
                    viewAllText,
                    style: TextThemes.normalSize16Text(
                      AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 247,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: feedItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String header =
                        feedItems.elementAt(index)['header'].toString();
                    final String date =
                        feedItems.elementAt(index)['date'].toString();
                    final String coverImageUrl =
                        feedItems.elementAt(index)['coverImageUrl'].toString();
                    final String? readTime =
                        feedItems.elementAt(index)['readTime'].toString() !=
                                'null'
                            ? feedItems.elementAt(index)['readTime'].toString()
                            : null;
                    final bool isNew =
                        feedItems.elementAt(index)['isNew'].toString() == 'null'
                            ? false
                            : feedItems.elementAt(index)['isNew'] as bool;
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 15 : 7.5),
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