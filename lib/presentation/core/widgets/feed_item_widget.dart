import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/feed_item_bottom_row.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

/// [FeedItem] Displays the feed
/// [isNew] renders the new tag
class FeedItem extends StatelessWidget {
  final String coverImagePath;
  final String contentHeader;
  final String date;
  final String? readTime;
  final bool isNew;

  const FeedItem({
    required this.coverImagePath,
    required this.contentHeader,
    required this.date,
    bool? isNew,
    this.readTime,
  }) : this.isNew = isNew ?? false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 370,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(children: <Widget>[
                Container(
                  height: 170.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(coverImagePath),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7.0),
                    ),
                  ),
                ),
                smallVerticalSizedBox,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    contentHeader,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor),
                  ),
                ),
                smallVerticalSizedBox,
                FeedItemBottomRow(
                  feedDate: date,
                  readTime: readTime,
                )
              ]),
            ),
            if (isNew)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 30.0,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                      color: Colors.redAccent[700],
                    ),
                    child: Center(
                      child: Text(
                        newString,
                        style: TextThemes.boldSize16Text(Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}
