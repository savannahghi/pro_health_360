import 'package:flutter/material.dart';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

import 'package:pro_health_360/presentation/core/theme/theme.dart';

class HomePageCarouselItem extends StatelessWidget {
  const HomePageCarouselItem({
    required this.title,
    required this.description,
    required this.onTap,
    required this.buttonTitle,
    required this.type,
    this.beginButtonKey,
  });

  final Key? beginButtonKey;
  final String buttonTitle;
  final String description;
  final VoidCallback onTap;
  final String title;
  final HomePageCarouselItemType type;

  @override
  Widget build(BuildContext context) {
    // initialize colors depending on type
    final Color buttonTextColor =
        (type == HomePageCarouselItemType.SCREENING_TOOL)
            ? AppColors.primaryColor
            : AppColors.orangeColor;
    final Color containerColor =
        (type == HomePageCarouselItemType.SCREENING_TOOL)
            ? AppColors.primaryColor.withOpacity(0.14)
            : AppColors.orangeColor.withOpacity(0.14);
    final Color buttonColor = (type == HomePageCarouselItemType.SCREENING_TOOL)
        ? AppColors.primaryColor.withOpacity(0.3)
        : AppColors.orangeColor.withOpacity(0.3);

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
