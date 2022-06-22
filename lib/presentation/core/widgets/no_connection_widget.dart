import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 30, 16, 14),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              size40VerticalSizedBox,
              SvgPicture.asset(noConnectionImage),
              mediumVerticalSizedBox,
              Text(
                noConnectionText,
                style: boldSize22Text(),
              ),
              mediumVerticalSizedBox,
              Text(
                noConnectionDescriptionText,
                style: normalSize15Text(AppColors.greyTextColor),
                textAlign: TextAlign.center,
              ),
              mediumVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
