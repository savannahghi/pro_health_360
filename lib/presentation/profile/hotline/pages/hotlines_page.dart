import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/entities/core/helpline.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/hotline/widgets/helpline_items_widget.dart';
import 'package:shared_themes/spaces.dart';

class HotlinesPage extends StatelessWidget {
  const HotlinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: hotlinesTitle),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              smallVerticalSizedBox,
              Center(
                child: SvgPicture.asset(feedbackImage, height: 200),
              ),
              smallVerticalSizedBox,
              Center(
                child: Text(
                  hotlinesPageTitle,
                  style: veryBoldSize20Text(AppColors.primaryColor),
                ),
              ),
              smallVerticalSizedBox,
              Text(
                hotlinesPageDescription,
                textAlign: TextAlign.center,
                style: normalSize15Text(AppColors.greyTextColor),
              ),
              mediumVerticalSizedBox,
              HelplineItemsWidget(helplines: myCareHubHelplines),
            ],
          ),
        ),
      ),
    );
  }
}
