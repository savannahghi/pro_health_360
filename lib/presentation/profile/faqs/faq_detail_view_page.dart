// Flutter imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/faqs/faq_content.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
// Package imports:
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Text(
                payload.title ?? UNKNOWN,
                style: TextThemes.veryBoldSize18Text(Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                payload.description ?? UNKNOWN,
                style: TextThemes.normalSize14Text(AppColors.greyTextColor),
              ),
            ),
            Html(
              data: payload.body,
            ),
          ],
        ),
      ),
    );
  }
}
