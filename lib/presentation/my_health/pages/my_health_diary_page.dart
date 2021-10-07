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
  final String month = 'August 2021';

  final List<HealthDiaryItemObj> diaryItems = <HealthDiaryItemObj>[
    HealthDiaryItemObj(
      date: 'Tuesday 13th',
      detailsList: <HealthDiaryDetailsItemObj>[
        HealthDiaryDetailsItemObj(
            svgIconPath: sadMoodIconSvgPath,
            time: '8:00 am',
            description: 'Description of how you are feeling today',
            title: 'Sad'),
        HealthDiaryDetailsItemObj(
            svgIconPath: textIconSvgPath,
            time: '8:00 am',
            description: 'Description of how you are feeling today',
            title: 'Text'),
      ],
    ),
    HealthDiaryItemObj(
      date: 'Wednesday 19th',
      detailsList: <HealthDiaryDetailsItemObj>[
        HealthDiaryDetailsItemObj(
            svgIconPath: happyMoodIconSvgPath,
            time: '8:00 am',
            description: 'Description of how you are feeling today',
            title: 'Happy'),
        HealthDiaryDetailsItemObj(
            svgIconPath: mehMoodIconSvgPath,
            time: '8:00 am',
            description: 'Description of how you are feeling today',
            title: 'Meh!'),
      ],
    ),
    HealthDiaryItemObj(
      date: 'Monday 21st',
      detailsList: <HealthDiaryDetailsItemObj>[
        HealthDiaryDetailsItemObj(
            svgIconPath: sadMoodIconSvgPath,
            time: '8:00 am',
            description: 'Description of how you are feeling today',
            title: 'Sad'),
        HealthDiaryDetailsItemObj(
            svgIconPath: imageIconSvgPath,
            time: '8:00 am',
            description: 'Description of how you are feeling today',
            title: 'Image'),
      ],
    ),
    HealthDiaryItemObj(
      date: 'Wednesday 25th',
      detailsList: <HealthDiaryDetailsItemObj>[
        HealthDiaryDetailsItemObj(
            svgIconPath: sadMoodIconSvgPath,
            time: '8:00 am',
            description: 'Description of how you are feeling today',
            title: 'Sad'),
        HealthDiaryDetailsItemObj(
            svgIconPath: imageIconSvgPath,
            time: '8:00 am',
            description: 'Description of how you are feeling today',
            title: 'Text'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: MyAfyaHubAppBar(
        title: myHealthDiaryString,
        leadingWidget: SvgPicture.asset(
            backIcon,
            color: AppColors.secondaryColor,
          
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  color: AppColors.darkGreyBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 30.0),
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
          DraggableScrollableSheet(
            initialChildSize: 0.07,
            minChildSize: 0.07,
            maxChildSize: 0.21,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: AppColors.whiteColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      verySmallVerticalSizedBox,
                      Container(
                        height: 4,
                        width: 140,
                        color: Colors.grey[300],
                      ),
                      smallVerticalSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.add_box_outlined,
                            color: AppColors.secondaryColor,
                            size: 18,
                          ),
                          verySmallHorizontalSizedBox,
                          Text(
                            addDiaryString,
                            textAlign: TextAlign.center,
                            style: TextThemes.normalSize11Text(
                              AppColors.secondaryColor,
                            ).copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      mediumVerticalSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.listCardColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SvgPicture.asset(
                                  textIconSvgPath,
                                  height: 30,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              verySmallVerticalSizedBox,
                              Text(
                                textString,
                                textAlign: TextAlign.center,
                                style: TextThemes.normalSize11Text(
                                  AppColors.secondaryColor,
                                ),
                              ),
                              mediumVerticalSizedBox,
                            ],
                          ),
                          veryLargeHorizontalSizedBox,
                          Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.listCardColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SvgPicture.asset(
                                  happyMoodIconSvgPath,
                                  height: 30,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              verySmallVerticalSizedBox,
                              Text(
                                feelingString,
                                textAlign: TextAlign.center,
                                style: TextThemes.normalSize11Text(
                                  AppColors.secondaryColor,
                                ),
                              ),
                              mediumVerticalSizedBox,
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
