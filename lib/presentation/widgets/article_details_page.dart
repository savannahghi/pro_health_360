import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/feed/feed_item_reaction_icon.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class ArticleDetailsPage extends StatelessWidget {
  /// [ArticleDetailsPage] is used to display the article details
  ///
  /// It takes in a required [payload] parameter which is a map of the
  /// the information to be displayed on this screen
  ///
  const ArticleDetailsPage({required this.payload});
  final Map<String, dynamic> payload;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: libraryPageString),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(payload['coverImagePath'].toString()),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 30.0,
                right: 30.0,
                bottom: 10.0,
              ),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text(
                    payload['titleText'].toString(),
                    style: TextThemes.veryHeavySize20Text(
                      Colors.black,
                    ),
                  ),
                  mediumVerticalSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: payload['authorDisplayPic'] == null
                                    ? const AssetImage(profileImage)
                                    : NetworkImage(
                                        payload['authorDisplayPic'].toString(),
                                      ) as ImageProvider,
                              ),
                            ),
                          ),
                          smallHorizontalSizedBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                payload['authorName'].toString(),
                                style: TextThemes.veryBoldSize15Text(
                                  AppColors.secondaryColor,
                                ),
                              ),
                              Text(
                                '$datePublishedString${payload['date'].toString()}',
                                style: TextThemes.lightSize16Text(
                                  AppColors.greyTextColor,
                                ).copyWith(fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          FeedItemReactionIcon(
                            backgroundColor: Theme.of(context).backgroundColor,
                            svgPath: heartIconUrl,
                          ),
                          verySmallHorizontalSizedBox,
                          FeedItemReactionIcon(
                            backgroundColor: Theme.of(context).backgroundColor,
                            svgPath: shareIconUrl,
                          ),
                          verySmallHorizontalSizedBox,
                          FeedItemReactionIcon(
                            backgroundColor: Theme.of(context).backgroundColor,
                            svgPath: saveIconUrl,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 30.0,
                  right: 30.0,
                ),
                child: Text(
                  payload['bodyText'].toString(),
                  style: TextThemes.lightSize16Text(AppColors.greyTextColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
