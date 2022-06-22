import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class EmptyConversationsWidget extends StatelessWidget {
  const EmptyConversationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(noChatImage),
            smallVerticalSizedBox,
            Text(
              noConversationsAvailable,
              style: veryBoldSize20Text(),
            ),
            size15VerticalSizedBox,
            Text(
              noConversationsDescription,
              style: normalSize16Text(AppColors.greyTextColor),
              textAlign: TextAlign.center,
            ),
            size40VerticalSizedBox,
            SizedBox(
              height: 48,
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                text: viewInvites,
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.groupInvitesPage),
              ),
            )
          ],
        ),
      ),
    );
  }
}
