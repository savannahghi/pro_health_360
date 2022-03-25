// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

class ScreeningToolMenuItem extends StatelessWidget {
  const ScreeningToolMenuItem({
    required this.title,
    required this.description,
    required this.onTap,
    this.beginButtonKey,
  });

  final String description;
  final Function onTap;
  final String title;
  final Key? beginButtonKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: AppColors.purpleChillColor.withOpacity(0.14),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: AppColors.purpleChillColor.withOpacity(0.3),
        ),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: boldSize16Text(),
          ),
          smallVerticalSizedBox,
          Text(
            description,
            style: normalSize14Text(
              AppColors.secondaryColor.withOpacity(0.6),
            ),
          ),
          mediumVerticalSizedBox,
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: MyAfyaHubPrimaryButton(
                text: beginString,
                buttonKey: beginButtonKey,
                onPressed: () {
                  onTap.call();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
