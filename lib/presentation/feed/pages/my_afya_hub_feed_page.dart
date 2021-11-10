// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:myafyahub/application/core/services/utils.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_themes/text_themes.dart';
import '../feed_item_widget.dart';

class MyAfyaHubFeedPage extends StatefulWidget {
  const MyAfyaHubFeedPage();

  @override
  State<MyAfyaHubFeedPage> createState() => _MyAfyaHubFeedPageState();
}

class _MyAfyaHubFeedPageState extends State<MyAfyaHubFeedPage> {
  int _choiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: libraryTitle, showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _buildChoiceChips(context),
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
                    final String authorName =
                        feedItems.elementAt(index).authorName;
                    final String? authorDisplayPic =
                        feedItems.elementAt(index).authorDisplayPic;
                    final String bodyContent =
                        feedItems.elementAt(index).bodyContent;

                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 15 : 7.5),
                      child: FeedItem(
                        coverImagePath: coverImageUrl,
                        contentHeader: header,
                        date: date,
                        readTime: readTime,
                        isNew: isNew,
                        authorName: authorName,
                        bodyContent: bodyContent,
                        authorDisplayPic: authorDisplayPic,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceChips(BuildContext context) {
    final List<String> _choices = <String>[
      allString,
      recommendedString,
      exerciseString,
      dietString,
    ];
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 1 : 7.5),
            child: ChoiceChip(
              label: Text(
                _choices[index],
                style: TextThemes.normalSize16Text().copyWith(
                  color: _choiceIndex == index
                      ? AppColors.whiteColor
                      : AppColors.secondaryColor,
                ),
              ),
              labelStyle: const TextStyle(color: AppColors.whiteColor),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.whiteColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              selected: _choiceIndex == index,
              selectedColor: AppColors.secondaryColor,
              onSelected: (bool selected) {
                setState(() {
                  _choiceIndex = selected ? index : 0;
                });
              },
              backgroundColor: Colors.grey.shade300,
            ),
          );
        },
      ),
    );
  }
}
