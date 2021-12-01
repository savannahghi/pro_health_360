import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class ContentZeroStateWidget extends StatelessWidget {
  const ContentZeroStateWidget({
    this.callBackFunction,
  });

  final VoidCallback? callBackFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          style: TextThemes.boldSize16Text(
            AppColors.readTimeBackgroundColor,
          ),
          textAlign: TextAlign.center,
        ),
        smallVerticalSizedBox,
        Text(
          contentZeroStateDescription,
          style: TextThemes.normalSize15Text(
            darkGreyTextColor,
          ),
          textAlign: TextAlign.center,
        ),
        size15VerticalSizedBox,
        SizedBox(
          height: 48,
          width: 180,
          child: MyAfyaHubPrimaryButton(
            customRadius: 4,
            text: contentZeroStateButtonText,
            textColor: AppColors.whiteColor,
            buttonColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            onPressed: callBackFunction,
          ),
        ),
      ],
    );
  }
}