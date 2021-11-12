// Flutter imports
import 'package:flutter/material.dart';

// Package imports
import 'package:afya_moja_core/buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/presentation/core/widgets/mood_selection/mood_filter_chip.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';

class MoodFeedbackPage extends StatefulWidget {
  /// [MoodFeedbackPage] is used to get user feedback based on their current mood.
  ///
  const MoodFeedbackPage({
    Key? key,
    required this.moodType,
  }) : super(key: key);

  final MoodType moodType;

  @override
  State<MoodFeedbackPage> createState() => _MoodFeedbackPageState();
}

class _MoodFeedbackPageState extends State<MoodFeedbackPage> {
  late FollowUpChoice followUpChoice = FollowUpChoice.Unknown;
  final TextEditingController feedBackInputController = TextEditingController();
  bool describeCurrentCondition = false;
  bool inGoodMood = false;

  @override
  void initState() {
    super.initState();
    inGoodMood = widget.moodType == MoodType.Excited ||
        widget.moodType == MoodType.Happy;
    describeCurrentCondition = inGoodMood;
  }

  @override
  Widget build(BuildContext context) {
    final bool inGoodMood = widget.moodType == MoodType.Excited ||
        widget.moodType == MoodType.Happy;

    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: AppColors.blueChillColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            mediumVerticalSizedBox,
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                key: moodFeedbackGestureDetectorKey,
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.close,
                  size: 32,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        largeVerticalSizedBox,
                        Center(
                          child: SvgPicture.asset(
                            widget.moodType.iconString,
                          ),
                        ),
                        mediumVerticalSizedBox,
                        if (inGoodMood)
                          Text(
                            pleaseAddaNoteOnHowYouAreFeelingString,
                            style:
                                TextThemes.lightSize16Text(AppColors.whiteColor)
                                    .copyWith(fontSize: 20),
                          ),
                        if (!inGoodMood && describeCurrentCondition != true)
                          Column(
                            children: <Widget>[
                              Text(
                                areYouFeelingAnyOfTheFollowingString,
                                style: TextThemes.lightSize16Text(
                                  AppColors.whiteColor,
                                ).copyWith(fontSize: 20),
                              ),
                              smallVerticalSizedBox,
                              Text(
                                selectWhatBestDescribesHowYourCurrentConditionString,
                                style: TextThemes.normalSize14Text(
                                  AppColors.whiteColor,
                                ).copyWith(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        if (!inGoodMood && describeCurrentCondition == true)
                          Center(
                            child: Text(
                              soSorryPleaseDescribeHowAreFeelingString,
                              style: TextThemes.lightSize16Text(
                                AppColors.whiteColor,
                              ).copyWith(fontSize: 20),
                            ),
                          ),
                        mediumVerticalSizedBox,
                        if (!inGoodMood) _chipList(),
                        mediumVerticalSizedBox,
                        if (describeCurrentCondition)
                          Center(
                            child: TextField(
                              controller: feedBackInputController,
                              keyboardType: TextInputType.multiline,
                              style: TextThemes.normalSize14Text(
                                AppColors.whiteColor,
                              ),
                              maxLines: 9,
                              minLines: 8,
                              decoration: InputDecoration(
                                hintText: addNotesString,
                                hintStyle: TextThemes.normalSize14Text(
                                  AppColors.whiteColor,
                                ),
                                filled: true,
                                fillColor: AppColors.blueChillColor,
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.whiteColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.whiteColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusColor: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        largeVerticalSizedBox,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: moodFeedbackButtonKey,
                    onPressed: () {
                      if (!inGoodMood && !describeCurrentCondition) {
                        setState(() {
                          describeCurrentCondition = true;
                        });
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    buttonColor: AppColors.whiteColor,
                    borderColor: Colors.transparent,
                    text: inGoodMood ? saveEntryString : nextString,
                    textStyle:
                        TextThemes.normalSize14Text(AppColors.blackColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chipList() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: const <Widget>[
        MoodFilterChip(labelText: iHaveNightSweatsString),
        MoodFilterChip(labelText: iHaveaFeverString),
        MoodFilterChip(labelText: imCoughingString),
        MoodFilterChip(labelText: iVeLostWeightString),
      ],
    );
  }
}
