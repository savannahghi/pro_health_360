// Flutter imports

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class MoodFeedbackPage extends StatefulWidget {
  /// [MoodFeedbackPage] is used to get user feedback based on their current mood.
  ///
  const MoodFeedbackPage({Key? key, required this.moodType}) : super(key: key);

  final MoodType moodType;

  @override
  State<MoodFeedbackPage> createState() => _MoodFeedbackPageState();
}

class _MoodFeedbackPageState extends State<MoodFeedbackPage> {
  final TextEditingController feedBackInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool shouldSelectSymptoms = widget.moodType == MoodType.Meh ||
        widget.moodType == MoodType.Sad ||
        widget.moodType == MoodType.VerySad;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  key: moodFeedbackGestureDetectorKey,
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 32,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                color: AppColors.primaryColor,
                                height: 100,
                              ),
                            ),
                            mediumVerticalSizedBox,
                            Center(
                              child: Text(
                                '$iAmFeelingText${widget.moodType.name}',
                                style: TextThemes.boldSize22Text(),
                              ),
                            ),
                            largeVerticalSizedBox,
                            Text(
                              selectWhatBestDescribesHowYourCurrentConditionString,
                              style: TextThemes.normalSize16Text(
                                AppColors.greyTextColor,
                              ),
                            ),
                            mediumVerticalSizedBox,
                            if (shouldSelectSymptoms)
                              Wrap(
                                spacing: 12.0,
                                runSpacing: 12.0,
                                children: const <Widget>[
                                  MoodSymptomWidget(
                                    title: iHaveNightSweatsString,
                                  ),
                                  MoodSymptomWidget(
                                    title: iHaveAFeverString,
                                    isSelected: true,
                                  ),
                                  MoodSymptomWidget(title: imCoughingString),
                                  MoodSymptomWidget(title: iVeLostWeightString),
                                ],
                              ),
                            mediumVerticalSizedBox,
                            mediumVerticalSizedBox,
                            Text(
                              elaborateString,
                              style: TextThemes.normalSize16Text(
                                AppColors.greyTextColor,
                              ),
                            ),
                            smallVerticalSizedBox,
                            TextField(
                              controller: feedBackInputController,
                              keyboardType: TextInputType.multiline,
                              style: TextThemes.normalSize14Text(
                                AppColors.greyTextColor,
                              ),
                              maxLines: 9,
                              minLines: 8,
                              decoration: InputDecoration(
                                hintText: addNotesString,
                                hintStyle: TextThemes.normalSize14Text(
                                  AppColors.greyTextColor.withOpacity(0.4),
                                ),
                                filled: true,
                                fillColor: AppColors.inputGreyColor,
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        AppColors.primaryColor.withOpacity(0.3),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                ),
                                focusColor: AppColors.greyTextColor,
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, right: 10, left: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: moodFeedbackButtonKey,
                      onPressed: () => Navigator.of(context).pop(),
                      buttonColor: AppColors.primaryColor,
                      borderColor: Colors.transparent,
                      text: saveString,
                      textStyle:
                          TextThemes.heavySize18Text(AppColors.whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
