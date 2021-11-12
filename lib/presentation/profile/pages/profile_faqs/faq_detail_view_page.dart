import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/entities/faqs/faq_content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_themes/text_themes.dart';

class FAQDetailViewPage extends StatelessWidget {
  final FAQContent payload;

  const FAQDetailViewPage({
    Key? key,
    required this.payload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              payload.title,
              style:
                  TextThemes.normalSize24Text(Theme.of(context).primaryColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: <Widget>[
                    const Image(
                      image: AssetImage(
                        comingSoonImgUrl,
                      ),
                    ),
                    Text(
                      comingSoonText,
                      style: TextThemes.normalSize16Text(
                        AppColors.blackColor.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
