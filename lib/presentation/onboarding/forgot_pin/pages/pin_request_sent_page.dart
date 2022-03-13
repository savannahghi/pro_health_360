import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

class PinRequestSentPage extends StatelessWidget {
  const PinRequestSentPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              veryLargeVerticalSizedBox,
              SvgPicture.asset(
                pinRequestSentImage,
              ),
              largeVerticalSizedBox,
              Text(
                pinResetRequestSent,
                style: boldSize20Text(AppColors.blackColor),
              ),
              smallVerticalSizedBox,
              Text(
                weHaveNotifiedAdmin,
                style: normalSize14Text(AppColors.greyTextColor),
                textAlign: TextAlign.center,
              ),
              smallVerticalSizedBox,
              Text(
                oncePinRest,
                style: normalSize14Text(AppColors.greyTextColor),
                textAlign: TextAlign.center,
              ),
              largeVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                child: MyAfyaHubPrimaryButton(
                  text: okThanksText,
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
