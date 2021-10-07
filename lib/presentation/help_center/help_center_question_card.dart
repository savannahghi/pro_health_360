// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/help_center/pages/faq_detail_view_page.dart';

class HelpCenterQuestionCard extends StatelessWidget {
  const HelpCenterQuestionCard({required this.question, required this.answer});

  final String answer;
  final String question;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<FAQDetailViewPage>(
            builder: (_) => FAQDetailViewPage(
              answer: answer,
              question: question,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        key: helpCenterContainerKey,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 6,
              child: Text(
                question,
                style: TextThemes.boldSize16Text(
                  AppColors.blackColor.withOpacity(0.6),
                ),
              ),
            ),
            const SizedBox(width: 5),
            const Icon(UniconsLine.angle_right)
          ],
        ),
      ),
    );
  }
}
