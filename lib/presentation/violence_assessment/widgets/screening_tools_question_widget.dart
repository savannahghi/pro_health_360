import 'package:flutter/material.dart';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/update_screening_tools_state_action.dart';
import 'package:myafyahub/application/redux/states/alcohol_substance_use_state.dart';
import 'package:myafyahub/application/redux/states/contraceptive_state.dart';
import 'package:myafyahub/application/redux/states/tb_state.dart';
import 'package:myafyahub/application/redux/states/violence_state.dart';
import 'package:myafyahub/domain/core/entities/core/screening_question.dart';
import 'package:myafyahub/domain/core/entities/core/screening_questions_list.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:shared_themes/spaces.dart';

class ScreeningToolQuestionWidget extends StatefulWidget {
  const ScreeningToolQuestionWidget({
    required this.screeningToolsQuestions,
    required this.screeningToolsType,
  });

  final List<ScreeningQuestion> screeningToolsQuestions;
  final ScreeningToolsType screeningToolsType;

  @override
  State<ScreeningToolQuestionWidget> createState() =>
      _ScreeningToolQuestionWidgetState();
}

// update the respective state
void updateScreeningToolsQuestions({
  required ScreeningToolsType toolsType,
  required BuildContext context,
  required List<ScreeningQuestion> questions,
}) {
  switch (toolsType) {
    case ScreeningToolsType.VIOLENCE_ASSESSMENT:
      StoreProvider.dispatch(
        context,
        UpdateScreeningToolsState(
          violenceState: ViolenceState(
            screeningQuestions:
                ScreeningQuestionsList(screeningQuestionsList: questions),
          ),
        ),
      );
      break;

    case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
      StoreProvider.dispatch(
        context,
        UpdateScreeningToolsState(
          contraceptiveState: ContraceptiveState(
            screeningQuestions:
                ScreeningQuestionsList(screeningQuestionsList: questions),
          ),
        ),
      );
      break;

    case ScreeningToolsType.TB_ASSESSMENT:
      StoreProvider.dispatch(
        context,
        UpdateScreeningToolsState(
          tbState: TBState(
            screeningQuestions:
                ScreeningQuestionsList(screeningQuestionsList: questions),
          ),
        ),
      );
      break;
    default:
      StoreProvider.dispatch(
        context,
        UpdateScreeningToolsState(
          alcoholSubstanceUseState: AlcoholSubstanceUseState(
            screeningQuestions:
                ScreeningQuestionsList(screeningQuestionsList: questions),
          ),
        ),
      );
      break;
  }
}

class _ScreeningToolQuestionWidgetState
    extends State<ScreeningToolQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.screeningToolsQuestions.length,
      itemBuilder: (BuildContext context, int index) {
        // choices
        final Map<String, dynamic> choices =
            widget.screeningToolsQuestions[index].responseChoices!;

        // sequence number
        final int sequenceNumber =
            widget.screeningToolsQuestions[index].sequence!;

        final List<MoodSymptomWidget> symptomWidgets = <MoodSymptomWidget>[];

        // question text
        final String questionText =
            '${sequenceNumber + 1}. ${widget.screeningToolsQuestions[index].questionText!} ';

        // if question has an answer
        final bool hasAnswer =
            widget.screeningToolsQuestions[index].answer == null ? false : true;

        // create symptomWidget for each of the choices
        choices.forEach((String key, dynamic value) {
          symptomWidgets.add(
            MoodSymptomWidget(
              title: value as String,
              isSelected: hasAnswer &&
                  key == widget.screeningToolsQuestions[index].answer,
              gestureKey: Key('$sequenceNumber$key'),
              onTap: () {
                setState(() {});
                final List<ScreeningQuestion> questions =
                    widget.screeningToolsQuestions;
                // create a new question with the initial values and add answer to it
                final ScreeningQuestion question =
                    widget.screeningToolsQuestions
                        .firstWhere(
                          (ScreeningQuestion screeningQuestion) =>
                              screeningQuestion.id ==
                              widget.screeningToolsQuestions[index].id,
                        )
                        .copyWith(answer: key.toString());
                // replace the newly formed question in the list
                questions.replaceRange(
                  index,
                  index + 1,
                  <ScreeningQuestion>[question],
                );
                // update the respective state
                updateScreeningToolsQuestions(
                  context: context,
                  toolsType: widget.screeningToolsType,
                  questions: questions,
                );
              },
            ),
          );
        });
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.screeningToolsQuestions[index].meta != null)
              Text(
                widget.screeningToolsQuestions[index].meta!['violence_type']
                    as String,
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
