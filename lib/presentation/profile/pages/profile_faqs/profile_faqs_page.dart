// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/entities/faqs/faq_content.dart';

// Package imports:
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/widgets/faq_item.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

class ProfileFaqsPage extends StatelessWidget {
  const ProfileFaqsPage();

  @override
  Widget build(BuildContext context) {
    final List<FAQItem> items = <FAQItem>[
      FAQItem(
        faqContent: FAQContent(
          title: howDoIUpdateMyProfileText,
          body: loremIpsumText,
        ),
      ),
      FAQItem(
        faqContent: FAQContent(
          title: howDoICheckMyMedicalInfoText,
          body: loremIpsumText,
        ),
      ),
      FAQItem(
        faqContent: FAQContent(
          title: howDoIUpdateMyNicknameText,
          body: loremIpsumText,
        ),
      ),
      FAQItem(
        faqContent: FAQContent(
          title: howDoIRescheduleAnAppointmentText,
          body: loremIpsumText,
        ),
      ),
    ];
    return Scaffold(
      appBar: const CustomAppBar(title: faqsText),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    frequentlyAskedQuestions,
                    style: TextThemes.normalSize32Text(
                        Theme.of(context).primaryColor),
                  ),
                  mediumVerticalSizedBox,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (_, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, BWRoutes.faqDetailViewPage,
                              arguments: items[index].faqContent);
                        },
                        child: items[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
