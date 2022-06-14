import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/entities/core/helpline.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HelplineItemsWidget extends StatelessWidget {
  final List<Helpline> helplines;

  const HelplineItemsWidget({Key? key, required this.helplines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...helplines
            .map(
              (Helpline line) => Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.14),
                  border: Border.all(color: AppColors.primaryColor, width: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      line.title,
                      style: heavySize16Text(AppColors.primaryColor),
                    ),
                    verySmallVerticalSizedBox,
                    Text(
                      line.phone,
                      style: boldSize15Text(AppColors.greyTextColor),
                    ),
                    smallVerticalSizedBox,
                    Text(
                      line.description,
                      style: normalSize14Text(AppColors.primaryColor),
                    ),
                    size15VerticalSizedBox,
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: MyAfyaHubPrimaryButton(
                        onPressed: () => launch('tel:${line.phone}'),
                        text: callString,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
