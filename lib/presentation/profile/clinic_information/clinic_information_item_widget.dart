// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [CallContactActionWidget] is a shared widget used in [ClinicInformationPage]
///
/// It takes in required [titleText] and [bodyText} parameters
///
class ClinicInformationItemWidget extends StatelessWidget {
  const ClinicInformationItemWidget({
    required this.titleText,
    required this.bodyText,
  });

  final String bodyText;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          bodyText,
          style: boldSize14Text(
            AppColors.secondaryColor,
          ),
        ),
        smallVerticalSizedBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Text(
                  titleText,
                  style: normalSize14Text(AppColors.darkGreyTextColor),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
