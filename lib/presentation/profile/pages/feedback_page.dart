import 'package:flutter/material.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:myafyahub/presentation/profile/widgets/medical_data_item_title.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class FeedbackPage extends StatefulWidget {
  /// [FeedbackPage] is used to get user feedback on app usage
  ///
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  late FollowUpChoice followUpChoice = FollowUpChoice.Unknown;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(title: feedbackString),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            largeVerticalSizedBox,
            const MedicalDataItemTitle(title: weValueFeedbackString),
            Text(
              howToImproveExperienceString,
              style: TextThemes.lightSize16Text(AppColors.greyTextColor)
                  .copyWith(fontSize: 12),
            ),
            veryLargeVerticalSizedBox,
            const MedicalDataItemTitle(title: anyThoughtsToShareString),
            const TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 9,
              minLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: AppColors.secondaryColor),
                ),
              ),
            ),
            veryLargeVerticalSizedBox,
            const MedicalDataItemTitle(title: followUpOnFeedbackString),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Radio<FollowUpChoice>(
                        key: yesRadioButtonKey,
                        activeColor: AppColors.secondaryColor,
                        value: FollowUpChoice.Yes,
                        groupValue: followUpChoice,
                        onChanged: (FollowUpChoice? value) {
                          setState(() {
                            followUpChoice = value!;
                          });
                        },
                      ),
                    ),
                    verySmallHorizontalSizedBox,
                    Text(
                      yesString,
                      style: TextThemes.lightSize16Text(AppColors.greyTextColor)
                          .copyWith(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                veryLargeHorizontalSizedBox,
                smallHorizontalSizedBox,
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                      child: Radio<FollowUpChoice>(
                        key: noRadioButtonKey,
                        value: FollowUpChoice.No,
                        groupValue: followUpChoice,
                        onChanged: (FollowUpChoice? value) {
                          setState(() {
                            followUpChoice = value!;
                          });
                        },
                        activeColor: AppColors.secondaryColor,
                      ),
                    ),
                    verySmallHorizontalSizedBox,
                    Text(
                      noString,
                      style: TextThemes.lightSize16Text(AppColors.greyTextColor)
                          .copyWith(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: sendFeedbackButtonKey,
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackbar(content: comingSoonText));
                      },
                      buttonColor: AppColors.secondaryColor,
                      borderColor: Colors.transparent,
                      text: sendFeedbackString,
                      textStyle: TextThemes.normalSize14Text(Colors.white),
                    ),
                  ),
                  smallHorizontalSizedBox,
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: cancelFeedbackButtonKey,
                      buttonColor: Colors.transparent,
                      borderColor: AppColors.secondaryColor,
                      text: cancelString,
                      textStyle:
                          TextThemes.normalSize14Text(AppColors.secondaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
