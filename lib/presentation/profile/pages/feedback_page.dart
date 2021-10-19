// Flutter imports
import 'package:flutter/material.dart';

// Package imports
import 'package:afya_moja_core/buttons.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/widgets/medical_data_item_title.dart';

class FeedbackPage extends StatefulWidget {
  /// [FeedbackPage] is used to get user feedback on app usage
  ///
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  late FollowUpChoice followUpChoice = FollowUpChoice.Unknown;
  final TextEditingController feedBackInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(title: feedbackString),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      largeVerticalSizedBox,
                      const MedicalDataItemTitle(title: weValueFeedbackString),
                      Text(
                        howToImproveExperienceString,
                        style:
                            TextThemes.lightSize16Text(AppColors.greyTextColor)
                                .copyWith(fontSize: 12),
                      ),
                      veryLargeVerticalSizedBox,
                      const MedicalDataItemTitle(
                          title: anyThoughtsToShareString),
                      TextField(
                        controller: feedBackInputController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 9,
                        minLines: 8,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: AppColors.secondaryColor),
                          ),
                        ),
                      ),
                      veryLargeVerticalSizedBox,
                      const MedicalDataItemTitle(
                          title: followUpOnFeedbackString),
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
                                style: TextThemes.lightSize16Text(
                                        AppColors.greyTextColor)
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
                                style: TextThemes.lightSize16Text(
                                        AppColors.greyTextColor)
                                    .copyWith(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: MyAfyaHubPrimaryButton(
                            buttonKey: sendFeedbackButtonKey,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            buttonColor: feedBackInputController.text.isNotEmpty
                                ? AppColors.secondaryColor
                                : Colors.grey,
                            borderColor: Colors.transparent,
                            text: sendFeedbackString,
                            textStyle:
                                TextThemes.normalSize14Text(Colors.white),
                          ),
                        ),
                        smallHorizontalSizedBox,
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: MyAfyaHubPrimaryButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            buttonKey: cancelFeedbackButtonKey,
                            buttonColor: Colors.transparent,
                            borderColor: AppColors.secondaryColor,
                            text: cancelString,
                            textStyle: TextThemes.normalSize14Text(
                                AppColors.secondaryColor),
                          ),
                        ),
                        largeVerticalSizedBox,
                      ],
                    ),
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
