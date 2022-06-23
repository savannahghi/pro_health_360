// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:pro_health_360/domain/core/entities/health_diary/health_diary_details_item_obj.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class MyHealthDiaryItemWidget extends StatelessWidget {
  /// [MyHealthDiaryItemWidget] is a shred widget used in [MyHealthDiaryPage]
  ///
  /// It requires [detailsList] and [date] parameters
  ///
  const MyHealthDiaryItemWidget({
    Key? key,
    required this.detailsList,
    required this.date,
  }) : super(key: key);
  final List<HealthDiaryDetailsItemObj> detailsList;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                SvgPicture.asset(
                  sunnyIconSvgPath,
                  width: 16,
                  height: 16,
                ),
                verySmallHorizontalSizedBox,
                Text(
                  date,
                  style: boldSize14Text(AppColors.secondaryColor),
                ),
              ],
            ),
            verySmallVerticalSizedBox,
          ],
        ),
        Container(
          color: AppColors.whiteColor,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              ...List<Widget>.generate(detailsList.length, (int index) {
                final String iconPath =
                    detailsList.elementAt(index).svgIconPath;
                final String time = detailsList.elementAt(index).time;
                final String title = detailsList.elementAt(index).title;
                final String description =
                    detailsList.elementAt(index).description;
                return Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.listCardColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            iconPath,
                            height: 30,
                            color: title.contains(happyString)
                                ? AppColors.greenHappyColor
                                : title.contains(neutralString)
                                    ? AppColors.mehMoodColor
                                    : AppColors.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                time,
                                style: normalSize10Text(
                                  AppColors.greyTextColor,
                                ).copyWith(
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  title,
                                  style: normalSize10Text(
                                    title.contains(happyString)
                                        ? AppColors.greenHappyColor
                                        : title.contains(neutralString)
                                            ? AppColors.mehMoodColor
                                            : AppColors.secondaryColor,
                                  ).copyWith(fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                description,
                                style: normalSize9Text(
                                  AppColors.secondaryColor,
                                ).copyWith(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    mediumVerticalSizedBox,
                  ],
                );
              }),
            ],
          ),
        ),
        mediumVerticalSizedBox,
      ],
    );
  }
}
