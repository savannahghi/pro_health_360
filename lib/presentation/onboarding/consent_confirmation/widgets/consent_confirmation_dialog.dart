import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

class ConsentConfirmationDialog extends StatefulWidget {
  const ConsentConfirmationDialog({Key? key}) : super(key: key);

  @override
  State<ConsentConfirmationDialog> createState() =>
      _ConsentConfirmationDialogState();
}

class _ConsentConfirmationDialogState extends State<ConsentConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              areYouReallySureTitle,
              style: boldSize20Text(AppColors.blackColor),
            ),
            size15VerticalSizedBox,
            Text(
              optOutMessage,
              style: normalSize15Text(AppColors.greyTextColor),
            ),
            mediumVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                buttonColor: Colors.red,
                text: yesIam,
                textStyle: boldSize16Text(AppColors.whiteColor),
                textColor: AppColors.whiteColor,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(comingSoonText)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
