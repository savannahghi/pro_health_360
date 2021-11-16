import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';
import 'package:myafyahub/presentation/feed/feed_item_reaction_icon.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class ContentDetailPage extends StatelessWidget {
  /// [ContentDetailPage] is used to display the article details
  ///
  /// It takes in a required [articleDetails] parameter which is a map of the
  /// the information to be displayed on this screen
  ///
  const ContentDetailPage({required this.articleDetails});

  final Content articleDetails;

  @override
  Widget build(BuildContext context) {
    final Widget publishDate = sortDate(
      dateTextStyle: TextThemes.normalSize12Text(AppColors.greyTextColor),
      context: context,
      loadedDate: articleDetails.createdAt!,
    );

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
                      image: NetworkImage(articleDetails.heroImage!),
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
                    articleDetails.title!,
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
                                image: articleDetails.authorAvatar == null
                                    ? const AssetImage(profileImage)
                                    : NetworkImage(
                                        articleDetails.authorAvatar!,
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
                                articleDetails.author!,
                                style: TextThemes.veryBoldSize15Text(
                                  AppColors.secondaryColor,
                                ),
                              ),
                              verySmallVerticalSizedBox,
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Published on ',
                                    style: TextThemes.normalSize12Text(
                                      AppColors.greyTextColor,
                                    ),
                                  ),
                                  publishDate,
                                ],
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
            if (articleDetails.body != null)
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  articleDetails.body!,
                  style: TextThemes.normalSize16Text(
                    AppColors.greyTextColor,
                  ),
                ),
              )
            else
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: GenericEmptyData(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
