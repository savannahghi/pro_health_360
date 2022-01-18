// Flutter imports:
// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/colors.dart';
import 'package:afya_moja_core/text_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

class ContentZeroStateWidget extends StatelessWidget {
  const ContentZeroStateWidget({this.callBackFunction});

  final VoidCallback? callBackFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              contentZeroStateImageUrl,
              height: MediaQuery.of(context).size.height / 3,
              width: 250,
            ),
          ),
          smallVerticalSizedBox,
          Text(
            contentZeroStateTitle,
            style: boldSize16Text(
              AppColors.readTimeBackgroundColor,
            ),
            textAlign: TextAlign.center,
          ),
          smallVerticalSizedBox,
          Text(
            contentZeroStateDescription,
            style: normalSize15Text(
              darkGreyTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          size15VerticalSizedBox,
          SizedBox(
            height: 48,
            width: double.infinity,
            child: MyAfyaHubPrimaryButton(
              text: contentZeroStateButtonText,
              textColor: AppColors.whiteColor,
              buttonColor: Theme.of(context).primaryColor,
              borderColor: Theme.of(context).primaryColor,
              onPressed: callBackFunction,
            ),
          ),
        ],
      ),
    );
  }
}
