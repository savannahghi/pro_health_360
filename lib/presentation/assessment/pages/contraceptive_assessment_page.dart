import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/answer_screening_tools_action.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/fetch_screening_questions_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/screening_tools/screening_tools_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/assessment/widgets/contraceptive_information.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/violence_assessment/widgets/screening_tools_question_widget.dart';
import 'package:shared_themes/spaces.dart';

class ContraceptiveAssessmentPage extends StatefulWidget {
  const ContraceptiveAssessmentPage();

  @override
  State<ContraceptiveAssessmentPage> createState() =>
      _ContraceptiveAssessmentPageState();
}

class _ContraceptiveAssessmentPageState
    extends State<ContraceptiveAssessmentPage> {
  @override
  void didChangeDependencies() {
    StoreProvider.dispatch(
      context,
      FetchScreeningToolsQuestionsAction(
        screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
        client: AppWrapperBase.of(context)!.graphQLClient,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: contraceptiveAssessmentTitle,
      ),
      body: StoreConnector<AppState, ScreeningToolsViewModel>(
        converter: (Store<AppState> store) {
          return ScreeningToolsViewModel.fromStore(store);
        },
        builder: (BuildContext context, ScreeningToolsViewModel vm) {
          if (vm.wait!.isWaitingFor(fetchingContraceptivesQuestionsFlag)) {
            return const PlatformLoader();
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              text: contraceptiveAssessmentDescription,
                              style: normalSize14Text(
                                AppColors.greyTextColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ifYouIntendToUse,
                                  style: normalSize14Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    size15VerticalSizedBox,
                    // questions
                    ScreeningToolQuestionWidget(
                      screeningToolsQuestions: vm.contraceptiveState!
                          .screeningQuestions!.screeningQuestionsList!,
                      screeningToolsType:
                          ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
                    ),

                    largeVerticalSizedBox,
                    const ContraceptivesInformation(),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: MyAfyaHubPrimaryButton(
                        buttonKey: contraceptiveAssessmentFeedbackButtonKey,
                        onPressed: () {
                          StoreProvider.dispatch(
                            context,
                            AnswerScreeningToolsAction(
                              client: AppWrapperBase.of(context)!.graphQLClient,
                              screeningToolsType:
                                  ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
                            ),
                          );
                        },
                        buttonColor: AppColors.primaryColor,
                        borderColor: Colors.transparent,
                        customChild: vm.wait!
                                .isWaitingFor(answerScreeningQuestionsFlag)
                            ? const PlatformLoader()
                            : Text(
                                submitAssessment,
                                style: veryBoldSize15Text(AppColors.whiteColor),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
