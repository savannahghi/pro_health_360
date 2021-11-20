// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class CallContactActionWidget extends StatelessWidget {
  /// [CallContactActionWidget] is a shared widget used in [ClinicInformationPage] and [UserProfilePage]
  ///
  /// It takes in required [phoneNumber] parameter
  ///
  const CallContactActionWidget({
    this.backgroundColor,
    this.textColor,
    required this.phoneNumber,
    this.iconColor,
    this.iconBackground,
  });

  final Color? backgroundColor;
  final Color? iconBackground;
  final Color? iconColor;
  final String phoneNumber;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Text(
              phoneNumber,
              style: TextStyle(
                color: textColor ?? AppColors.darkGreyTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBackground ?? Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: GestureDetector(
              key: hotlineCallButtonKey,
              onTap: () {
                launch('tel:$phoneNumber');
              },
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    phoneCallIcon,
                    color: iconColor ?? Colors.white,
                    width: 14,
                    height: 14,
                  ),
                  smallHorizontalSizedBox,
                  Text(
                    callString,
                    style: TextStyle(
                      color: iconColor ?? Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
