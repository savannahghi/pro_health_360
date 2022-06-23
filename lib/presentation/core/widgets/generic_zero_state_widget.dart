// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class GenericZeroStateWidget extends StatelessWidget {
  const GenericZeroStateWidget({
    required this.callBackFunction,
    required this.iconUrl,
    required this.title,
    required this.description,
    required this.buttonText,
  });

  final String buttonText;
  final VoidCallback? callBackFunction;
  final String description;
  final String iconUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              iconUrl,
              height: MediaQuery.of(context).size.height / 3,
              width: 250,
            ),
          ),
          smallVerticalSizedBox,
          Text(
            title,
            style: boldSize16Text(
              readTimeBackgroundColor,
            ),
            textAlign: TextAlign.center,
          ),
          smallVerticalSizedBox,
          Text(
            description,
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
              text: buttonText,
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
