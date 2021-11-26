import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({
    this.callBackFunction,
    this.buttonColor,
  });

  final VoidCallback? callBackFunction;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.altCardBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(500),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SvgPicture.asset(
                      errorOutlineIconSvg,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                mediumHorizontalSizedBox,
                Flexible(
                  child: Text(
                    sendOTPError,
                    style: TextThemes.normalSize15Text(
                      darkGreyTextColor,
                    ),
                  ),
                ),
              ],
            ),
            size15VerticalSizedBox,
            SizedBox(
              height: 48,
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                customRadius: 4,
                text: resendOTP,
                textColor: AppColors.whiteColor,
                buttonColor: buttonColor ?? AppColors.secondaryColor,
                borderColor: buttonColor ?? AppColors.secondaryColor,
                onPressed: callBackFunction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
