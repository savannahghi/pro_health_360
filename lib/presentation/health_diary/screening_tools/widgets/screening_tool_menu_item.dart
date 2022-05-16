// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

class HomePageCarouselItem extends StatelessWidget {
  const HomePageCarouselItem({
    required this.title,
    required this.description,
    required this.onTap,
    required this.buttonTitle,
    required this.containerColor,
    required this.buttonTextColor,
    required this.buttonColor,
    this.beginButtonKey,
  });

  final Key? beginButtonKey;
  final String buttonTitle;
  final Color containerColor;
  final String description;
  final Function onTap;
  final Color buttonTextColor;
  final Color buttonColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: buttonTextColor.withOpacity(0.3)),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: heavySize16Text(buttonTextColor),
          ),
          smallVerticalSizedBox,
          Text(
            description,
            style: normalSize14Text(AppColors.secondaryColor.withOpacity(0.6)),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: MyAfyaHubPrimaryButton(
                borderColor: Colors.transparent,
                buttonColor: buttonColor,
                buttonKey: beginButtonKey,
                onPressed: () => onTap.call(),
                customChild: Text(
                  buttonTitle,
                  style: veryBoldSize15Text(buttonTextColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
