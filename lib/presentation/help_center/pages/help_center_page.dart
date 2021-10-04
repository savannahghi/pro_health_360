import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/help_center/pages/help_center_channels.dart';
import 'package:myafyahub/presentation/help_center/widgets/faq_wrapper.dart';
import 'package:myafyahub/presentation/widgets/top_header.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const PageTopHeader(
                widget: HelpCenterChannels(),
                title: faqPageTitle,
                description: faqSubtitle,
                color: AppColors.secondaryColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        preferredPaddingOnStretchedScreens(context: context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    veryLargeVerticalSizedBox,
                    veryLargeVerticalSizedBox,
                    Text(
                      faqTextDescription,
                      style: TextThemes.boldSize16Text(),
                    ),
                    size15VerticalSizedBox,
                    Text(
                      faqTextSubtitle,
                      style: TextThemes.normalSize16Text(),
                    ),
                    mediumVerticalSizedBox,
                    FAQWrapper(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
