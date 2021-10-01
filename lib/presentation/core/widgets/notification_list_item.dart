import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

/// [NotificationListItem] Displays the notifications with Icons and a short description

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    required this.svgPath,
    required this.description,
    required this.date,
    bool? calendarDate,
    bool? isAlternateNotification,
  })  : this.calendarDate = calendarDate ?? false,
        this.isAlternateNotification = isAlternateNotification ?? false;

  final String svgPath;
  final String description;
  final String date;
  final bool isAlternateNotification;

  ///Displays a calendar widget
  final bool calendarDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            key: notificationIconContainerKey,
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isAlternateNotification
                  ? AppColors.secondaryColor
                  : Colors.white,
            ),
            child: Center(
              child: SvgPicture.asset(
                svgPath,
                width: 30,
                height: 30,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          mediumHorizontalSizedBox,
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  smallVerticalSizedBox,
                  Text(
                    description,
                    style: TextThemes.normalSize14Text(
                      AppColors.secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    date,
                    style: TextThemes.normalSize12Text(Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  if (calendarDate)
                    Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.secondaryColor,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(children: <Widget>[
                          SvgPicture.asset(
                            calendarIcon,
                            width: 20,
                            height: 20,
                            color: AppColors.secondaryColor,
                          ),
                          smallHorizontalSizedBox,
                          Expanded(
                            child: Text(
                              addCalendarText,
                              style: TextThemes.normalSize12Text(
                                AppColors.secondaryColor,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    )
                ]),
          )
        ],
      ),
    );
  }
}
