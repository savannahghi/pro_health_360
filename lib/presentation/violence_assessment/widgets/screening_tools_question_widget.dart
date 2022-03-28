import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/entities/core/screening_question.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:shared_themes/spaces.dart';

class ScreeningToolQuestionWidget extends StatelessWidget {
  const ScreeningToolQuestionWidget({required this.screeningToolsQuestions});

  final List<ScreeningQuestion> screeningToolsQuestions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: screeningToolsQuestions.length,
      itemBuilder: (BuildContext context, int index) {
        final Map<String, dynamic> choices =
            screeningToolsQuestions[index].responseChoices!;
        final int sequenceNumber = screeningToolsQuestions[index].sequence!;
        final List<MoodSymptomWidget> symptomWidgets = <MoodSymptomWidget>[];
        final String questionText =
            '${sequenceNumber + 1}. ${screeningToolsQuestions[index].questionText!} ';

        choices.forEach((String key, dynamic value) {
          if (key == '0') {
            symptomWidgets.add(
              MoodSymptomWidget(
                title: value as String,
                isSelected: true,
                gestureKey: Key('${sequenceNumber.toString()}$key'),
              ),
            );
          } else {
            symptomWidgets.add(
              MoodSymptomWidget(
                title: value as String,
                gestureKey: Key('$sequenceNumber$key'),
              ),
            );
          }
        });
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (screeningToolsQuestions[index].meta != null)
              Text(
                screeningToolsQuestions[index].meta!['violence_type'] as String,
                style: veryBoldSize18Text(
                  AppColors.greyTextColor,
                ),
              ),
            smallVerticalSizedBox,
            Text(
              questionText,
              style: normalSize14Text(
                AppColors.greyTextColor,
              ),
            ),
            size15VerticalSizedBox,
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: symptomWidgets,
            ),
            largeVerticalSizedBox
          ],
        );
      },
    );
  }
}
