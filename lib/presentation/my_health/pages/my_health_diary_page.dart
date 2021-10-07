// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/health_diary_details_item_obj.dart';
import 'package:myafyahub/domain/core/entities/core/health_diary_item_obj.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/my_health/widgets/my_health_diary_item_widget.dart';

class MyHealthDiaryPage extends StatelessWidget {
  /// [MyHealthDiaryPage] is used to display the contents of client's diary
  /// from a particular month
  ///
  /// It requires [diaryItems] and [month] parameters
  ///
  const MyHealthDiaryPage({required this.diaryItems, required this.month});
  final String month;
  final List<HealthDiaryItemObj> diaryItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: MyAfyaHubAppBar(
        trailingWidget: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: SvgPicture.asset(
            notificationIcon,
            color: AppColors.secondaryColor,
            width: 20,
          ),
        ),
        title: myHealthDiaryString,
        leadingWidget: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: SvgPicture.asset(
            backIcon,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: AppColors.darkGreyBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 25.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SvgPicture.asset(
                        prevIconSvgPath,
                        width: 16,
                        height: 16,
                      ),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            calendarIcon,
                            width: 16,
                            height: 16,
                            color: AppColors.secondaryColor,
                          ),
                          smallHorizontalSizedBox,
                          Text(
                            month,
                            style: TextThemes.boldSize14Text(
                              AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        nextIconSvgPath,
                        width: 16,
                        height: 16,
                      ),
                    ]),
              ),
            ),
            mediumVerticalSizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  ...List<Widget>.generate(diaryItems.length, (int index) {
                    final String date = diaryItems.elementAt(index).date;
                    final List<HealthDiaryDetailsItemObj> detailsList =
                        diaryItems.elementAt(index).detailsList;
                    return MyHealthDiaryItemWidget(
                      detailsList: detailsList,
                      date: date,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
